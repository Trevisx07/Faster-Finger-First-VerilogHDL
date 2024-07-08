module ff_f (
  input wire rst, clk,
  input wire [3:0] switches,
  output reg [3:0] first,
  output reg [3:0] second
);
  reg [1:0] state;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      state <= 2'b00;
      first <= 4'b0000;
      second <= 4'b0000;
    end
    else begin
      case (state)
        2'b00: begin
          if (switches != 4'b0000) begin
            first <= switches;
            state <= 2'b01;
          end
        end
        2'b01: begin
          second <= switches;
          state <= 2'b10;
        end
        2'b10: begin
        end
        default: begin
          state <= 2'b00;
        end
      endcase
    end
  end
endmodule
