# Verilog_study
Basic circuits written in Verilog

# Root directory
The verilog codes in the root directory are the basic training of coding, such as DFF, latch,multiplexer,etc.

# Synthesizable_verilog
Files in "./synthesizable_verilog" are some a little complex deisgns selected to do logic synthesis based on DesignCompiler.

PS: Some codes are changed slightly in structure in order to be implemented logic synthesis.

The cell library I use for Logic Synthesis is CNFET7, an Open-source cell library for carbon-nanotubes FET in 7nm node.

URL:https://github.com/uec-hpc-lab/CNFET-OCL

# Gate_netlist
The gate netlist that DesignCompiler output,
by using commmad:

write -format verilog -output /path
  
# Tools
I use iverilog + gtkwave as the basic simulation for tesetbench.
