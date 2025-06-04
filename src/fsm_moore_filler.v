module fsm_moore_filler (
    input clk,
    input rst,
    input startfill,
    output reg lleno_flag,
    output reg llenando,
    output [2:0] state_indicator
);

    // Estados codificados manualmente
    localparam IDLE         = 3'b000;
    localparam CHECK_SENSOR = 3'b001;
    localparam FILLING      = 3'b010;
    localparam SEALING      = 3'b011;
    localparam DONE         = 3'b100;

    reg [2:0] state;
    reg [2:0] next_state;

    // Lógica secuencial
    always @(posedge clk or posedge rst) begin
        if (rst)
            state <= IDLE;
        else
            state <= next_state;
    end

    // Transiciones
    always @(*) begin
        next_state = state;
        case (state)
            IDLE:         next_state = (startfill) ? CHECK_SENSOR : IDLE;
            CHECK_SENSOR: next_state = FILLING;
            FILLING:      next_state = SEALING;
            SEALING:      next_state = DONE;
            DONE:         next_state = IDLE;
            default:      next_state = IDLE;
        endcase
    end

    // Salidas tipo Moore
    always @(*) begin
        llenando    = (state == FILLING);
        lleno_flag  = (state == DONE);
    end

    assign state_indicator = state;

endmodule
