module tt_um_fsm_top_AlejandroPazG (
    input  wire [7:0] ui_in,     // Entradas estándar
    output wire [7:0] uo_out,    // Salidas estándar
    input  wire [7:0] uio_in,    // Entradas bidireccionales (no usadas)
    output wire [7:0] uio_out,   // Salidas bidireccionales (no usadas)
    output wire [7:0] uio_oe,    // Control de habilitación de bidireccionales (no usadas)
    input  wire clk,             // Reloj principal
    input  wire rst_n,           // Reset activo en bajo
    input  wire ena              // Habilitador (no usado, pero requerido)
);

    // Renombrar señales para mayor claridad
    wire rst = ~rst_n;               // Convertir a reset activo en alto
    wire startfill   = ui_in[0];     // SW0
    wire productook  = ui_in[1];     // SW1

    wire llenando, sellando, LED;
    wire [2:0] state_filler;
    wire [2:0] state_sealer;

    wire lleno_flag;

    // FSM Moore (llenadora)
    fsm_moore_filler u_filler (
        .clk(clk),
        .rst(rst),
        .startfill(startfill),
        .lleno_flag(lleno_flag),
        .llenando(llenando),
        .state_indicator(state_filler)
    );

    // FSM Mealy (selladora)
    fsm_mealy_sealer u_sealer (
        .clk(clk),
        .rst(rst),
        .lleno_flag(lleno_flag),
        .productook(productook),
        .sellando(sellando),
        .LED(LED),
        .state_indicator(state_sealer)
    );

    // Salidas mapeadas a los bits del bus uo_out
    assign uo_out[0] = llenando;         // LED0
    assign uo_out[1] = sellando;         // LED1
    assign uo_out[2] = LED;              // LED2
    assign uo_out[5:3] = state_filler;   // LED3, LED4, LED5
    assign uo_out[7:6] = state_sealer[1:0]; // LED6, LED7 (truncado)

    // No usamos pines bidireccionales
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule
