# 实验路线图

从零开始设计处理器的完整学习路径。每个实验都包含代码和教程。

---

## 阶段一：基础知识

### 实验 1：RISC-V 汇编入门

使用 RARS 模拟器，掌握 RISC-V 汇编语言的基本编程能力。

| 编号 | 主题 | 内容 | 产出 |
|------|------|------|------|
| 1.1 | 环境与第一个程序 | RARS 界面介绍、汇编/运行/单步调试流程、系统调用打印 "Hello" | `lab1/hello.asm` |
| 1.2 | 寄存器与算术运算 | x0-x31 寄存器用途、add/sub/addi/mul、立即数范围、溢出观察 | `lab1/arithmetic.asm` |
| 1.3 | 逻辑与移位运算 | and/or/xor/sll/srl/sra、掩码提取位域、用移位实现乘2除2 | `lab1/bitops.asm` |
| 1.4 | 内存读写 | lw/sw/lb/sb、大小端、字节对齐、数组遍历 | `lab1/memory.asm` |
| 1.5 | 分支与循环 | beq/bne/blt/bge、标签跳转、实现 if-else/for/while | `lab1/branch.asm` |
| 1.6 | 函数与栈 | jal/jalr、调用约定（caller/callee saved）、栈帧、递归实现阶乘 | `lab1/function.asm` |
| 1.7 | 综合实战 | 用汇编实现冒泡排序、二分查找 | `lab1/sort.asm` |

**前置要求：** 无
**工具：** RARS (rars1_6.jar)

---

### 实验 2：数字逻辑基础

使用 Logisim 搭建从门电路到 ALU 的组合/时序逻辑电路。

| 编号 | 主题 | 内容 | 产出 |
|------|------|------|------|
| 2.1 | 基本门电路 | AND/OR/NOT/XOR/NAND/NOR 真值表验证，用 NAND 构造其他门 | `lab2/gates.circ` |
| 2.2 | 加法器 | 半加器 → 全加器 → 4位行波进位加法器 → 超前进位加法器 | `lab2/adder.circ` |
| 2.3 | 多路选择器与解码器 | 2选1/4选1 MUX、2-4/3-8 解码器、用 MUX 实现任意逻辑函数 | `lab2/mux_decoder.circ` |
| 2.4 | 比较器与移位器 | 32位比较器（大于/小于/等于）、桶形移位器 | `lab2/comparator.circ` |
| 2.5 | 锁存器与触发器 | SR 锁存器、D 触发器、边沿触发原理、亚稳态概念 | `lab2/flipflop.circ` |
| 2.6 | 寄存器与寄存器堆 | 带使能的 D 寄存器、32x32 寄存器堆（双读一写） | `lab2/regfile.circ` |
| 2.7 | ALU 设计 | 支持 add/sub/and/or/xor/slt 的 32 位 ALU，ALU 控制信号 | `lab2/alu.circ` |
| 2.8 | 计数器与状态机 | 同步计数器、交通灯有限状态机 | `lab2/fsm.circ` |

**前置要求：** 无
**工具：** Logisim Evolution

---

### 实验 3：Verilog HDL 入门

使用 Icarus Verilog 编译仿真，GTKWave 查看波形，掌握硬件描述语言。

| 编号 | 主题 | 内容 | 产出 |
|------|------|------|------|
| 3.1 | 环境搭建 | iverilog/GTKWave 安装、编译/仿真/查看波形的完整流程 | 教程文档 |
| 3.2 | 组合逻辑建模 | module/wire/assign、全加器、参数化位宽的加法器 | `lab3/adder.v` |
| 3.3 | Testbench 编写 | initial/always 块、$dumpfile/$dumpvars、$display/$monitor | `lab3/adder_tb.v` |
| 3.4 | 行为级建模 | always @(*)、case 语句、ALU 的行为级实现 | `lab3/alu.v` |
| 3.5 | 时序逻辑 | always @(posedge clk)、D 触发器、带同步复位的寄存器 | `lab3/register.v` |
| 3.6 | 寄存器堆 | 32 个 32 位寄存器、双读端口 + 单写端口、异步读同步写 | `lab3/regfile.v` |
| 3.7 | 存储器 | RAM（读写）、ROM（只读，存指令）、从文件加载初始数据 | `lab3/memory.v` |
| 3.8 | 模块层次化设计 | 多模块实例化、端口连接、参数传递、设计一个简单数据通路 | `lab3/datapath.v` |

**前置要求：** 实验 2（理解电路概念）
**工具：** Icarus Verilog, GTKWave

---

## 阶段二：CPU 核心设计

### 实验 4：单周期 RISC-V CPU

用 Verilog 实现一个完整的单周期 RV32I CPU。

| 编号 | 主题 | 内容 | 产出 |
|------|------|------|------|
| 4.1 | 指令编码 | R/I/S/B/U/J 六种格式的位域划分、手动编码/解码练习 | 教程文档 |
| 4.2 | 取指模块 | PC 寄存器、PC+4、指令存储器（ROM）、取指逻辑 | `lab4/pc.v`, `lab4/imem.v` |
| 4.3 | 译码模块 | 立即数生成器（ImmGen）、寄存器堆读取、指令字段拆分 | `lab4/decoder.v` |
| 4.4 | 执行模块 | ALU + ALU 控制、操作数选择（寄存器 vs 立即数） | `lab4/alu.v`, `lab4/alu_ctrl.v` |
| 4.5 | 访存模块 | 数据存储器（RAM）、load/store 地址计算、字节/半字/字访问 | `lab4/dmem.v` |
| 4.6 | 写回模块 | 写回数据选择（ALU结果 vs 内存数据 vs PC+4） | `lab4/writeback_mux.v` |
| 4.7 | 控制单元 | 主控制器（opcode→控制信号）、ALU 控制器（funct3/funct7→ALU操作） | `lab4/control.v` |
| 4.8 | 分支与跳转 | 分支目标计算、条件判断、jal/jalr 实现 | `lab4/branch.v` |
| 4.9 | 顶层集成 | 连接所有模块、数据通路完整连线 | `lab4/cpu_top.v` |
| 4.10 | 验证测试 | 编写汇编测试程序、加载到 ROM、仿真验证每条指令 | `lab4/test/` |

