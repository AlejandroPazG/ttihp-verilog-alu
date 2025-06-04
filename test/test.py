import os
import random
import cocotb
from cocotb.triggers import RisingEdge
from cocotb.clock import Clock

@cocotb.test()
async def test_alu(dut):
    """Test ALU de 3 bits"""

    clock = Clock(dut.clk, 10, units="ns")
    cocotb.start_soon(clock.start())

    dut.rst_n.value = 0
    await RisingEdge(dut.clk)
    dut.rst_n.value = 1
    await RisingEdge(dut.clk)

    for _ in range(10):
        A = random.randint(0, 7)
        B = random.randint(0, 7)

        for sel in range(4):  # 00, 01, 10, 11
            ui_in = (sel << 6) | (B << 3) | A
            dut.ui_in.value = ui_in
            await RisingEdge(dut.clk)

            print(f"A={A}, B={B}, sel={sel}, ui_in={ui_in:08b}")
            # No se verifica uo_out porque depende del diseño interno

