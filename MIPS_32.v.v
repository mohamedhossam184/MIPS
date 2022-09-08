// MIPS_32BITS_ARCHITECTURE
// PIPELINED MIPS
// MOHAMED HOSSAM TAHA

module MIPS_32_BITS(clk1,clk2);
input clk1,clk2;   // two clocks
reg [31:0] PC;      //program counter
reg [31:0] IF_IR,IF_PC;   //fetch stage variables
reg [31:0] ID_IR ,ID_A,ID_B,ID_IMMEDIATE,ID_C,ID_PC;  //decoding stage variables
reg [31:0] EX_IR,EX_ALUOUT,EX_PC;            //execution stage variables
reg [31:0] M_IR,M_PC;       
reg [31:0] Reg [0:31];       //register file
reg [31:0] mem [0:1024];   //memory
reg jump=0;

parameter ADD=6'b 000000,SUB=6'b000001,AND=6'b000010,OR=6'b000011,SLT=6'b000100,MUL=6'b000101,HLT=6'b111111,LOAD=6'b001000,STORE=6'b001001,ADDI=6'b001010,SUBI=6'b001011,SLTI=6'b001100,BNEQZ=6'b001101,BEQZ=6'b001110,JUMP=6'b010000;


always @ (posedge clk1)      //fetch stage
begin
IF_IR <=#2 mem[PC];
IF_PC<=#2 PC+1;
PC <=#2 PC+1;
end

always @ (posedge clk2)                //Decoding stage
begin
ID_IR <=#2 IF_IR;
ID_PC <=#2 IF_PC;

case (IF_IR[31:26])
ADD,SUB,AND,OR,MUL,SLT:
begin
ID_A<=#2 Reg[IF_IR[25:21]];
ID_B<=#2 Reg[IF_IR[20:16]];
ID_IMMEDIATE<=#2 0;
end
LOAD,STORE,SLTI,ADDI,SUBI:
begin
ID_A<=#2 Reg[IF_IR[25:21]];
ID_B<=#2 Reg[IF_IR[20:16]];
ID_IMMEDIATE <=#2 {{16{IF_IR[15]}},IF_IR[15:0]};
end
JUMP: PC<=#2 {PC[31:28],IF_IR[25:0],2'b00};
BNEQZ:
begin
if(Reg[IF_IR[25:21]]!=0)
PC<=#2 PC + {{16{IF_IR[15]}},IF_IR[15:0]};
end
BEQZ:
begin
if(Reg[IF_IR[25:21]]==0)
PC<=#2 PC + {{16{IF_IR[15]}},IF_IR[15:0]};
end
endcase
end

always @ (posedge clk1)    //execution stage
begin
EX_IR<=#2 ID_IR;
EX_PC<=#2 ID_PC;
case (ID_IR[31:26])
ADD:   EX_ALUOUT<=#2 ID_A + ID_B;
SUB:   EX_ALUOUT<=#2 ID_A - ID_B;
AND:   EX_ALUOUT<=#2 ID_A & ID_B;
OR:   EX_ALUOUT<=#2 ID_A | ID_B;
MUL:   EX_ALUOUT<=#2 ID_A * ID_B;
SLT:   EX_ALUOUT<=#2 ID_A < ID_B;
LOAD:   EX_ALUOUT<=#2 ID_A + ID_IMMEDIATE;
STORE:   EX_ALUOUT<=#2 ID_A + ID_IMMEDIATE;
SLTI:   EX_ALUOUT<=#2 ID_A < ID_IMMEDIATE;
ADDI:   EX_ALUOUT<=#2 ID_A + ID_IMMEDIATE;
SUBI:   EX_ALUOUT<=#2 ID_A - ID_IMMEDIATE;
endcase
end


always @ (posedge clk2)    //storing stage
begin
M_IR<=#2 EX_IR;
M_PC<=#2 EX_PC;
case (EX_IR[31:26])	
ADD:  Reg[EX_IR[15:11]]<=#2 EX_ALUOUT;
SUB:   Reg[EX_IR[15:11]]<=#2 EX_ALUOUT;
AND:  Reg[EX_IR[15:11]]<=#2 EX_ALUOUT;
OR:   Reg[EX_IR[15:11]]<=#2 EX_ALUOUT;
MUL:   Reg[EX_IR[15:11]]<=#2 EX_ALUOUT;
SLT:   Reg[EX_IR[15:11]]<=#2 EX_ALUOUT;
LOAD:   Reg[EX_IR[20:16]]<=#2 mem[EX_ALUOUT];
STORE:   mem[EX_ALUOUT]<=#2 Reg[EX_IR[20:16]];
ADDI:   Reg[EX_IR[20:16]]<=#2 EX_ALUOUT;
SUBI: Reg[EX_IR[20:16]]<=#2 EX_ALUOUT;
SLTI:  Reg[EX_IR[20:16]]<=#2 EX_ALUOUT;
endcase
end
endmodule



