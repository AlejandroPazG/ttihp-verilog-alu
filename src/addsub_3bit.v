
module addsub_3bit (
    input  wire [2:0] A,
    input  wire [2:0] B,
    input  wire       Sel,   // 0 = suma, 1 = resta
    output wire [2:0] Y,
    output wire       Cout
);
    wire [2:0] B_xor;
    wire       Cin;
    assign B_xor = B ^ {3{Sel}};
    assign Cin   = Sel;

    wire [3:0] sum = A + B_xor + Cin;
    assign Y = sum[2:0];
    assign Cout = sum[3];
endmodule
