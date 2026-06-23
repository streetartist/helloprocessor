# ============================================
# 实验 1.1 - Hello, RISC-V!
# 功能：打印字符串 "Hello, RISC-V!\n"
# ============================================

.data                       # 数据段：存放字符串等静态数据
msg:    .string "Hello, RISC-V!\n"

.text                       # 代码段：存放指令
.globl main                 # 声明 main 为全局入口

main:
    # --- 打印字符串 ---
    li   a7, 4              # 系统调用号 4 = PrintString
    la   a0, msg            # 将字符串地址加载到 a0
    ecall                   # 执行系统调用

    # --- 退出程序 ---
    li   a7, 10             # 系统调用号 10 = Exit
    ecall                   # 执行系统调用
