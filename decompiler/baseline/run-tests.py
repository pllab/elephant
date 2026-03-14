from decompile import test_mem

if __name__ == "__main__":
    SCHEMA_PATH = "emap/schema.sql"
    DB_PATH = ":memory:"

    print("-------------------------------------------------------------")
    print("Expected:\twidth=4, height=256, #read-ports=1, #write-ports=1")
    print("-------------------------------------------------------------")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h256_1r1w.json")

    print("-------------------------------------------------------------")
    print("Expected:\twidth=4, height=256, #read-ports=1, #write-ports=2")
    print("-------------------------------------------------------------")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h256_1r2w.json")

    print("-------------------------------------------------------------")
    print("Expected:\twidth=4, height=256, #read-ports=1, #write-ports=3")
    print("-------------------------------------------------------------")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w4h256_1r3w.json")

    print("-------------------------------------------------------------")
    print("Expected:\twidth=32, height=32, #read-ports=2, #write-ports=1")
    print("-------------------------------------------------------------")
    test_mem(SCHEMA_PATH, DB_PATH, "test/simple_mems/mem_w32h32_2r1w.json")

