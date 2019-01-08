module ID_EX_Register( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_id_pc, // @[:@6.4]
  input  [31:0] io_id_rs1_out, // @[:@6.4]
  input  [31:0] io_id_rs2_out, // @[:@6.4]
  input  [31:0] io_id_imm, // @[:@6.4]
  input  [31:0] io_id_inst, // @[:@6.4]
  input  [4:0]  io_id_rs1, // @[:@6.4]
  input  [4:0]  io_id_rs2, // @[:@6.4]
  input         io_ALU_Src, // @[:@6.4]
  input  [2:0]  io_ALUOp, // @[:@6.4]
  input         io_Branch, // @[:@6.4]
  input         io_Mem_Read, // @[:@6.4]
  input         io_Mem_Write, // @[:@6.4]
  input         io_Reg_Write, // @[:@6.4]
  input         io_Mem_to_Reg, // @[:@6.4]
  output        io_ex_ALU_Src, // @[:@6.4]
  output [2:0]  io_ex_ALUOp, // @[:@6.4]
  output        io_ex_Branch, // @[:@6.4]
  output        io_ex_Mem_Read, // @[:@6.4]
  output        io_ex_Mem_Write, // @[:@6.4]
  output        io_ex_Reg_Write, // @[:@6.4]
  output        io_ex_Mem_to_Reg, // @[:@6.4]
  output [31:0] io_ex_pc, // @[:@6.4]
  output [31:0] io_ex_rs1_out, // @[:@6.4]
  output [31:0] io_ex_rs2_out, // @[:@6.4]
  output [4:0]  io_ex_rd, // @[:@6.4]
  output [31:0] io_ex_imm, // @[:@6.4]
  output [4:0]  io_ex_rs1, // @[:@6.4]
  output [4:0]  io_ex_rs2, // @[:@6.4]
  output [31:0] io_ex_inst // @[:@6.4]
);
  reg [31:0] pc; // @[ID_EX_Register.scala 61:28:@8.4]
  reg [31:0] _RAND_0;
  reg [31:0] rs1_out; // @[ID_EX_Register.scala 62:28:@9.4]
  reg [31:0] _RAND_1;
  reg [31:0] rs2_out; // @[ID_EX_Register.scala 63:28:@10.4]
  reg [31:0] _RAND_2;
  reg [31:0] imm; // @[ID_EX_Register.scala 64:28:@11.4]
  reg [31:0] _RAND_3;
  reg [31:0] inst; // @[ID_EX_Register.scala 65:28:@12.4]
  reg [31:0] _RAND_4;
  reg [31:0] rs1; // @[ID_EX_Register.scala 66:28:@13.4]
  reg [31:0] _RAND_5;
  reg [31:0] rs2; // @[ID_EX_Register.scala 67:28:@14.4]
  reg [31:0] _RAND_6;
  reg  alu_src; // @[ID_EX_Register.scala 68:28:@15.4]
  reg [31:0] _RAND_7;
  reg [2:0] aluop; // @[ID_EX_Register.scala 69:28:@16.4]
  reg [31:0] _RAND_8;
  reg  branch; // @[ID_EX_Register.scala 70:28:@17.4]
  reg [31:0] _RAND_9;
  reg  mem_read; // @[ID_EX_Register.scala 71:28:@18.4]
  reg [31:0] _RAND_10;
  reg  mem_write; // @[ID_EX_Register.scala 72:28:@19.4]
  reg [31:0] _RAND_11;
  reg  reg_write; // @[ID_EX_Register.scala 73:28:@20.4]
  reg [31:0] _RAND_12;
  reg  mem_to_reg; // @[ID_EX_Register.scala 74:28:@21.4]
  reg [31:0] _RAND_13;
  assign io_ex_ALU_Src = alu_src; // @[ID_EX_Register.scala 93:21:@36.4]
  assign io_ex_ALUOp = aluop; // @[ID_EX_Register.scala 94:21:@37.4]
  assign io_ex_Branch = branch; // @[ID_EX_Register.scala 95:21:@38.4]
  assign io_ex_Mem_Read = mem_read; // @[ID_EX_Register.scala 96:21:@39.4]
  assign io_ex_Mem_Write = mem_write; // @[ID_EX_Register.scala 97:21:@40.4]
  assign io_ex_Reg_Write = reg_write; // @[ID_EX_Register.scala 98:21:@41.4]
  assign io_ex_Mem_to_Reg = mem_to_reg; // @[ID_EX_Register.scala 99:21:@42.4]
  assign io_ex_pc = pc; // @[ID_EX_Register.scala 100:21:@43.4]
  assign io_ex_rs1_out = rs1_out; // @[ID_EX_Register.scala 101:21:@44.4]
  assign io_ex_rs2_out = rs2_out; // @[ID_EX_Register.scala 102:21:@45.4]
  assign io_ex_rd = inst[11:7]; // @[ID_EX_Register.scala 107:21:@51.4]
  assign io_ex_imm = imm; // @[ID_EX_Register.scala 105:21:@48.4]
  assign io_ex_rs1 = rs1[4:0]; // @[ID_EX_Register.scala 103:21:@46.4]
  assign io_ex_rs2 = rs2[4:0]; // @[ID_EX_Register.scala 104:21:@47.4]
  assign io_ex_inst = inst; // @[ID_EX_Register.scala 106:21:@49.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rs1_out = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rs2_out = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  imm = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  inst = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  rs1 = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  rs2 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  alu_src = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  aluop = _RAND_8[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  branch = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  mem_read = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  mem_write = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  reg_write = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  mem_to_reg = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      pc <= 32'h0;
    end else begin
      pc <= io_id_pc;
    end
    if (reset) begin
      rs1_out <= 32'h0;
    end else begin
      rs1_out <= io_id_rs1_out;
    end
    if (reset) begin
      rs2_out <= 32'h0;
    end else begin
      rs2_out <= io_id_rs2_out;
    end
    if (reset) begin
      imm <= 32'h0;
    end else begin
      imm <= io_id_imm;
    end
    if (reset) begin
      inst <= 32'h0;
    end else begin
      inst <= io_id_inst;
    end
    if (reset) begin
      rs1 <= 32'h0;
    end else begin
      rs1 <= {{27'd0}, io_id_rs1};
    end
    if (reset) begin
      rs2 <= 32'h0;
    end else begin
      rs2 <= {{27'd0}, io_id_rs2};
    end
    if (reset) begin
      alu_src <= 1'h0;
    end else begin
      alu_src <= io_ALU_Src;
    end
    if (reset) begin
      aluop <= 3'h0;
    end else begin
      aluop <= io_ALUOp;
    end
    if (reset) begin
      branch <= 1'h0;
    end else begin
      branch <= io_Branch;
    end
    if (reset) begin
      mem_read <= 1'h0;
    end else begin
      mem_read <= io_Mem_Read;
    end
    if (reset) begin
      mem_write <= 1'h0;
    end else begin
      mem_write <= io_Mem_Write;
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_Reg_Write;
    end
    if (reset) begin
      mem_to_reg <= 1'h0;
    end else begin
      mem_to_reg <= io_Mem_to_Reg;
    end
  end
endmodule
