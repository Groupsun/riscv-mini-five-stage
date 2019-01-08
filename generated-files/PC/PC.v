module PC( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_addr_input, // @[:@6.4]
  input         io_pc_write, // @[:@6.4]
  output [31:0] io_pc_out // @[:@6.4]
);
  reg [31:0] PC_reg; // @[PC.scala 16:23:@8.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_14; // @[PC.scala 18:16:@10.4]
  assign _T_14 = io_pc_write ? io_addr_input : PC_reg; // @[PC.scala 18:16:@10.4]
  assign io_pc_out = PC_reg; // @[PC.scala 19:13:@12.4]
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
  PC_reg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      PC_reg <= 32'h0;
    end else begin
      if (io_pc_write) begin
        PC_reg <= io_addr_input;
      end
    end
  end
endmodule
