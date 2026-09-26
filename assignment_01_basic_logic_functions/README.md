<div align="center">

# 🔢 Assignment 01 — Basic Logic Functions

![Type](https://img.shields.io/badge/Type-Combinational-blue)
![Modules](https://img.shields.io/badge/Modules-3-brightgreen)
![Testbench](https://img.shields.io/badge/Testbench-None%20(manual%20stimulus)-lightgrey)

Three small combinational circuits, each implementing a single Boolean
expression with basic gates.

</div>

---

## 📦 Modules

| File | Module | Expression | Inputs | Outputs |
|------|--------|------------|--------|---------|
| `boolean_expr_q1.v` | `boolean_expr_q1` | `f = x \| (~y & z)` | `x, y, z` | `f` |
| `boolean_expr_q2.v` | `boolean_expr_q2` | `y = a & e & ~(b & c & d)` | `a, b, c, d, e` | `y` |
| `boolean_expr_q3.v` | `boolean_expr_q3` | `f = (a ^ b) & ~(b ^ c) & c` | `a, b, c` | `f` |

## ▶️ Simulating

Each module has its own `run.do` — run the one matching the question you
want to explore:

```tcl
vsim -do run_q1.do   # boolean_expr_q1
vsim -do run_q2.do   # boolean_expr_q2
vsim -do run_q3.do   # boolean_expr_q3
```

> 💡 These are pure combinational circuits with no testbench — after
> launching, drive the input signals manually from the ModelSim/QuestaSim
> wave window or console to observe the outputs.
