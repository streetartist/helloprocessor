# ============================================
# 实验 1.1 - 练习参考答案
# 功能：打印字符串 + 打印整数 + 多行输出
# ============================================

.data
greeting:   .string "Hello, RISC-V!\n"
year_msg:   .string "Year: "
newline:    .string "\n"
line2:      .string "I am learning assembly!\n"
line3:      .string "This is my first program.\n"

.text
.globl main

main:
    # === 练习 1：打印自定义字符串 ===
    li   a7, 4
    la   a0, greeting
    ecall

    # === 练习 2：打印整数 ===
    # 先打印前缀 "Year: "
    li   a7, 4
    la   a0, year_msg
    ecall

    # 打印整数 2026
    li   a7, 1              # 系统调用号 1 = PrintInt
    li   a0, 2026           # 要打印的整数放在 a0
    ecall

    # 打印换行
    li   a7, 4
    la   a0, newline
    ecall

    # === 练习 3：打印多行 ===
    li   a7, 4
    la   a0, line2
    ecall

    li   a7, 4
    la   a0, line3
    ecall

    # === 退出 ===
    li   a7, 10
    ecall
