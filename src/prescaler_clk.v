module prescaler_clk (
    input clk_in,         // Entrada: reloj de 100 MHz
    input reset,          // Entrada: reset
    output clk_out        // Salida: reloj dividido a 1 Hz
);

    parameter MAX_COUNT = 50000000 - 1;
    reg [25:0] counter = 0;
    reg clk_reg = 0;

    always @(posedge clk_in or posedge reset) begin
        if (reset) begin
            counter <= 0;
            clk_reg <= 0;
        end else begin
            if (counter == MAX_COUNT) begin
                counter <= 0;
                clk_reg <= ~clk_reg;
            end else begin
                counter <= counter + 1;
            end
        end
    end

    assign clk_out = clk_reg;

endmodule
