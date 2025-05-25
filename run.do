# ==== Початкове значення resetb і clk ====
force top.resetb 0 0ns
force top.clk 0 0ns, 1 1ns -repeat 2ns
run 3ns
force top.resetb 1 3ns

# ==== Приклади з документації ====
force top.R 8'b01100011 0ns     ;# A1
force top.S 8'b10100101 0ns     ;# B1
force top.CI 0 0ns
force top.ALB_MI 2'b00 0ns      ;# R ∨ S

force top.ALB_MI 2'b01 10ns     ;# R + S + CI
force top.CI     1 10ns

force top.ALB_MI 2'b10 20ns     ;# S - R - 1 + CI

force top.ALB_MI 2'b11 30ns     ;# R ⊕ S

# A2, B2 (додатне + від’ємне)
force top.R 8'b10011100 40ns    ;# A2
force top.S 8'b01011010 40ns    ;# B2
force top.ALB_MI 2'b01 40ns
force top.CI 1 40ns

# Інші значення
force top.R 8'b00001111 50ns
force top.S 8'b11110000 50ns
force top.ALB_MI 2'b10 50ns
force top.CI 1 50ns

force top.ALB_MI 2'b11 60ns

# ==== Запуск симуляції ====
run 70ns
