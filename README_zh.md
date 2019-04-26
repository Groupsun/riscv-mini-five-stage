# 基于RISC-V架构的迷你5级流水线处理器

这是我在SCUT本科阶段的毕业设计项目，实现一个简单的基于UCB的RISC-V指令集架构的处理器。处理器实现了基本32位指令集RV32I中除了操作系统支持的38条基本的指令。

实现的指令包括算术逻辑指令、加载存储指令、条件跳转指令、跳转链接指令以及两个加载立即数到寄存器的指令LUI和AUIPC，还有一个无动作的指令NOP。

特征：

- 5级流水线处理器
- 设计中的逻辑部件不存在结构冒险。在同一个周期内读写寄存器组不会发生结构冒险。
- 使用旁路以及流水线停滞的方法解决数据冒险。
- 实现分支预测器，基于全局的2位饱和计数器策略。

目前该处理器还没有实现中断或者异常的处理，在未来会进行实现。

## 项目结构

- src/main/scala/riscv_mini_five_stage: 处理器源代码
    - Addr_Buffer.scala: 小型的寄存器组用于保存在分支预测失败时所要恢复的程序计数器地址。
    - ALU.scala: 处理器的算术逻辑单元。
    - Branch_Predict.scala: 处理器的分支预测器。
    - Config.scala: 处理器的全局参数设置，不是实际的处理器硬件构成部分。
    - Control.scala: 处理器的主控制逻辑。
    - DataCache.scala: 处理器的数据缓存。
    - Datapath.scala: 处理器的数据通路，包括所有不在逻辑部件中的逻辑门结构。
    - Encoding.scala: 简单的RV32I指令汇编器，不是实际的处理器硬件构成部分。
    - EX_MEM_Register.scala: EX以及MEM阶段之间的流水线阶段寄存器。
    - Forward.scala: 处理器的旁路单元。
    - Hazard_Detection.scala: 处理器的冒险检测单元，检测并处理需要通过停滞处理的数据冒险。
    - ID_EX_Register.scala: ID以及EX阶段之间的流水线阶段寄存器。
    - IF_ID_Regsiter.scala: IF以及ID阶段之间的流水线阶段寄存器。
    - ImmGen.scala: 处理器的立即数生成单元。
    - InstCache.scala: 处理器的指令缓存。
    - Instructions.scala: 定义RV32I指令比特流，不是实际的处理器硬件构成部分。
    - MEM_WB_Register.scala: MEM以及WB阶段之间的流水线阶段寄存器。
    - PC.scala: 处理器的程序计数器。
    - RegFile.scala: 处理器的寄存器组。
    - Tile.scala: 处理器的顶层部件，连接所有的功能部件。
- src/test/scala/riscv_mini_five_stage_test: 处理器功能部件的单元测试代码。
    - Tile_Test.scala 生成仿真测试。

### 生成Verilog代码

运行src/main/scala/riscv_mini_five_stage/Tile.scala中的Tile对象。

### 输入测试程序

**这是一个实验性的功能**

将汇编代码写入到initmem/asm_input.txt中。

格式：

- 操作码必须是大写的格式。
- 寄存器号必须以'x'开头。
- 立即数必须是以'0x'开头的十六进制数。

```
R-type :   Op    rd , rs1, rs2
I-type :   Op    rd , rs1, imm
S-type :   Op    rs2, rs1, imm
U-type :   Op    rd , imm
SB-type:   Op    rs1, rs2, imm
UJ-type:   Op    rd , imm
无操作指令只需要写“NOP”即可
```

输出的二进制代码文件（txt格式）位于initmem/instcache.txt。仿真时会写入到指令缓存当中。

### 编写你自己的测试代码

打开 `/src/test/scala/riscv_mini_five_stage_test/`，新建你的测试代码文件即可。

你可能需要参考 https://github.com/freechipsproject/chisel-testers 来编写你的测试代码。
