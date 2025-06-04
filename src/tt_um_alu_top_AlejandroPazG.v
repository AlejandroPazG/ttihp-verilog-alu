
module tt_um_alu_top_AlejandroPazG (
    input  [7:0] ui_in,
    output [7:0] uo_out,
    input  [7:0] uio_in,
    output [7:0] uio_out,
    output [7:0] uio_oe,
    input        ena,
    input        clk,
    input        rst
);

    // Entradas codificadas en ui_in
    wire [2:0] A   = ui_in[2:0];   // Bits 0-2
    wire [2:0] B   = ui_in[5:3];   // Bits 3-5
    wire [1:0] sel = ui_in[7:6];   // Bits 6-7

    wire [2:0] Y;
    wire       Cout;

    // Instancia de la ALU de 3 bits
    alu_top_3bit dut (
        .A(A),
        .B(B),
        .sel(sel),
        .Y(Y),
        .Cout(Cout)
    );

    // Resultado y carry en la salida
    assign uo_out = {4'b0000, Cout, 1'b0, Y};

    // No se usan pines bidireccionales
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
