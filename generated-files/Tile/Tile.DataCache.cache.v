module BindsTo_2_DataCache( // @[:@1014.2]
  input         clock, // @[:@1015.4]
  input  [31:0] io_addr, // @[:@1017.4]
  input  [31:0] io_write_data, // @[:@1017.4]
  input         io_Mem_Read, // @[:@1017.4]
  input         io_Mem_Write, // @[:@1017.4]
  input  [1:0]  io_Data_Size, // @[:@1017.4]
  input         io_Load_Type, // @[:@1017.4]
  output [31:0] io_data_out // @[:@1017.4]
);

initial begin
  $readmemh("initmem/datacache.txt", DataCache.cache);
end
                      endmodule

bind DataCache BindsTo_2_DataCache BindsTo_2_DataCache_Inst(.*);