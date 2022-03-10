SetActiveLib -work
comp -include "$dsn\src\crc.vhd" 
comp -include "$dsn\src\TestBench\crc_TB.vhd" 
asim +access +r TESTBENCH_FOR_crc 
wave 
wave -noreg data_in
wave -noreg rst
wave -noreg clk
wave -noreg crc_out
# The following lines can be used for timing simulation
# acom <backannotated_vhdl_file_name>
# comp -include "$dsn\src\TestBench\crc_TB_tim_cfg.vhd" 
# asim +access +r TIMING_FOR_crc 
