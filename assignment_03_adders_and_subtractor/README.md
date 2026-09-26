<div align="center">

# ➕➖ Assignment 03 — Adders & Subtractor

![Type](https://img.shields.io/badge/Type-Structural-blue)
![Sub--projects](https://img.shields.io/badge/Sub--projects-3-brightgreen)
![Level](https://img.shields.io/badge/Level-Gate%20%2F%20Behavioral-yellow)

Three self-contained sub-projects, each built around a 1-bit full adder
core, showing how the same building block scales up to addition,
subtraction, and combined add/subtract with overflow detection.

</div>

---

## 📦 Sub-projects

### 1️⃣ [`01_ripple_carry_adder_4bit/`](01_ripple_carry_adder_4bit/)
**Gate-level** 1-bit full adder → **structural** 4-bit ripple-carry adder.

| Module | Inputs | Outputs |
|--------|--------|---------|
| `full_adder_1bit` | `a, b, cin` | `sum, cout` |
| `ripple_carry_adder_4bit` | `a[3:0], b[3:0], cin` | `sum[3:0], cout` |

### 2️⃣ [`02_subtractor_4bit/`](02_subtractor_4bit/)
Same gate-level full adder, wired as a **4-bit subtractor** via two's
complement (`a + ~b + 1`).

| Module | Inputs | Outputs |
|--------|--------|---------|
| `full_adder_1bit` | `a, b, cin` | `sum, cout` |
| `subtractor_4bit` | `a[3:0], b[3:0]` | `diff[3:0], cout` |

### 3️⃣ [`03_adder_subtractor_with_overflow/`](03_adder_subtractor_with_overflow/)
**Behavioral** full adder (`{cout, sum} = a + b + cin`) combined into a
mode-selectable **adder/subtractor with signed-overflow detection**.

| Module | Inputs | Outputs |
|--------|--------|---------|
| `full_adder_1bit` | `a, b, cin` | `sum, cout` |
| `adder_subtractor_overflow` | `a[3:0], b[3:0], mode` | `s[3:0], overflow` |

`mode = 0` → addition · `mode = 1` → subtraction (via XOR + carry-in trick)

## ▶️ Simulating

Each sub-project has its own `run.do` — run it from inside that folder:

```tcl
vsim -do run.do
```

> ℹ️ Each sub-project keeps its **own copy** of `full_adder_1bit.v` (gate-level
> in sub-projects 1–2, behavioral in sub-project 3) so every folder compiles
> independently, exactly as in the original assignment structure.
