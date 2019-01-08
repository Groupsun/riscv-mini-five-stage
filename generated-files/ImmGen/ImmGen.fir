;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit ImmGen : 
  module ImmGen : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inst_in : UInt<32>, flip imm_sel : UInt<3>, imm : UInt<32>}
    
    node Iimm = bits(io.inst_in, 31, 20) @[ImmGen.scala 26:24]
    node _T_11 = bits(io.inst_in, 31, 25) @[ImmGen.scala 27:28]
    node _T_12 = bits(io.inst_in, 11, 7) @[ImmGen.scala 27:48]
    node Simm = cat(_T_11, _T_12) @[Cat.scala 30:58]
    node _T_13 = bits(io.inst_in, 31, 31) @[ImmGen.scala 28:28]
    node _T_14 = bits(io.inst_in, 7, 7) @[ImmGen.scala 28:44]
    node _T_15 = bits(io.inst_in, 30, 25) @[ImmGen.scala 28:59]
    node _T_16 = bits(io.inst_in, 11, 8) @[ImmGen.scala 28:79]
    node _T_17 = cat(_T_15, _T_16) @[Cat.scala 30:58]
    node _T_18 = cat(_T_13, _T_14) @[Cat.scala 30:58]
    node Bimm = cat(_T_18, _T_17) @[Cat.scala 30:58]
    node _T_43 = eq(UInt<3>("h04"), io.imm_sel) @[Mux.scala 46:19]
    node _T_44 = mux(_T_43, Bimm, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_45 = eq(UInt<3>("h03"), io.imm_sel) @[Mux.scala 46:19]
    node _T_46 = mux(_T_45, Simm, _T_44) @[Mux.scala 46:16]
    node _T_47 = eq(UInt<3>("h02"), io.imm_sel) @[Mux.scala 46:19]
    node _T_48 = mux(_T_47, Iimm, _T_46) @[Mux.scala 46:16]
    node _T_49 = eq(UInt<3>("h01"), io.imm_sel) @[Mux.scala 46:19]
    node _T_50 = mux(_T_49, Iimm, _T_48) @[Mux.scala 46:16]
    io.imm <= _T_50 @[ImmGen.scala 30:10]
    
