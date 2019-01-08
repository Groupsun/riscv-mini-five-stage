;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit ALU : 
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip Src_A : UInt<32>, flip Src_B : UInt<32>, flip ALUOp : UInt<4>, Sum : UInt<32>, Zero : UInt<1>}
    
    node _T_20 = add(io.Src_A, io.Src_B) @[ALU.scala 38:26]
    node _T_21 = tail(_T_20, 1) @[ALU.scala 38:26]
    node _T_22 = sub(io.Src_A, io.Src_B) @[ALU.scala 39:26]
    node _T_23 = asUInt(_T_22) @[ALU.scala 39:26]
    node _T_24 = tail(_T_23, 1) @[ALU.scala 39:26]
    node _T_25 = and(io.Src_A, io.Src_B) @[ALU.scala 40:26]
    node _T_26 = or(io.Src_A, io.Src_B) @[ALU.scala 41:26]
    node _T_27 = eq(UInt<4>("h03"), io.ALUOp) @[Mux.scala 46:19]
    node _T_28 = mux(_T_27, _T_26, io.Src_B) @[Mux.scala 46:16]
    node _T_29 = eq(UInt<4>("h02"), io.ALUOp) @[Mux.scala 46:19]
    node _T_30 = mux(_T_29, _T_25, _T_28) @[Mux.scala 46:16]
    node _T_31 = eq(UInt<4>("h01"), io.ALUOp) @[Mux.scala 46:19]
    node _T_32 = mux(_T_31, _T_24, _T_30) @[Mux.scala 46:16]
    node _T_33 = eq(UInt<4>("h00"), io.ALUOp) @[Mux.scala 46:19]
    node _T_34 = mux(_T_33, _T_21, _T_32) @[Mux.scala 46:16]
    io.Sum <= _T_34 @[ALU.scala 37:10]
    node _T_35 = eq(io.Src_A, io.Src_B) @[ALU.scala 44:28]
    node _T_38 = mux(_T_35, UInt<1>("h01"), UInt<1>("h00")) @[ALU.scala 44:17]
    io.Zero <= _T_38 @[ALU.scala 44:11]
    
