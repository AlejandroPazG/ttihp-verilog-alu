
module and_3bit (
    input  wire [2:0] A,
    input  wire [2:0] B,
    output wire [2:0] Y
);
    assign Y = A & B;
endmodule
