<div align="center">

# 🔀 Assignment 02 — Mux · Adder · Decoder

![Type](https://img.shields.io/badge/Type-Combinational-blue)
![Modules](https://img.shields.io/badge/Modules-4-brightgreen)

Four combinational building blocks: two multiplexers, a behavioral 4-bit
adder, and a 2-to-4 one-hot decoder.

</div>

---

## 📦 Modules

| File | Module | Description | Inputs | Outputs |
|------|--------|-------------|--------|---------|
| `mux_and_xnor.v` | `mux_and_xnor` | 2-to-1 mux between an AND term and an XNOR term, with complementary output | `a, b, c, d, e, f, sel` | `out, out_bar` |
| `mux_two_functions.v` | `mux_two_functions` | 2-to-1 mux between an XNOR term and a function of a 3-bit bus | `d[2:0], a, b, c, sel` | `out, out_bar` |
| `adder_4bit_behavioral.v` | `adder_4bit_behavioral` | 4-bit adder using the `+` operator | `a[3:0], b[3:0]` | `c[4:0]` (carry in MSB) |
| `decoder_2to4.v` | `decoder_2to4` | 2-to-4 one-hot decoder | `a[1:0]` | `d[3:0]` |

## ▶️ Simulating

```tcl
vsim -do run_q1.do   # mux_and_xnor
vsim -do run_q2.do   # mux_two_functions
vsim -do run_q3.do   # adder_4bit_behavioral
vsim -do run_q4.do   # decoder_2to4
```

> 💡 No testbenches here — drive inputs manually from the wave
> window/console after launching each simulation.
