module dpram #(parameter ADDER_WIDTH = 3, parameter DATA_WIDTH = 8)
  (input clk,
   input rst,

//control signals
   input [ADDER_WIDTH-1:0] addr_a,
   input we_a,
   input [ADDER_WIDTH-1:0] addr_b,
   input we_b,

//data signals
   input [DATA_WIDTH - 1 : 0] datain_a,
   input [DATA_WIDTH - 1 : 0] datain_b,
   output reg [DATA_WIDTH - 1 : 0] dataout_a,
   output reg [DATA_WIDTH - 1 : 0] dataout_b
);
  reg [DATA_WIDTH - 1:0]mem[2**ADDER_WIDTH-1:0];


always @(posedge clk or posedge rst) begin
	if(rst) begin
      for(int i=0;i<2**ADDER_WIDTH; i= i + 1)
	mem[i] <= 0;
	dataout_a <= 0;
	dataout_b <= 0;
        
	end

	if(we_a == 1) begin
      mem[addr_a] <= datain_a;
		end
	else if(we_a == 0) begin
	dataout_a <= mem[addr_a];
	end
	if(we_b == 1) begin
      mem[addr_b] <= datain_b;
		end
	else if(we_b == 0) begin
	dataout_b <= mem[addr_b];
	end
	if((we_a==1)&&(we_b==1)&&(addr_a == addr_b)) begin
      mem[addr_a] <= datain_a;
	end
	end
endmodule