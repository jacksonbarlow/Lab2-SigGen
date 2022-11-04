module sigdelay #(
    parameter A_WIDTH = 8,
              D_WIDTH = 8
)(
    // interface signals
    input logic                     clk,
    input logic                     rst,
    input logic                     wr,
    input logic                     rd,
    input logic     [A_WIDTH-1:0]   offset,
    input logic     [D_WIDTH-1:0]   mic_signal,
    output logic    [D_WIDTH-1:0]   delayed_signal
);

    logic [A_WIDTH-1:0]             addr;

counter rdaddrCounter (
    .clk (clk),
    .rst (rst),
    .en (1'b1),
    .incr (1'b1),
    .count (addr)
);

ram2ports micRam (
    .clk (clk),
    .wr_en (wr),
    .rd_en (rd),
    .wr_addr (addr + offset),
    .rd_addr (addr),
    .din (mic_signal),
    .dout (delayed_signal)
);

endmodule
