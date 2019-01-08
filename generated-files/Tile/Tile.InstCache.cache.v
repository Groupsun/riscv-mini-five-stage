module BindsTo_0_InstCache( // @[:@14.2]
  input         clock, // @[:@15.4]
  input  [31:0] io_addr, // @[:@17.4]
  output [31:0] io_inst // @[:@17.4]
);

initial begin
  $readmemh("initmem/instcache.txt", InstCache.cache);
end
                      endmodule

bind InstCache BindsTo_0_InstCache BindsTo_0_InstCache_Inst(.*);