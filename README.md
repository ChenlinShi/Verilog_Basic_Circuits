# Verilog_Basic_Circuits
Basic circuits written in Verilog

# Tools
I use iverilog + gtkwave as the basic simulation for tesetbench, and DesignCompiler for synthesis.

# Directory 
The verilog codes in the "basic_circuits" directory are the basic training of coding, such as DFF, latch,multiplexer,etc.

Files in "./synthesizable_verilog" are some a little complex deisgns selected to do logic synthesis based on DesignCompiler.

Files in  "single_cycle_cpu" are  my attempt to design a simple CPU based on the information from internet. 

Files in "./synthesizable_verilog" can be successfully synthesized with DesignCompiler version of R2020.

File(s) in "./FSM"  is(are) the example(s) of FSM with testbench.

File(s) in "./multiplier"  is(are) the example(s) of multiplier with testbench.


# Testbench 
Prefix "tb" means the testbench of corresponding design, almost every design has a verified testbench. Some test data in testbench is set for easy check, for serious verification, a random number is better.

# Synthesizable_verilog

Some codes are slightly changed in structure in order to be implemented logic synthesis.

The cell library I use for Logic Synthesis is CNFET7, an Open-source cell library for carbon-nanotubes FET in 7nm node.

URL:https://github.com/uec-hpc-lab/CNFET-OCL

# Gate_netlist

Each Gate_netlist is compiled and output by DesignCompiler with the following command.

write -format verilog -output /path

# Finite-State Machine

May help you a little understand the FSM.

Now the only example is a vending machine.

# Multiplier

Now there is an example of 3-stage pipelined 8-bit multiplier.

# Single Cycle CPU

In this directory, it includes the verilog codes and verified testbench codes of each unit.

The "core.v" connects each file to compose the CPU, if you find any bad design or uncomprehensible parts, I will appericiate a message to point out my fault.

The Simple CPU has the following components:

An alu: for  + - & |;

A 32bit_Ripple adder;

A program counter;

An unit to give the next inst_mem_addr for program counter ;

An instruction decoder;

An instrution memory for test : 32bit MIPS ISA;

A data memory(RAM): for sw and lw instructin;

A control unit for using the decoder to give each unit signal ;

Two RegisterFile for using register, but the only the "v2" can work well;

A bit_extension Unit for changing 16 bit imm to 32bit imm;

A shifter for jump instruction, but it is intergrated in the control unit;

Two or three Multiplexers intergrated in "core.v".







