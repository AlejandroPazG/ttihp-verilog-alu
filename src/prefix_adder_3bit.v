
module prefix_adder_3bit (
    input  wire [2:0] A,
    input  wire [2:0] B,
    output wire [2:0] Y,
    output wire       Cout
);
    wire [3:0] sum;
    assign {Cout, sum} = A + B;
    assign Y = sum[2:0];
endmodule
