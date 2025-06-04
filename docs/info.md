# ALU de 3 bits – AlejandroPazG

Este proyecto implementa una Unidad Aritmético-Lógica (ALU) de 3 bits en Verilog, adaptada para la plataforma **TinyTapeout**. La ALU permite realizar cuatro operaciones fundamentales:

- `00` → Suma (`A + B`)
- `01` → Resta (`A - B`)
- `10` → AND (`A & B`)
- `11` → OR (`A | B`)

---

##  Entradas (`ui_in`)

- `ui_in[2:0]` → Operando A (3 bits)
- `ui_in[5:3]` → Operando B (3 bits)
- `ui_in[7:6]` → Selector de operación (2 bits)

---

##  Salidas (`uo_out`)

- `uo_out[2:0]` → Resultado (Y)
- `uo_out[7]` → Carry-out (Cout)
- `uo_out[6:3]` → No utilizados (valor 0)

---

##  Módulos internos

- `alu_top_3bit.v`: Módulo principal de la ALU
- `addsub_3bit.v`: Suma/resta controlada por 1 bit
- `and_3bit.v`: Operación lógica AND
- `or_3bit.v`: Operación lógica OR
- `prefix_adder_3bit.v`: Sumador base 
- `tt_um_alu_top.v`: interfaz estándar para TinyTapeout

---

##  Autor

**Alejandro Paz G.**  
