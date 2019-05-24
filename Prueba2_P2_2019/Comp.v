module Prueba2(
    input a [7:0],
    input b [7:0],
    output c
);

    wire a1;
    wire [3:0] g1;
    wire [3:0] a11;

    wire a2;
    wire [3:0] g2;
    wire [3:0] a22;

    wire a3;
    wire [3:0] g3;
    wire [3:0] a33;

    wire a4;
    wire [3:0] g4;
    wire [3:0] a44;

    wire a5;
    wire [3:0] g5;
    wire [3:0] a55;

    wire a6;
    wire [3:0] g6;
    wire [3:0] a66;

    wire a7;
    wire [3:0] g7;
    wire [3:0] a77;

    wire b1;
    wire b2;
    wire b3;
    wire b4;
    wire b5;
    wire b6;
    wire b7;

    assign a1 = a[0];
    assign b1 = b[0];

    assign a2 = a[2];
    assign b2 = b[2];

    assign a3 = a[3];
    assign b3 = b[3];

    assign a4 = a[4];
    assign b4 = b[4];

    assign a5 = a[5];
    assign b5 = b[5];

    assign a6 = a[6];
    assign b6 = b[6];

    assign a7 = a[7];
    assign b7 = b[7];

    assign g1 = 7;
    assign a11 = (a1 & b1) || ((~a1) & (~b1)) ? g1 - 1 : g1;

    assign g2 = a11;
    assign a22 = (a2 & b2) || ((~a2) & (~b2)) ? g2 - 1 : g2;

    assign g3 = a22;
    assign a33 = (a3 & b3) || ((~a3) & (~b3)) ? g3 - 1 : g3;

    assign g4 = a33;
    assign a44 = (a4 & b4) || ((~a4) & (~b4)) ? g4 - 1 : g4;

    assign g5 = a44;
    assign a55 = (a5 & b5) || ((~a5) & (~b5)) ? g5 - 1 : g5;

    assign g6 = a55;
    assign a66 = (a6 & b6) || ((~a6) & (~b6)) ? g6 - 1 : g6;

    assign g7 = a66;
    assign a77 = (a7 & b7) || ((~a7) & (~b7)) ? g7 - 1 : g7;
    
    assign c = a77 ^ 4'b0001 ? 1'b0 : 1'b1;

endmodule
