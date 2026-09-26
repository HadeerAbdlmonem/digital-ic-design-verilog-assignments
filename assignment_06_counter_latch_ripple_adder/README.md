<div align="center">

# 🔁 Assignment 06 — Counter · Latch · Ripple Adder

![Type](https://img.shields.io/badge/Type-Sequential%20%2F%20Structural-blue)
![Sub--projects](https://img.shields.io/badge/Sub--projects-3-brightgreen)
![Feature](https://img.shields.io/badge/Feature-generate%20block-purple)
![Testbench](https://img.shields.io/badge/Testbench-Included-success)

A toggle-wired counter, a settable latch/flip-flop element, and a
parameterized N-bit ripple-carry adder built with a Verilog `generate`
block.

</div>

---

## 📦 Sub-projects

### 1️⃣ [`q1_updown_counter/`](q1_updown_counter/)
Four D flip-flops (`dff`), each feeding its own complemented output back
to its `d` input and clocking the next stage — a classic
**asynchronous ripple counter**.

| Module | Inputs | Outputs |
|--------|--------|---------|
| `dff` | `d, rst, clk` | `q, q_bar` |
| `counter_up_down` | `clk, rst` | `out[3:0], out_bar[3:0]` |

### 2️⃣ [`q2_sle_latch/`](q2_sle_latch/)
An edge-triggered **Settable Latch/Flip-Flop (SLE)** — asynchronous load,
synchronous load, and latch/flip-flop mode selection in one element.

| Module | Inputs | Outputs |
|--------|--------|---------|
| `sle` | `d, clk, en, aload_n, adata_n, sload_n, sdata, lat` | `q` |

> See also [`assignment_04/q3_sle_latch_ff`](../assignment_04_flip_flop_and_ripple_counter/q3_sle_latch_ff/)
> for a more thoroughly-commented variant of the same idea.

### 3️⃣ [`q3_ripple_carry_adder_generate/`](q3_ripple_carry_adder_generate/)
A **behavioral** 1-bit full adder, instantiated `N` times with a
`generate`/`genvar` loop to build a fully parameterized ripple-carry adder.

| Module | Parameters | Inputs | Outputs |
|--------|------------|--------|---------|
| `full_adder` | — | `a, b, cin` | `sum, cout` |
| `ripple_carry_adder_nbit` | `N` (default 8) | `a[N-1:0], b[N-1:0], cin` | `sum[N-1:0], cout` |

🧪 Testbench drives directed vectors including a max-value + carry-in edge
case (`8'hFF + 8'hFF + 1`).

## ▶️ Simulating

```tcl
vsim -do run.do
```
(from inside each sub-project's folder)
