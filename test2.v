module test2;
//testbench for fibonnaci serise

reg clk1,clk2;
MIPS_32_BITS MIPS2(clk1,clk2);
integer i;
initial
begin
clk1=0;
clk2=0;
end
initial
begin
repeat(200)
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
MIPS2.Reg[i]=i;
MIPS2.PC=0;
MIPS2.mem[0]=32'b 00000000000000010101000000000000;
MIPS2.mem[1]=32'b 00100100000000010000000011001000;
MIPS2.mem[2]=32'b 00100100000000010000000011001001;   
MIPS2.mem[3]=32'b 00000011111111111111100000000000;  //dummy instruction to prevent interference between instructions
MIPS2.mem[4]=32'b 00100000000000100000000011001000;
MIPS2.mem[5]=32'b 00100000000000110000000011001001;
MIPS2.mem[6]=32'b 00000010000100001000000000000000;  //dummy instruction to prevent interference between instructions  
MIPS2.mem[7]=32'b 00100100000000110000000011001000;
MIPS2.mem[8]=32'b 00000000010000110010000000000000;
MIPS2.mem[9]=32'b 00000011111111111111100000000000;  //dummy instruction to prevent interference between instructions
MIPS2.mem[10]=32'b 00100100000001000000000011001001;  
MIPS2.mem[11]=32'b 00110111111000001111111111111000;  

end

initial
begin
#5000 $finish;
end
endmodule
 
