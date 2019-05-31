module number_of_digits(
    input [31:0] n, 
    input clk,
    input rst,
    output [7:0] count
);

reg [1:0] cs;
reg [1:0] ns;

reg [31:0] np;
reg [31:0] npp;
reg [7:0] cp;
reg [7:0] c;

always @ (posedge clk) begin
    if(rst)
        cs <= 2'b00;
    else
        cs <= ns;
end

always @ (*) begin
    case (cs)
        2'b00:
            if(np == 1'd0)
                assign ns = 2'b10;
            else
                assign ns = 2'b01;
        2'b01:
            if(np == 1'd0)
                assign ns = 2'b10;
            else
                assign ns = 2'b01;
        2'b10:
            assign ns = 2'b10;
    endcase
end

always @ (*) begin
    case (cs) 
        2'b00:begin
            np <= n;
            cp <= 0;
            end
        2'b01: begin
            npp <= np/4'b1010;
            c <= cp + 1'b1;
            end
        2'b10: begin
            count = c;
            end
    endcase
end

endmodule