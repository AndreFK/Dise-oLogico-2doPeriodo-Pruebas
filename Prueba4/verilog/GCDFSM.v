module GCDSFN(
    input isZero,
    input clk,
    input rst,
    input [31:0] a,
    input [31:0] b,
    output reg [3:0] raddr1,
    output reg [3:0] raddr2,
    output reg wen,
    output reg [3:0] waddr,
    output reg wdsrc,
    output reg [3:0] func,
    output reg [31:0] constant
);

reg [2:0] cs;
reg [2:0] ns;

reg [31:0] a1;
reg [31:0] b1;

reg [31:0] a2;
reg [31:0] b2;

always @ (posedge clk) begin
    if(rst)
        cs<=3'd0;
    else
        cs<=ns; 
end

always @ (*) begin
    case(cs) 
        3'd0:
            ns<=3'd1;
        3'd1:
            ns<=3'd2;
        3'd2:
            ns<=3'd3;
        3'd3: begin
            if(a1 != b1)
                ns<=3'd4;
            else   
                ns<=3'd7;            
        3'd4:begin
            if(a1 > b1)
                ns<=3'd5;
            else(a1<b1)
                ns<=3'd6;
        3'd5:
            ns<=3'd3;
        3'd6:
            ns<=3'd3;
        3'd7:
            ns<=3'd7;
        default:
            ns<=3'dxxx;
    endcase
end

always @ (*) begin
    case(cs)
        3'd0: begin
            wen <= 1;
            waddr <= 4'd0;
            wdsrc <= 0;
            constant <= 32'd0;
        end
        3'd1: begin
            wen <= 1;
            waddr <= 4'd1;
            wdsrc <= 1;
            constant <= a;
        end
        3'd2: begin
            wen <= 1;
            waddr <= 4'd2;
            wdsrc <= 1;
            constant <= b;
        end
        3'd5: begin
            raddr1<=4'd1;
            raddr2<=4'd2;
            wen<=1;
            wdsrc <= 1;
            func <= 4'd1;
            waddr <= 4'd1;
	    a2 = a1 - b1;
        end
        3'd6: begin
            raddr1<=4'd2;
            raddr2<=4'd1;
            wen<=1;
            wdsrc <= 1;
            func <= 4'd1;
            waddr <= 4'd2;
	    b2 = b2 - a2;
        end
        3'd7: begin
            raddr1<=4'd2;
            raddr2<=4'd0;
            wen<=1;
            wdsrc <= 0;
            func <= 4'd0;
            waddr <= 4'd2;
            constant<=32'd0;
        end
        default: begin
            raddr1<=4'dx;
            raddr2<=4'dx;
            wen<=x;
            wdsrc <= x;
            func <= 4'dx;
            waddr <= 4'dx;
            constant<=32'dx;
        end 
    endcase
end


always @ (posedge clk) begin
	a1 <= a2;
	b1 <= b2;
end
endmodule
