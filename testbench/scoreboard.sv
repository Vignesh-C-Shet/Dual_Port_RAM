class scoreboard #(parameter ADDER_WIDTH = 3, parameter DATA_WIDTH = 8);
  mailbox mon2scr;
  transaction mx;
 logic [DATA_WIDTH -1:0]mem[2**ADDER_WIDTH-1:0];
  
  function new(mailbox mon2scr);
    this.mon2scr = mon2scr;
  endfunction
  
  
  task run();
    
    forever begin
      mon2scr.get(mx);
      
      if(mx.we_a == 1) begin
        mem[mx.addr_a] = mx.datain_a;
        $display("time = %0t | Writing mem[%d] = %d", $time,mx.addr_a,mx.datain_a);
		end
      
      else  if(mx.we_a == 0) begin
        if( mem[mx.addr_a] == mx.dataout_a) begin
          $display("verification passed | time = %0t | mx.we_a = %b | mx.addr_a = %d | mx.datain_a = %d | mx.dataout_a = %d | mem[mx.addr_a] = %d", $time, mx.we_a, mx.addr_a, mx.datain_a, mx.dataout_a, mem[mx.addr_a]);
      end
      
        else begin
          $display("verification failed | time = %0t | mx.we_a = %b | mx.addr_a = %d | mx.datain_a = %d | mx.dataout_a = %d | mem[mx.addr_a] = %d", $time, mx.we_a, mx.addr_a, mx.datain_a, mx.dataout_a, mem[mx.addr_a]);
      end
	end
      
      if(mx.we_b == 1) begin
        mem[mx.addr_b] = mx.datain_b;
        $display("time = %0t | Writing mem[%d] = %d", $time, mx.addr_b,mx.datain_b);
		end
      else  if(mx.we_b == 0) begin
       
        if(mem[mx.addr_b] == mx.dataout_b) begin
          $display("verification passed | time = %0t | mx.we_b = %b | mx.addr_b = %d | mx.datain_b = %d | mx.dataout_b = %d | mem[mx.addr_b] = %d", $time, mx.we_b, mx.addr_b, mx.datain_b, mx.dataout_b, mem[mx.addr_b]);
      end
     
        else begin
          $display("verification failed | time = %0t | mx.we_b = %b | mx.addr_b = %d | mx.datain_b = %d | mx.dataout_b = %d | mem[mx.addr_b] = %d", $time, mx.we_b, mx.addr_b, mx.datain_b, mx.dataout_b, mem[mx.addr_b]);
      end
	end
    
      if((mx.we_a==1)&&(mx.we_b==1)&&(mx.addr_a == mx.addr_b)) begin
        mem[mx.addr_a] = mx.datain_a;
      end
    end
  endtask
endclass