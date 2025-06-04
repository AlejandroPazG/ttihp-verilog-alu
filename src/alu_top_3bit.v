
module alu_top_3bit (
    input  wire [2:0] A,
    input  wire [2:0] B,
    input  wire [1:0] sel,
    output reg  [2:0] Y,
    output reg        Cout
);
    wire [2:0] sum_out, and_out, or_out;
    wire       cout_sum;

    // Módulo de suma/resta
    addsub_3bit u_addsub (
        .A(A),
        .B(B),
        .Sel(sel[0]),  // 0: suma, 1: resta
        .Y(sum_out),
        .Cout(cout_sum)
    );

    // Módulo AND
    and_3bit u_and (
        .A(A),
        .B(B),
        .Y(and_out)
    );

    // Módulo OR
    or_3bit u_or (
        .A(A),
        .B(B),
        .Y(or_out)
    );

    always @(*) begin
        case (sel)
            2'b00, 2'b01: begin
                Y    = sum_out;
                Cout = cout_sum;
            end
            2'b10: begin
                Y    = and_out;
                Cout = 0;
            end
            2'b11: begin
                Y    = or_out;
                Cout = 0;
            end
            default: begin
                Y    = 3'b000;
                Cout = 0;
            end
        endcase
    end

endmodule
