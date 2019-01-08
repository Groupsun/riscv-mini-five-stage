;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit IF_ID_Register : 
  module IF_ID_Register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip if_pc : UInt<32>, flip if_inst : UInt<32>, flip if_id_write : UInt<1>, flip if_flush : UInt<1>, id_rs1 : UInt<5>, id_rs2 : UInt<5>, id_pc : UInt<32>, id_inst : UInt<32>}
    
    reg pc_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[IF_ID_Register.scala 27:23]
    reg inst_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[IF_ID_Register.scala 28:25]
    node _T_25 = bits(io.if_flush, 0, 0) @[IF_ID_Register.scala 30:35]
    node _T_27 = bits(io.if_id_write, 0, 0) @[IF_ID_Register.scala 31:30]
    node _T_28 = mux(_T_27, io.if_pc, pc_reg) @[IF_ID_Register.scala 31:8]
    node _T_29 = mux(_T_25, UInt<32>("h00"), _T_28) @[IF_ID_Register.scala 30:16]
    pc_reg <= _T_29 @[IF_ID_Register.scala 30:10]
    node _T_30 = bits(io.if_flush, 0, 0) @[IF_ID_Register.scala 33:37]
    node _T_32 = bits(io.if_id_write, 0, 0) @[IF_ID_Register.scala 34:30]
    node _T_33 = mux(_T_32, io.if_inst, inst_reg) @[IF_ID_Register.scala 34:8]
    node _T_34 = mux(_T_30, UInt<32>("h00"), _T_33) @[IF_ID_Register.scala 33:18]
    inst_reg <= _T_34 @[IF_ID_Register.scala 33:12]
    io.id_pc <= pc_reg @[IF_ID_Register.scala 36:12]
    io.id_inst <= inst_reg @[IF_ID_Register.scala 37:14]
    node _T_35 = bits(inst_reg, 19, 15) @[IF_ID_Register.scala 38:24]
    io.id_rs1 <= _T_35 @[IF_ID_Register.scala 38:13]
    node _T_36 = bits(inst_reg, 24, 20) @[IF_ID_Register.scala 39:24]
    io.id_rs2 <= _T_36 @[IF_ID_Register.scala 39:13]
    