**前置要求：** 实验 1（理解指令）、实验 3（Verilog 能力）
**工具：** Icarus Verilog, GTKWave, RARS（生成测试机器码）

---

### 实验 5：流水线 CPU

将单周期 CPU 改造为五级流水线，处理冒险问题。

| 编号 | 主题 | 内容 | 产出 |
|------|------|------|------|
| 5.1 | 流水线原理 | 指令级并行、吞吐量 vs 延迟、流水线寄存器的作用 | 教程文档 |
| 5.2 | 流水线划分 | IF/ID/EX/MEM/WB 五级、插入流水线寄存器 | `lab5/pipeline_regs.v` |
| 5.3 | 数据冒险 | RAW/WAR/WAW 冒险识别、插入 NOP（暂停）解决 | `lab5/hazard_detect.v` |
| 5.4 | 数据转发 | Forwarding Unit 设计、EX→EX / MEM→EX 转发路径 | `lab5/forwarding.v` |
| 5.5 | Load-Use 冒险 | 检测 load 后紧跟使用、插入一个气泡（stall） | `lab5/stall_unit.v` |
| 5.6 | 控制冒险 | 分支延迟槽、静态预测（总不跳）、flush 机制 | `lab5/branch_ctrl.v` |
| 5.7 | 动态分支预测 | 1-bit/2-bit 预测器、BHT（分支历史表） | `lab5/predictor.v` |
| 5.8 | 顶层集成与验证 | 流水线 CPU 完整连线、与单周期对比性能 | `lab5/cpu_pipeline.v` |

**前置要求：** 实验 4
**工具：** Icarus Verilog, GTKWave, Verilator（性能测试）

---

## 阶段三：存储与外设

### 实验 6：存储系统

| 编号 | 主题 | 内容 | 产出 |
|------|------|------|------|
| 6.1 | 存储层次原理 | 局部性原理、Cache/主存/磁盘层次、命中率计算 | 教程文档 |
| 6.2 | 直接映射 Cache | Tag/Index/Offset 划分、命中/缺失逻辑、写直通 | `lab6/cache_dm.v` |
| 6.3 | 组相联 Cache | N 路组相联、LRU 替换策略 | `lab6/cache_sa.v` |
| 6.4 | 写回策略 | 脏位（Dirty Bit）、写回 vs 写直通对比 | `lab6/cache_wb.v` |
| 6.5 | Cache 集成 | 将 Cache 接入 CPU 数据通路、处理 stall | `lab6/cpu_with_cache.v` |

**前置要求：** 实验 5
**工具：** Icarus Verilog, Verilator

---

### 实验 7：自主指令集架构

| 编号 | 主题 | 内容 | 产出 |
|------|------|------|------|
| 7.1 | ISA 设计 | 设计指令格式、寄存器约定、寻址模式、指令编码表 | `lab7/isa_spec.md` |
| 7.2 | 汇编器实现 | 用 Python/Rust 编写汇编器，将助记符转为机器码 | `lab7/assembler/` |
| 7.3 | 模拟器实现 | 用软件模拟执行自主 ISA 的机器码，验证指令语义 | `lab7/simulator/` |
| 7.4 | CPU 实现 | 用 Verilog 实现自主 ISA 的处理器 | `lab7/cpu/` |
| 7.5 | 工具链联调 | 汇编 → 机器码 → 加载到 CPU → 仿真验证 | 集成测试 |

**前置要求：** 实验 4 或 5
**工具：** Python/Rust, Icarus Verilog

---

## 阶段四：FPGA 落地

### 实验 8：FPGA 实现（Zynq 7010）

| 编号 | 主题 | 内容 | 产出 |
|------|------|------|------|
| 8.1 | Vivado 环境 | 安装配置、创建工程、目标器件选择（xc7z010） | 教程文档 |
| 8.2 | 综合与约束 | 将 CPU 综合到 FPGA、引脚约束文件（XDC）、时钟约束 | `lab8/constraints.xdc` |
| 8.3 | 板级调试 | ILA（逻辑分析仪）插入、JTAG 调试、观察实际运行波形 | 教程文档 |
| 8.4 | 外设接口 | UART 串口通信、LED/按键控制、与 PS 端交互 | `lab8/uart.v` |
| 8.5 | SoC 集成 | CPU + 存储 + 外设组成完整片上系统 | `lab8/soc_top.v` |

**前置要求：** 实验 5、蚂蚁 S9 控制板硬件
**工具：** Xilinx Vivado, RISC-V GNU Toolchain

---

## 附录：工具安装清单

| 工具 | 用途 | 安装方式 |
|------|------|----------|
| RARS | RISC-V 汇编模拟 | 已有 `rars1_6.jar`，需 Java 运行时 |
| Logisim Evolution | 数字逻辑仿真 | GitHub 下载 jar |
| Icarus Verilog | Verilog 编译仿真 | `scoop install iverilog` 或官网安装 |
| GTKWave | 波形查看 | `scoop install gtkwave` 或官网安装 |
| Verilator | 高性能仿真 | MSYS2 或 WSL 安装 |
| RISC-V Toolchain | 交叉编译 | 预编译包或自行构建 |
| Xilinx Vivado | FPGA 开发 | Xilinx 官网（WebPack 免费版） |
