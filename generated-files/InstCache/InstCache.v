module InstCache( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_addr, // @[:@6.4]
  output [31:0] io_inst // @[:@6.4]
);
  reg [7:0] cache [0:127]; // @[InstCache.scala 30:18:@8.4]
  reg [31:0] _RAND_0;
  wire [7:0] cache__T_12_data; // @[InstCache.scala 30:18:@8.4]
  wire [6:0] cache__T_12_addr; // @[InstCache.scala 30:18:@8.4]
  wire [7:0] cache__T_17_data; // @[InstCache.scala 30:18:@8.4]
  wire [6:0] cache__T_17_addr; // @[InstCache.scala 30:18:@8.4]
  wire [7:0] cache__T_22_data; // @[InstCache.scala 30:18:@8.4]
  wire [6:0] cache__T_22_addr; // @[InstCache.scala 30:18:@8.4]
  wire [7:0] cache__T_27_data; // @[InstCache.scala 30:18:@8.4]
  wire [6:0] cache__T_27_addr; // @[InstCache.scala 30:18:@8.4]
  wire [32:0] _T_14; // @[InstCache.scala 56:48:@11.4]
  wire [31:0] _T_15; // @[InstCache.scala 56:48:@12.4]
  wire [32:0] _T_19; // @[InstCache.scala 56:70:@15.4]
  wire [31:0] _T_20; // @[InstCache.scala 56:70:@16.4]
  wire [32:0] _T_24; // @[InstCache.scala 56:92:@19.4]
  wire [31:0] _T_25; // @[InstCache.scala 56:92:@20.4]
  wire [15:0] _T_28; // @[Cat.scala 30:58:@23.4]
  wire [15:0] _T_29; // @[Cat.scala 30:58:@24.4]
  assign cache__T_12_addr = io_addr[6:0];
  assign cache__T_12_data = cache[cache__T_12_addr]; // @[InstCache.scala 30:18:@8.4]
  assign cache__T_17_addr = _T_15[6:0];
  assign cache__T_17_data = cache[cache__T_17_addr]; // @[InstCache.scala 30:18:@8.4]
  assign cache__T_22_addr = _T_20[6:0];
  assign cache__T_22_data = cache[cache__T_22_addr]; // @[InstCache.scala 30:18:@8.4]
  assign cache__T_27_addr = _T_25[6:0];
  assign cache__T_27_data = cache[cache__T_27_addr]; // @[InstCache.scala 30:18:@8.4]
  assign _T_14 = io_addr + 32'h1; // @[InstCache.scala 56:48:@11.4]
  assign _T_15 = io_addr + 32'h1; // @[InstCache.scala 56:48:@12.4]
  assign _T_19 = io_addr + 32'h2; // @[InstCache.scala 56:70:@15.4]
  assign _T_20 = io_addr + 32'h2; // @[InstCache.scala 56:70:@16.4]
  assign _T_24 = io_addr + 32'h3; // @[InstCache.scala 56:92:@19.4]
  assign _T_25 = io_addr + 32'h3; // @[InstCache.scala 56:92:@20.4]
  assign _T_28 = {cache__T_22_data,cache__T_27_data}; // @[Cat.scala 30:58:@23.4]
  assign _T_29 = {cache__T_12_data,cache__T_17_data}; // @[Cat.scala 30:58:@24.4]
  assign io_inst = {_T_29,_T_28}; // @[InstCache.scala 56:11:@26.4]
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
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    cache[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
endmodule
