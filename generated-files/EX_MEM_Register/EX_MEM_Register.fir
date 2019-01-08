;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit EX_MEM_Register : 
  module EX_MEM_Register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip ex_branch_addr : UInt<32>, flip ex_alu_sum : UInt<32>, flip ex_alu_zero : UInt<32>, flip ex_rs2_out : UInt<32>, flip ex_rd : UInt<5>, flip ex_Branch : UInt<1>, flip ex_Mem_Read : UInt<1>, flip ex_Mem_Write : UInt<1>, flip ex_Reg_Write : UInt<1>, flip ex_Mem_to_Reg : UInt<1>, mem_Branch : UInt<1>, mem_Mem_Read : UInt<1>, mem_Mem_Write : UInt<1>, mem_Reg_Write : UInt<1>, mem_Mem_to_Reg : UInt<1>, mem_branch_addr : UInt<32>, mem_alu_zero : UInt<1>, mem_alu_sum : UInt<32>, mem_rs2_out : UInt<32>, mem_rd : UInt<5>}
    
    reg branch_addr : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[EX_MEM_Register.scala 49:30]
    reg alu_sum : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[EX_MEM_Register.scala 50:30]
    reg alu_zero : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[EX_MEM_Register.scala 51:30]
    reg rs2_out : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[EX_MEM_Register.scala 52:30]
    reg rd : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[EX_MEM_Register.scala 53:30]
    reg branch : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 55:30]
    reg mem_read : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 56:30]
    reg mem_write : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 57:30]
    reg reg_write : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 58:30]
    reg mem_to_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 59:30]
    branch_addr <= io.ex_branch_addr @[EX_MEM_Register.scala 62:17]
    alu_sum <= io.ex_alu_sum @[EX_MEM_Register.scala 63:17]
    alu_zero <= io.ex_alu_zero @[EX_MEM_Register.scala 64:17]
    rs2_out <= io.ex_rs2_out @[EX_MEM_Register.scala 65:17]
    rd <= io.ex_rd @[EX_MEM_Register.scala 66:17]
    branch <= io.ex_Branch @[EX_MEM_Register.scala 67:17]
    mem_read <= io.ex_Mem_Read @[EX_MEM_Register.scala 68:17]
    mem_write <= io.ex_Mem_Write @[EX_MEM_Register.scala 69:17]
    reg_write <= io.ex_Reg_Write @[EX_MEM_Register.scala 70:17]
    mem_to_reg <= io.ex_Mem_to_Reg @[EX_MEM_Register.scala 71:17]
    io.mem_branch_addr <= branch_addr @[EX_MEM_Register.scala 74:23]
    io.mem_alu_sum <= alu_sum @[EX_MEM_Register.scala 75:23]
    io.mem_alu_zero <= alu_zero @[EX_MEM_Register.scala 76:23]
    io.mem_rs2_out <= rs2_out @[EX_MEM_Register.scala 77:23]
    io.mem_rd <= rd @[EX_MEM_Register.scala 78:23]
    io.mem_Branch <= branch @[EX_MEM_Register.scala 79:23]
    io.mem_Mem_Read <= mem_read @[EX_MEM_Register.scala 80:23]
    io.mem_Mem_Write <= mem_write @[EX_MEM_Register.scala 81:23]
    io.mem_Reg_Write <= reg_write @[EX_MEM_Register.scala 82:23]
    io.mem_Mem_to_Reg <= mem_to_reg @[EX_MEM_Register.scala 83:23]
    
