<div align="center">

# 🔌 Digital IC Design — Assignments

### SystemVerilog / Verilog coursework, cleaned up and simulation-ready

![Verilog](https://img.shields.io/badge/Language-Verilog-1f425f?logo=v&logoColor=white&color=4B8BBE)
![Simulator](https://img.shields.io/badge/Simulator-ModelSim%20%2F%20QuestaSim-orange)
![Assignments](https://img.shields.io/badge/Assignments-7-brightgreen)
![Status](https://img.shields.io/badge/Status-Cleaned%20%26%20Verified-success)
![License](https://img.shields.io/badge/License-Educational%20Use-lightgrey)

</div>

---

## 📖 About

This repository contains my Digital IC Design coursework, covering
combinational logic, structural and behavioral arithmetic circuits,
sequential elements (flip-flops, latches), counters, a small ALU, and a
Moore FSM — finishing with a parameterized single-port memory.

Every design was cleaned up for version control:

- ✅ Consistent 2-space indentation and signal alignment
- ✅ Professional, descriptive signal and module names
- ✅ Header comments explaining every module's purpose, ports, and behavior
- ✅ One self-contained testbench + `run.do` per design

---

## 🗂️ Table of Contents

| # | Folder | Topic | Highlights |
|---|--------|-------|------------|
| 01 | [`assignment_01_basic_logic_functions`](assignment_01_basic_logic_functions/) | 🔢 Basic logic functions | 3 small combinational Boolean expressions |
| 02 | [`assignment_02_mux_adder_decoder`](assignment_02_mux_adder_decoder/) | 🔀 Mux · Adder · Decoder | 2-to-1 muxes, behavioral 4-bit adder, 2-to-4 decoder |
| 03 | [`assignment_03_adders_and_subtractor`](assignment_03_adders_and_subtractor/) | ➕➖ Adders & Subtractor | Structural ripple-carry adder, subtractor, adder/subtractor with overflow |
| 04 | [`assignment_04_flip_flop_and_ripple_counter`](assignment_04_flip_flop_and_ripple_counter/) | ⏱️ Flip-Flop & Ripple Counter | D flip-flop, 4-bit ripple counter, SLE storage element |
| 05 | [`assignment_05_alu_and_latches`](assignment_05_alu_and_latches/) | 🧮 ALU & Latches | Parameterized N-bit ALU, D latch, T/D/parameterized flip-flops |
| 06 | [`assignment_06_counter_latch_ripple_adder`](assignment_06_counter_latch_ripple_adder/) | 🔁 Counter · Latch · Adder | Toggle-wired counter, SLE element, `generate`-based N-bit adder |
| 07 | [`assignment_07_fsm_and_memory`](assignment_07_fsm_and_memory/) | 🚦 FSM & Memory | Gray code counter FSM, synchronous single-port memory with parity |

Each subfolder has its own **README** with module details, port tables, and
waveform expectations — click through the links above 👆

---

## ▶️ Running a Simulation

Every leaf folder contains a `run.do` script (ModelSim / QuestaSim):

```tcl
vsim -do run.do
```

or, from inside the ModelSim/QuestaSim console:

```tcl
do run.do
```

Each script compiles the design + testbench, launches the simulator, adds
all signals to the wave window, and runs to completion.

---

<div align="center">

📚 *Digital IC Design coursework — cleaned, commented, and ready to explore.*

</div>
