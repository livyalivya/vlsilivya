module simple_fsm (
    input wire clk,
    input wire reset,
    input wire button,
    output reg led
);

 
    typedef enum reg [0:0] {
        IDLE = 1'b0,
        ON   = 1'b1
    } state_t;

    state_t state, next_state;

    
    always @(posedge clk or posedge reset) begin
        if (reset)
            state <= IDLE;
        else
            state <= next_state;
    end

    
    always @(*) begin
        case (state)
            IDLE: next_state = (button) ? ON : IDLE;
            ON:   next_state = (button) ? IDLE : ON;
            default: next_state = IDLE;
        endcase
    end

    
    always @(*) begin
        led = (state == ON);
    end

endmodule