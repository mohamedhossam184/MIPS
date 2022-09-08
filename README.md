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
1- get factorial of "7" 
2- get fibonnaci serise

# datapath


![MIPS](https://user-images.githubusercontent.com/84816935/189123471-a72572c6-3016-4ed2-8510-4da7518b54c1.png)

# stages


![MIPS_Stages](https://user-images.githubusercontent.com/84816935/189123812-bbfd71cf-ae39-410d-8a2e-d33c296e5534.png)

#instructions format


![MIPS_instruction](https://user-images.githubusercontent.com/84816935/189124151-d7efc84c-dc49-4dd2-9148-e8dd34d2790e.png)

