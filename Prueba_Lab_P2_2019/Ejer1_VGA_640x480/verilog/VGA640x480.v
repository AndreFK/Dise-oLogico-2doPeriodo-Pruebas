`include "VGADefines.vh"

module VGA640x480(
    input reset,
    input clk,
    output[2:0] red,
    output[2:0] green,
    output[1:0] blue,
    output reg [7:0] rgb,
    output hsync,
    output vsync
);
    reg [10:0] hcount /*verilator public*/;
    reg [9:0] vcount /*verilator public*/;
    reg hsyncr;
    reg vsyncr;
    
    assign hsync = hsyncr;
    assign vsync = vsyncr;
    
    always @ (posedge clk or posedge reset)
    begin
        if (reset)
        begin
            hcount <= 11'h0;
            vcount <= 10'h0;
            vsyncr <= 1'b0;
            hsyncr <= 1'b0;
        end
        else begin
            if (hcount == `VGA_HLIMIT) begin
                hcount <= 0;
                
                if (vcount == `VGA_VLIMIT)
                    vcount <= 0;
                else
                    vcount <= vcount + 1;
            end
            else
                hcount <= hcount + 1;
                
            if ((vcount >= `VGA_VSYNC_PULSE_START) && (vcount < `VGA_VSYNC_PULSE_END))
                vsyncr <= 0; //Vertical sync pulse (positive pulse)
            else
                vsyncr <= 1;
                
            if ((hcount >= `VGA_HSYNC_PULSE_START) && (hcount < `VGA_HSYNC_PULSE_END))
                hsyncr <= 0; //Horizontal sync pulse (positive pulse)
            else
                hsyncr <= 1;
            
            if ((hcount < `VGA_WIDTH) && (vcount < `VGA_HEIGHT))
            begin
                /* 
                   TODO: Draw a rectangle from (100,100) to (300, 200) in red color. 
                   The background should white.
                */
                if(hcount > 12'd99 && vcount > 11'd99) begin
                    if(vcount < 11'd199 && hcount < 300) begin
                        red = 3'b111;
                        blue = 2'b00;
                        green = 3'b000;
                    end
                end
                else begin
                    rgb <= 8'h15;
                end
            end
            else
                red = 3'b000;
                blue = 3'b00;
                green = 3'b000;
            end
    end
endmodule
