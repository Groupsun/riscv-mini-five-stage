module MEM_WB_Register( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_mem_dataout, // @[:@6.4]
  input  [31:0] io_mem_alu_sum, // @[:@6.4]
  input  [4:0]  io_mem_rd, // @[:@6.4]
  input         io_mem_Mem_to_Reg, // @[:@6.4]
  input         io_mem_Reg_Write, // @[:@6.4]
  output        io_wb_Mem_to_Reg, // @[:@6.4]
  output        io_wb_Reg_Write, // @[:@6.4]
  output [31:0] io_wb_dataout, // @[:@6.4]
  output [31:0] io_wb_alu_sum, // @[:@6.4]
  output [4:0]  io_wb_rd // @[:@6.4]
);
  reg [31:0] dataout; // @[MEM_WB_Register.scala 37:28:@8.4]
  reg [31:0] _RAND_0;
  reg [31:0] alu_sum; // @[MEM_WB_Register.scala 38:28:@9.4]
  reg [31:0] _RAND_1;
  reg [4:0] rd; // @[MEM_WB_Register.scala 39:28:@10.4]
  reg [31:0] _RAND_2;
  reg  mem_to_reg; // @[MEM_WB_Register.scala 40:28:@11.4]
  reg [31:0] _RAND_3;
  reg  reg_write; // @[MEM_WB_Register.scala 41:28:@12.4]
  reg [31:0] _RAND_4;
  assign io_wb_Mem_to_Reg = mem_to_reg; // @[MEM_WB_Register.scala 51:21:@18.4]
  assign io_wb_Reg_Write = reg_write; // @[MEM_WB_Register.scala 52:21:@19.4]
  assign io_wb_dataout = dataout; // @[MEM_WB_Register.scala 53:21:@20.4]
  assign io_wb_alu_sum = alu_sum; // @[MEM_WB_Register.scala 54:21:@21.4]
  assign io_wb_rd = rd; // @[MEM_WB_Register.scala 55:21:@22.4]
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
  dataout = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  alu_sum = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rd = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  mem_to_reg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  reg_write = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      dataout <= 32'h0;
    end else begin
      dataout <= io_mem_dataout;
    end
    if (reset) begin
      alu_sum <= 32'h0;
    end else begin
      alu_sum <= io_mem_alu_sum;
    end
    if (reset) begin
      rd <= 5'h0;
    end else begin
      rd <= io_mem_rd;
    end
    if (reset) begin
      mem_to_reg <= 1'h0;
    end else begin
      mem_to_reg <= io_mem_Mem_to_Reg;
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_mem_Reg_Write;
    end
  end
endmodule
