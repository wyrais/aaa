# Початкові значення
force en 1 0ns         ;# Відключено — очікуємо Z на виході
force sel 3'b000 0ns

# Включаємо дешифратор
force en 0 50ns

# Зміна входів
force sel 3'b000 50ns
force sel 3'b001 100ns
force sel 3'b010 150ns
force sel 3'b011 200ns
force sel 3'b100 250ns
force sel 3'b101 300ns
force sel 3'b110 350ns
force sel 3'b111 400ns

# Вимкнення дешифратора (результат повинен бути Z)
force en 1 450ns

# Завершення симуляції через 500 нс
run 500ns