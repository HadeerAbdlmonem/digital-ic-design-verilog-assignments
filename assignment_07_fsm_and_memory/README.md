<div align="center">

# 🚦 Assignment 07 — FSM & Memory

![Type](https://img.shields.io/badge/Type-FSM%20%2F%20Memory-blue)
![Sub--projects](https://img.shields.io/badge/Sub--projects-2-brightgreen)
![Testbench](https://img.shields.io/badge/Testbench-Included-success)

The most advanced pair of the series: a Moore FSM that generates a Gray
code sequence, and a parameterized synchronous single-port memory with
optional pipelining and parity.

</div>

---

## 📦 Sub-projects

### 1️⃣ [`q1_gray_code_counter_fsm/`](q1_gray_code_counter_fsm/) — Gray Code Counter FSM
A 2-bit **Moore FSM** that steps through the Gray sequence
`00 → 01 → 11 → 10 → 00`, changing only one bit per transition.

| Module | Inputs | Outputs |
|--------|--------|---------|
| `gray_counter_fsm` | `clk, rst` | `y[1:0]` |

```
STATE_A(00) → STATE_B(01) → STATE_C(10) → STATE_D(11) → STATE_A(00) → ...
   y=00          y=01          y=11          y=10
```

### 2️⃣ [`q2_single_port_memory/`](q2_single_port_memory/) — Single-Port Memory
A synchronous single-port memory with independent write/read enables, an
optional address-pipeline stage, an optional output-pipeline stage, and an
optional XOR parity bit on the read data.

| Module | Key Parameters | Inputs | Outputs |
|--------|----------------|--------|---------|
| `single_port_memory` | `MEM_WIDTH`, `MEM_DEPTH`, `ADDR_WIDTH`, `ADDR_PIPELINE`, `DOUT_PIPELINE`, `PARITY_ENABLE` | `din, addr, wr_en, rd_en, blk_select, addr_en, dout_en, clk, rst` | `dout, parity_out` |

🧪 Testbench resets the memory, writes `16'hAAAA` to address `10'h0A`,
then reads it back and waits for the (registered) data to appear.

## ▶️ Simulating

```tcl
vsim -do run.do
```
(from inside each sub-project's folder)

> 💡 `q1_gray_code_counter_fsm/run.do` also adds the internal
> `current_state` / `next_state` signals to the wave window so you can
> watch the FSM transition alongside the `y` output.
