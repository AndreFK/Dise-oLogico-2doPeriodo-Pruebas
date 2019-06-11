module GDCMAIN(
    inout clk;
    input [3:0] raddr1,
    input [3:0] raddr2,
    input wen,
    input [3:0] waddr,
    input wdsrc,
    input [3:0] func,
    input [31:0] constant
    input isZero,
    output [3:0] r1,
    output [3:0] r2,
    output wn,
    output wdsr,
    output [3:0] fn,
    output [31:0] const,
    output Zero
);
always @ (*) begin
    r1 <= raddr1;
    r2 <= raddr2;
    wn <= wen;
    wdsr <= wdsrc;
    fn <= func;
    const <= constant;
    Zero <= isZero;
end
endmodule