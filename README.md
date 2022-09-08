# MIPS
MIPS_Architecture_32_bits_pipelined_design.
In my project i use two clocks to decrease time needed to perform instructions and to prevent interference betwwen instructions
I divide muy architecture into four stages:
1- fetch stage: at this stage we get instruction from the memory and this stage works at positive edge of clk1.
2- decoding stage: at this stage we get variables from resgister file, this stage depends on opcode at instruction and this stage works at positive edge of clk2.
3- executing stage: at this stage we calculate ALU output, this stage depends on opcode in instruction and works at positive edge of clk1.
4- storing stage: at this stage we store variables either in memory or in register file according to opcode at instruction and this stage works at positive edge of clk2. 
My design is simulated in modelsim tool.
I ran two programs to test my design:
1- get factorial of 7 
2- get fibonnaci serise

datapath
