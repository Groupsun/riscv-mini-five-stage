module EX_MEM_Register( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_ex_branch_addr, // @[:@6.4]
  input  [31:0] io_ex_alu_sum, // @[:@6.4]
  input  [31:0] io_ex_alu_zero, // @[:@6.4]
  input  [31:0] io_ex_rs2_out, // @[:@6.4]
  input  [4:0]  io_ex_rd, // @[:@6.4]
  input         io_ex_Branch, // @[:@6.4]
  input         io_ex_Mem_Read, // @[:@6.4]
  input         io_ex_Mem_Write, // @[:@6.4]
  input         io_ex_Reg_Write, // @[:@6.4]
  input         io_ex_Mem_to_Reg, // @[:@6.4]
  output        io_mem_Branch, // @[:@6.4]
  output        io_mem_Mem_Read, // @[:@6.4]
  output        io_mem_Mem_Write, // @[:@6.4]
  output        io_mem_Reg_Write, // @[:@6.4]
  output        io_mem_Mem_to_Reg, // @[:@6.4]
  output [31:0] io_mem_branch_addr, // @[:@6.4]
  output        io_mem_alu_zero, // @[:@6.4]
  output [31:0] io_mem_alu_sum, // @[:@6.4]
  output [31:0] io_mem_rs2_out, // @[:@6.4]
  output [4:0]  io_mem_rd // @[:@6.4]
);
  reg [31:0] branch_addr; // @[EX_MEM_Register.scala 49:30:@8.4]
  reg [31:0] _RAND_0;
  reg [31:0] alu_sum; // @[EX_MEM_Register.scala 50:30:@9.4]
  reg [31:0] _RAND_1;
  reg [4:0] alu_zero; // @[EX_MEM_Register.scala 51:30:@10.4]
  reg [31:0] _RAND_2;
  reg [31:0] rs2_out; // @[EX_MEM_Register.scala 52:30:@11.4]
  reg [31:0] _RAND_3;
  reg [4:0] rd; // @[EX_MEM_Register.scala 53:30:@12.4]
  reg [31:0] _RAND_4;
  reg  branch; // @[EX_MEM_Register.scala 55:30:@13.4]
  reg [31:0] _RAND_5;
  reg  mem_read; // @[EX_MEM_Register.scala 56:30:@14.4]
  reg [31:0] _RAND_6;
  reg  mem_write; // @[EX_MEM_Register.scala 57:30:@15.4]
  reg [31:0] _RAND_7;
  reg  reg_write; // @[EX_MEM_Register.scala 58:30:@16.4]
  reg [31:0] _RAND_8;
  reg  mem_to_reg; // @[EX_MEM_Register.scala 59:30:@17.4]
  reg [31:0] _RAND_9;
  assign io_mem_Branch = branch; // @[EX_MEM_Register.scala 79:23:@33.4]
  assign io_mem_Mem_Read = mem_read; // @[EX_MEM_Register.scala 80:23:@34.4]
  assign io_mem_Mem_Write = mem_write; // @[EX_MEM_Register.scala 81:23:@35.4]
  assign io_mem_Reg_Write = reg_write; // @[EX_MEM_Register.scala 82:23:@36.4]
  assign io_mem_Mem_to_Reg = mem_to_reg; // @[EX_MEM_Register.scala 83:23:@37.4]
  assign io_mem_branch_addr = branch_addr; // @[EX_MEM_Register.scala 74:23:@28.4]
  assign io_mem_alu_zero = alu_zero[0]; // @[EX_MEM_Register.scala 76:23:@30.4]
  assign io_mem_alu_sum = alu_sum; // @[EX_MEM_Register.scala 75:23:@29.4]
  assign io_mem_rs2_out = rs2_out; // @[EX_MEM_Register.scala 77:23:@31.4]
  assign io_mem_rd = rd; // @[EX_MEM_Register.scala 78:23:@32.4]
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
  branch_addr = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  alu_sum = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  alu_zero = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rs2_out = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  rd = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  branch = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  mem_read = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mem_write = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  reg_write = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  mem_to_reg = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      branch_addr <= 32'h0;
    end else begin
      branch_addr <= io_ex_branch_addr;
    end
    if (reset) begin
      alu_sum <= 32'h0;
    end else begin
      alu_sum <= io_ex_alu_sum;
    end
    if (reset) begin
      alu_zero <= 5'h0;
    end else begin
      alu_zero <= io_ex_alu_zero[4:0];
    end
    if (reset) begin
      rs2_out <= 32'h0;
    end else begin
      rs2_out <= io_ex_rs2_out;
    end
    if (reset) begin
      rd <= 5'h0;
    end else begin
      rd <= io_ex_rd;
    end
    if (reset) begin
      branch <= 1'h0;
    end else begin
      branch <= io_ex_Branch;
    end
    if (reset) begin
      mem_read <= 1'h0;
    end else begin
      mem_read <= io_ex_Mem_Read;
    end
    if (reset) begin
      mem_write <= 1'h0;
    end else begin
      mem_write <= io_ex_Mem_Write;
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_ex_Reg_Write;
    end
    if (reset) begin
      mem_to_reg <= 1'h0;
    end else begin
      mem_to_reg <= io_ex_Mem_to_Reg;
    end
  end
endmodule
