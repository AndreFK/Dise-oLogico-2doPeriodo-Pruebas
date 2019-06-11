module GPPM(
    input clk,
    input [3:0] raddr1,
    input [3:0] raddr2,
    input wen,
    input [3:0] waddr,
    input wdsrc,
    input [3:0] func,
    input [31:0] constant,
    output isZero,
    output result
);

    wire [31:0] rdata1;
    wire [31:0] rdata2;
    wire [31:0] wdata;
    wire [31:0] ares;

    assign wdata = (wdsrc)? ares : constant;

    RegFile rf (
        .clk (clk),
        .raddr1 (raddr1),
        .raddr2 (raddr2),
        .wen (wen),
        .waddr (waddr),
        .wdata (wdata),
        .rdata1 (rdata1),
        .rdata2 (rdata2)
    );

    ALU alu (
        .a (rdata1),
        .b (rdata2),
        .func (func),
        .res (ares),
        .isZero (isZero)
    );
endmodule
