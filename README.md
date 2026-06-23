# Hello Processor

本仓库将涉足芯片设计基础实践，以RISC-V为主，自己设计指令集架构为辅。以软件模拟为主，硬件FPGA为辅（使用洋垃圾矿机控制板蚂蚁s9的AMD Zynq 7010）进行实验。

将从最基础的数字逻辑开始，最终完成RISC-V指令集芯片与自主指令集芯片的设计，同时甚至编写配套代码。

## 实验将使用的主要软件为
- Logisim: 数字逻辑仿真

- RARS：用于入门学习 RV32I/RISC-V 汇编。Java 图形界面，能单步、看寄存器、看内存

- Icarus Verilog (iverilog)：轻量级的 Verilog 编译器和模拟器，用于将代码编译为仿真可执行文件。

- GTKWave：波形查看器。运行仿真后会生成 .vcd 波形文件，用它打开就可以像看心电图一样查看 CPU 每一个引脚在每一个时钟周期的高低电平。

- Verilator：工业级的开源仿真器。它能将 Verilog 代码直接转换成极其高效的 C++ 模型。如果你喜欢用 C++ 来写测试激励（Testbench），这是首选。

- RISC-V GNU Compiler Toolchain：用于将你写的 C 语言测试程序交叉编译成 RISC-V 的汇编和机器码。

- Xilinx Vivado: 集成开发环境