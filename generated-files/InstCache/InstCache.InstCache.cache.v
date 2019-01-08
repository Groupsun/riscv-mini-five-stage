module BindsTo_0_InstCache( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_addr, // @[:@6.4]
  output [31:0] io_inst // @[:@6.4]
);

initial begin
  $readmemh("initmem/instcache.txt", InstCache.cache);
end
                      endmodule

bind InstCache BindsTo_0_InstCache BindsTo_0_InstCache_Inst(.*);