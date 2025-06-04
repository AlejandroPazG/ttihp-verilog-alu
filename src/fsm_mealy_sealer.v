module fsm_mealy_sealer (
    input clk,
    input rst,
    input lleno_flag,
    input productook,
    output reg sellando,
    output reg LED,
    output [2:0] state_indicator
);

    // Estados codificados manualmente
    localparam IDLE         = 3'b000;
    localparam CHECK_BOTTLE = 3'b001;
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
            IDLE:          next_state = (lleno_flag) ? CHECK_BOTTLE : IDLE;
            CHECK_BOTTLE:  next_state = (productook) ? FILLING : CHECK_BOTTLE;
            FILLING:       next_state = (productook) ? SEALING : FILLING;
            SEALING:       next_state = DONE;
            DONE:          next_state = IDLE;
            default:       next_state = IDLE;
        endcase
    end

    // Salidas tipo Mealy
    always @(*) begin
        sellando = (state == FILLING && productook);
        LED      = (state == SEALING);
    end

    assign state_indicator = state;

endmodule
