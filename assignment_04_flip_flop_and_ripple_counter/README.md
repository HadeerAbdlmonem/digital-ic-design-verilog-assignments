<div align="center">

# ⏱️ Assignment 04 — Flip-Flop & Ripple Counter

![Type](https://img.shields.io/badge/Type-Sequential-blue)
![Sub--projects](https://img.shields.io/badge/Sub--projects-3-brightgreen)
![Testbench](https://img.shields.io/badge/Testbench-Included-success)

Sequential storage elements, from a basic D flip-flop up to a 4-bit ripple
counter and a multi-mode settable latch/flip-flop.

</div>

---

## 📦 Sub-projects

### 1️⃣ [`q1_d_flip_flop/`](q1_d_flip_flop/)
A plain **D flip-flop** with asynchronous active-low reset.

| Module | Inputs | Outputs |
|--------|--------|---------|
| `d_flip_flop` | `d, clk, rstn` | `q, qbar` |

🧪 Testbench applies reset, then drives 10 randomized values on `d`.

### 2️⃣ [`q2_ripple_counter_4bit/`](q2_ripple_counter_4bit/)
Four D flip-flops (preset-to-1 reset variant) wired in **toggle
configuration**, each stage clocked by the previous stage's `qbar`, forming
a 4-bit **asynchronous ripple counter**.

| Module | Inputs | Outputs |
|--------|--------|---------|
| `d_flip_flop` | `d, clk, rstn` | `q, qbar` |
| `ripple_counter_4bit` | `clk, rstn` | `out[3:0]` |

🧪 Testbench resets, then lets the counter free-run for 100 time units.

### 3️⃣ [`q3_sle_latch_ff/`](q3_sle_latch_ff/)
A **Settable Latch/Flip-Flop (SLE)** — a single storage element that can
act as either an edge-triggered D flip-flop or a level-sensitive latch,
plus asynchronous and synchronous load paths (handy for scan/test/preset).

| Module | Inputs | Outputs |
|--------|--------|---------|
| `sle_latch_ff` | `d, clk, en, aload_n, async_data_n, sload_n, sload_data, lat_mode` | `q` |

**Priority:** async load → mode-specific sync load / D → hold.

🧪 Testbench exercises the async load path, then 100 randomized cycles in
flip-flop mode, then a few cycles in latch mode.

## ▶️ Simulating

```tcl
vsim -do run.do
```
(from inside each sub-project's folder)

## 🗂️ Related

See also [`assignment_06/q2_sle_latch`](../assignment_06_counter_latch_ripple_adder/q2_sle_latch/)
for a simpler, edge-triggered-only variant of the same SLE concept.
