module DataCache( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_addr, // @[:@6.4]
  input  [31:0] io_write_data, // @[:@6.4]
  input         io_Mem_Read, // @[:@6.4]
  input         io_Mem_Write, // @[:@6.4]
  output [31:0] io_data_out // @[:@6.4]
);
  reg [31:0] cache [0:31]; // @[DataCache.scala 27:18:@8.4]
  reg [31:0] _RAND_0;
  wire [31:0] cache__T_22_data; // @[DataCache.scala 27:18:@8.4]
  wire [4:0] cache__T_22_addr; // @[DataCache.scala 27:18:@8.4]
  wire [31:0] cache__T_26_data; // @[DataCache.scala 27:18:@8.4]
  wire [4:0] cache__T_26_addr; // @[DataCache.scala 27:18:@8.4]
  wire [31:0] cache__T_19_data; // @[DataCache.scala 27:18:@8.4]
  wire [4:0] cache__T_19_addr; // @[DataCache.scala 27:18:@8.4]
  wire  cache__T_19_mask; // @[DataCache.scala 27:18:@8.4]
  wire  cache__T_19_en; // @[DataCache.scala 27:18:@8.4]
  wire [31:0] fix_addr; // @[DataCache.scala 29:26:@9.4]
  assign cache__T_22_addr = fix_addr[4:0];
  assign cache__T_22_data = cache[cache__T_22_addr]; // @[DataCache.scala 27:18:@8.4]
  assign cache__T_26_addr = fix_addr[4:0];
  assign cache__T_26_data = cache[cache__T_26_addr]; // @[DataCache.scala 27:18:@8.4]
  assign cache__T_19_data = io_Mem_Write ? io_write_data : cache__T_22_data;
  assign cache__T_19_addr = fix_addr[4:0];
  assign cache__T_19_mask = 1'h1;
  assign cache__T_19_en = 1'h1;
  assign fix_addr = io_addr / 32'h4; // @[DataCache.scala 29:26:@9.4]
  assign io_data_out = io_Mem_Read ? cache__T_26_data : 32'h0; // @[DataCache.scala 31:15:@21.4]
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
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    cache[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(cache__T_19_en & cache__T_19_mask) begin
      cache[cache__T_19_addr] <= cache__T_19_data; // @[DataCache.scala 27:18:@8.4]
    end
  end
endmodule
