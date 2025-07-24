module bcd_to_7seg_display (
    input clk,                 
    input reset,                
  input [3:0] bcd_data,      
    output reg [6:0] seg,       
    output reg [3:0] an         
);

    reg [1:0] digit_select;
    reg [3:0] current_bcd;

    
    reg [15:0] refresh_counter = 0;
    wire refresh_tick = (refresh_counter == 49999); 

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            refresh_counter <= 0;
        end else if (refresh_tick) begin
            refresh_counter <= 0;
            digit_select <= digit_select + 1;
        end else begin
            refresh_counter <= refresh_counter + 1;
        end
    end

    
    always @(*) begin
        case (digit_select)
            2'b00: begin
                current_bcd = bcd_data[3:0];
                an = 4'b1110; 
            end
            2'b01: begin
                current_bcd = bcd_data[7:4];
                an = 4'b1101;
            end
            2'b10: begin
                current_bcd = bcd_data[11:8];
                an = 4'b1011; 
            end
            2'b11: begin
                current_bcd = bcd_data[15:12];
                an = 4'b0111; 
            end
        endcase
    end

    
    always @(*) begin
        case (current_bcd)
            4'd0: seg = 7'b1111110;
            4'd1: seg = 7'b0110000;
            4'd2: seg = 7'b1101101;
            4'd3: seg = 7'b1111001;
            4'd4: seg = 7'b0110011;
            4'd5: seg = 7'b1011011;
            4'd6: seg = 7'b1011111;
            4'd7: seg = 7'b1110000;
            4'd8: seg = 7'b1111111;
            4'd9: seg = 7'b1111011;
            default: seg = 7'b0000001; 
        endcase
    end

endmodule