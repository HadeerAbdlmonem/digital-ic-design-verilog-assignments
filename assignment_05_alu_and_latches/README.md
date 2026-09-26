<div align="center">

# 🧮 Assignment 05 — ALU & Latches

![Type](https://img.shields.io/badge/Type-Sequential%20%2F%20Combinational-blue)
![Sub--projects](https://img.shields.io/badge/Sub--projects-4-brightgreen)
![Testbench](https://img.shields.io/badge/Testbench-Included-success)

A parameterized ALU, two flavors of latch, and three flavors of flip-flop —
including a self-checking testbench for the ALU.

</div>

---

## 📦 Sub-projects

### 1️⃣ [`q1_n_bit_alu/`](q1_n_bit_alu/) — Parameterized N-bit ALU
One ALU instance = one fixed operation, selected at elaboration time via
the `OPCODE` parameter. Four instances (add/or/sub/xor) run side by side.

| Module | Parameters | Inputs | Outputs |
|--------|------------|--------|---------|
| `n_bit_alu` | `N` (width), `OPCODE` (0=add,1=or,2=sub,3=xor) | `in0, in1, rst, clk` | `out` |

🧪 **Self-checking** testbench: computes the expected result for each
operation and `$display`s an error if it doesn't match the DUT.

### 2️⃣ [`q2_d_latch/`](q2_d_latch/) — D Latch
Level-sensitive D latch with asynchronous active-low clear.

| Module | Inputs | Outputs |
|--------|--------|---------|
| `d_latch` | `clr, d, g` | `q` |

### 3️⃣ [`q3_parameterized_latch/`](q3_parameterized_latch/) — Parameterized-Width Latch
Same idea, generalized to any bus `WIDTH`, plus an asynchronous **set**
input.

| Module | Parameters | Inputs | Outputs |
|--------|------------|--------|---------|
| `latch_param_width` | `WIDTH` | `aset, data, gate, aclr` | `q` |

### 4️⃣ [`q4_flip_flop_variants/`](q4_flip_flop_variants/) — Flip-Flop Variants
Three related flip-flop implementations, each in its own folder:

| Folder | Module | Behavior |
|--------|--------|----------|
| [`a_t_flip_flop/`](q4_flip_flop_variants/a_t_flip_flop/) | `t_flip_flop` | Toggles `q` on every clock edge while `t = 1` |
| [`b_d_flip_flop/`](q4_flip_flop_variants/b_d_flip_flop/) | `d_flip_flop` | Plain D flip-flop |
| [`c_parameterized_flip_flop/`](q4_flip_flop_variants/c_parameterized_flip_flop/) | `parameterized_flip_flop` | Behaves as **DFF or TFF**, selected via the `FF_TYPE` string parameter — the testbench instantiates both side by side |

## ▶️ Simulating

```tcl
vsim -do run.do
```
(from inside each sub-project's folder)
