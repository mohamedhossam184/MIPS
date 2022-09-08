//testbench to get factorial of number

module test1;
reg clk1,clk2;
MIPS_32_BITS MIPS(clk1,clk2);
integer i;
initial
begin
clk1=0;
clk2=0;
end
initial
begin
repeat(50)
begin
#5 clk1=1;
#5 clk1=0;
#5 clk2=1;
#5 clk2=0;
end
end


initial
begin 
for(i=0;i<32;i=i+1)
MIPS.Reg[i]=i;

MIPS.PC=0;
MIPS.mem[200]=7;     //store test number at memory

MIPS.mem[0]=32'b 00101000000000000000000011001000;   
MIPS.mem[1]=32'b 00100000000000010000000011001000;
MIPS.mem[2]=32'b 00000011111111111111100000000000;   //dummy instruction to prevent interference between instructions
MIPS.mem[3]=32'b 00101100001000100000000000000001;
MIPS.mem[4]=32'b 00000010000100001000000000000000;   //dummy instruction to prevent interference between instructions
MIPS.mem[5]=32'b 00010100001000100000100000000000;
MIPS.mem[6]=32'b 00101100010000100000000000000001;  
MIPS.mem[7]=32'b 00000011111111111111100000000000;   //dummy instruction to prevent interference between instructions
MIPS.mem[8]=32'b 00110100010000001111111111111100;
MIPS.mem[9]=32'b 00100100000000010000000000000000;


   

end

initial
begin
#2000 $finish;
end
endmodule
 
