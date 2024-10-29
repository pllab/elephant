import pyrtl

# FIFO that is demanding in both consumer and producer ends
#
# Ready-valid interface for both enqueuing and dequeing into a fifo
# Its consumer side is demanding (emits 'ready_out' only after receiving 'valid_in')
# Its producer side is demanding (emits 'valid_out' only after receiving 'ready_in')
#      --------------
#  -> | d_in   d_out | ->
#  -> | v_in   v_out | ->
#  <- | r_out   r_in | <-
#      --------------
def fifo(valid_in, ready_in, data_in, max_els, reset, prefix):
    valid_out = pyrtl.WireVector(1)#, prefix + "_valid_out")
    ready_out = pyrtl.WireVector(1)#, prefix + "_ready_out")
    data_out  = pyrtl.WireVector(len(data_in))#, prefix + "_data_out")

    queue = pyrtl.MemBlock(len(data_in), len(pyrtl.as_wires(max_els)), max_read_ports=1)

    count = pyrtl.Register(len(pyrtl.as_wires(max_els)))#, prefix + "_count")
    head = pyrtl.Register(len(pyrtl.as_wires(max_els)))#, prefix + "_head")
    tail = pyrtl.Register(len(pyrtl.as_wires(max_els)))#, prefix + "_tail")

    ### Ready to receive if not full and current incoming data is valid
    ready_out <<= (count != max_els) & valid_in

    ### Emitting valid data if not empty and consumer is ready
    valid_out <<= (count != 0) & ready_in

    ### Enqueue when valid_in is high and we're ready for input data
    enqueue = valid_in & ready_out

    ### Dequeue when ready_in is high and we're emitting valid output data
    dequeue = valid_out & ready_in

    ### Always be emitting data, even if it's not "valid"/being dequeued b/c consumer isn't "ready"
    data_out <<= queue[head]

    with pyrtl.conditional_assignment:
        with reset:
            count.next |= 0
            head.next |= 0
            tail.next |= max_els - 1
        with enqueue:
            # i.e. (tail + 1) mod max_els
            with (tail + 1) == max_els:
                tail.next |= 0
                queue[0] |= data_in
            with pyrtl.otherwise:
                index = pyrtl.WireVector(len(tail))#, prefix + "_index")
                index <<= tail + 1
                tail.next |= index
                queue[index] |= data_in

            count.next |= count + 1
        with dequeue:
            # i.e. (tail + 1) mod max_els
            count.next |= count - 1
            with (head + 1) == max_els:
                head.next |= 0
            with pyrtl.otherwise:
                head.next |= (head + 1)
    
    # pyrtl.probe(valid_out, 'valid_out')
    # pyrtl.probe(ready_out, 'ready_out')
    # pyrtl.probe(data_out, 'data_out')
    # pyrtl.probe(head, 'head')
    # pyrtl.probe(tail, 'tail')
    pyrtl.probe(count, prefix + "_count_probe")

    return valid_out, ready_out, data_out

BITWIDTH = 8
producer_data_in = pyrtl.Input(BITWIDTH, 'producer_data_in')
producer_valid_in = pyrtl.Input(1, 'producer_valid_in')
fifo_ready_out = pyrtl.Output(1, 'fifo_ready_out')

consumer_ready_in = pyrtl.Input(1, 'consumer_ready_in')
fifo_data_out = pyrtl.Output(BITWIDTH, 'fifo_data_out')
fifo_valid_out = pyrtl.Output(BITWIDTH, 'fifo_valid_out')

reset_in = pyrtl.Input(1, 'reset_in')

MAX_ELS = 5
PREFIX = "f"

valid_out, ready_out, data_out = fifo(producer_valid_in, consumer_ready_in, producer_data_in, MAX_ELS, reset_in, PREFIX)
fifo_valid_out <<= valid_out
fifo_ready_out <<= ready_out
fifo_data_out <<= data_out

with open('fifo.v', 'w') as f:
    pyrtl.output_to_verilog(f, add_reset=False)
