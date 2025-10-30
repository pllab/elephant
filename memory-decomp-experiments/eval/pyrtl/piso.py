import pyrtl

def parallel4_in_serial_out(reset, valid_in, data_in, ready_in):
    # reset: WireVector(1)
    # valid_in: WireVector(1)
    # data_in: Array of WireVectors(<some width>) [4]
    # ready_in: WireVector(1)
    ready_out = pyrtl.WireVector(1)
    valid_out = pyrtl.WireVector(1)
    data_out  = pyrtl.WireVector(len(data_in[0]))#, 'piso_data_out')

    RECEIVE, TRANSMIT = [pyrtl.Const(x, bitwidth=1) for x in range(2)]

    state_r   = pyrtl.Register(1, 'state_r')
    state_n   = pyrtl.Register(1, 'state_n')
    data_r    = [pyrtl.Register(len(data_in[0]), name=f"data_r_{i}") for i in range(4)]
    shift_ctr_r = pyrtl.Register(2, 'shift_ctr_r')

    done_transmit = pyrtl.WireVector(1)
    shift_ctr_n = pyrtl.WireVector(2)#, 'shift_ctr_n')

    # Done transmission signal.
    # We just finished with the current transmission if all of the following are true:
    #   - we're in the TRANSMIT state
    #   - we're sending the last word
    #   - the consumer is accepting this data
    done_transmit <<= (state_r == TRANSMIT) & (shift_ctr_r == 3) & ready_in

    # Ready out signal.
    # We're ready for new input data if either is true:
    #   - we're in the RECEIVE state already
    #   - we're sending the last word and it is being accepted (i.e. 'done_transmit' is true)
    ready_out <<= (state_r == RECEIVE) | done_transmit

    # Valid out signal
    # Meaning the output is valid, which occurs iff we're transmitting
    valid_out <<= (state_r == TRANSMIT)

    # Data out signal
    # The word we've shifted to
    data_out <<= pyrtl.corecircuits.mux(shift_ctr_n, data_r[0], data_r[1], data_r[2], data_r[3])

    # State machine logic.
    with pyrtl.conditional_assignment:
        with reset:
            state_r.next |= RECEIVE
        with pyrtl.otherwise:
            state_r.next |= state_n

    with pyrtl.conditional_assignment:
        with ready_out & valid_in:
            state_n.next |= TRANSMIT
        with done_transmit:
            state_n.next |= RECEIVE
        with pyrtl.otherwise:
            state_n.next |= state_r

    # Input data logic.
    with pyrtl.conditional_assignment:
        with reset:
            for i in range(4):
                data_r[i].next |= 0
        with ready_out & valid_in:
            for i in range(4):
                data_r[i].next |= data_in[i]

    # Shift counter logic.
    # Stores the bit we're transmitting
    with pyrtl.conditional_assignment:
        with reset:
            shift_ctr_r.next |= 0
        with ready_out & valid_in:
            shift_ctr_r.next |= 0
        with pyrtl.otherwise:
            shift_ctr_r.next |= shift_ctr_n

    shift_ctr_n <<= pyrtl.corecircuits.select((state_r == TRANSMIT) & ready_in & ~done_transmit, shift_ctr_r + 1, shift_ctr_r)

    return (ready_out, valid_out, data_out)


BITWIDTH = 4
data_in = [pyrtl.Input(BITWIDTH, f"data_in_{i}") for i in range(BITWIDTH)]
valid_in = pyrtl.Input(1, 'valid_in')
ready_in = pyrtl.Input(1, 'ready_in')
reset_in = pyrtl.Input(1, 'reset_in')

data_out = pyrtl.Output(BITWIDTH, 'data_out')
ready_out = pyrtl.Output(1, 'ready_out')
valid_out = pyrtl.Output(1, 'valid_out')

(ro, vo, do) = parallel4_in_serial_out(reset_in, valid_in, data_in, ready_in)
ready_out <<= ro
valid_out <<= vo
data_out <<= do

with open('piso.v', 'w') as f:
    pyrtl.output_to_verilog(f, add_reset=False)
