;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit PC : 
  module PC : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr_input : UInt<32>, flip pc_write : UInt<1>, pc_out : UInt<32>}
    
    reg PC_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[PC.scala 16:23]
    node _T_13 = bits(io.pc_write, 0, 0) @[PC.scala 18:35]
    node _T_14 = mux(_T_13, io.addr_input, PC_reg) @[PC.scala 18:16]
    PC_reg <= _T_14 @[PC.scala 18:10]
    io.pc_out <= PC_reg @[PC.scala 19:13]
    
