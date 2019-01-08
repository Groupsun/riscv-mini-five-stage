module IF_ID_Register( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_if_pc, // @[:@6.4]
  input  [31:0] io_if_inst, // @[:@6.4]
  input         io_if_id_write, // @[:@6.4]
  input         io_if_flush, // @[:@6.4]
  output [4:0]  io_id_rs1, // @[:@6.4]
  output [4:0]  io_id_rs2, // @[:@6.4]
  output [31:0] io_id_pc, // @[:@6.4]
  output [31:0] io_id_inst // @[:@6.4]
);
  reg [31:0] pc_reg; // @[IF_ID_Register.scala 27:23:@8.4]
  reg [31:0] _RAND_0;
  reg [31:0] inst_reg; // @[IF_ID_Register.scala 28:25:@9.4]
  reg [31:0] _RAND_1;
  wire [31:0] _T_28; // @[IF_ID_Register.scala 31:8:@12.4]
  wire [31:0] _T_29; // @[IF_ID_Register.scala 30:16:@13.4]
  wire [31:0] _T_33; // @[IF_ID_Register.scala 34:8:@17.4]
  wire [31:0] _T_34; // @[IF_ID_Register.scala 33:18:@18.4]
  assign _T_28 = io_if_id_write ? io_if_pc : pc_reg; // @[IF_ID_Register.scala 31:8:@12.4]
  assign _T_29 = io_if_flush ? 32'h0 : _T_28; // @[IF_ID_Register.scala 30:16:@13.4]
  assign _T_33 = io_if_id_write ? io_if_inst : inst_reg; // @[IF_ID_Register.scala 34:8:@17.4]
  assign _T_34 = io_if_flush ? 32'h0 : _T_33; // @[IF_ID_Register.scala 33:18:@18.4]
  assign io_id_rs1 = inst_reg[19:15]; // @[IF_ID_Register.scala 38:13:@23.4]
  assign io_id_rs2 = inst_reg[24:20]; // @[IF_ID_Register.scala 39:13:@25.4]
  assign io_id_pc = pc_reg; // @[IF_ID_Register.scala 36:12:@20.4]
  assign io_id_inst = inst_reg; // @[IF_ID_Register.scala 37:14:@21.4]
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
  pc_reg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  inst_reg = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      pc_reg <= 32'h0;
    end else begin
      if (io_if_flush) begin
        pc_reg <= 32'h0;
      end else begin
        if (io_if_id_write) begin
          pc_reg <= io_if_pc;
        end
      end
    end
    if (reset) begin
      inst_reg <= 32'h0;
    end else begin
      if (io_if_flush) begin
        inst_reg <= 32'h0;
      end else begin
        if (io_if_id_write) begin
          inst_reg <= io_if_inst;
        end
      end
    end
  end
endmodule
