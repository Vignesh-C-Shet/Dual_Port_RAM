module top_tb;
	logic clk;
	dpram_if intf(clk);
	test t0;  
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
  dpram dut(
 .clk(intf.clk),
 .rst(intf.rst),
 .we_a(intf.we_a), 
 .we_b(intf.we_b), 
 .addr_a(intf.addr_a), 
 .addr_b(intf.addr_b), 
 .datain_a(intf.datain_a),
 .datain_b(intf.datain_b),
 .dataout_a(intf.dataout_a),
 .dataout_b(intf.dataout_b)
);
	
	initial begin
	
	intf.rst = 1;
	intf.datain_a =0;
	intf.datain_b = 0;
	intf.addr_a = 0;
	intf.addr_b = 0;
	
	#15 intf.rst = 0;
	
	t0 = new(intf);
	t0.run();
      
     
	end
	initial begin
	#526 $finish;
	end
 endmodule