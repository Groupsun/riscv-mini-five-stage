;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit MEM_WB_Register : 
  module MEM_WB_Register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mem_dataout : UInt<32>, flip mem_alu_sum : UInt<32>, flip mem_rd : UInt<5>, flip mem_Mem_to_Reg : UInt<1>, flip mem_Reg_Write : UInt<1>, wb_Mem_to_Reg : UInt<1>, wb_Reg_Write : UInt<1>, wb_dataout : UInt<32>, wb_alu_sum : UInt<32>, wb_rd : UInt<5>}
    
    reg dataout : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[MEM_WB_Register.scala 37:28]
    reg alu_sum : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[MEM_WB_Register.scala 38:28]
    reg rd : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[MEM_WB_Register.scala 39:28]
    reg mem_to_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[MEM_WB_Register.scala 40:28]
    reg reg_write : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[MEM_WB_Register.scala 41:28]
    dataout <= io.mem_dataout @[MEM_WB_Register.scala 44:15]
    alu_sum <= io.mem_alu_sum @[MEM_WB_Register.scala 45:15]
    rd <= io.mem_rd @[MEM_WB_Register.scala 46:15]
    mem_to_reg <= io.mem_Mem_to_Reg @[MEM_WB_Register.scala 47:15]
    reg_write <= io.mem_Reg_Write @[MEM_WB_Register.scala 48:15]
    io.wb_Mem_to_Reg <= mem_to_reg @[MEM_WB_Register.scala 51:21]
    io.wb_Reg_Write <= reg_write @[MEM_WB_Register.scala 52:21]
    io.wb_dataout <= dataout @[MEM_WB_Register.scala 53:21]
    io.wb_alu_sum <= alu_sum @[MEM_WB_Register.scala 54:21]
    io.wb_rd <= rd @[MEM_WB_Register.scala 55:21]
    
