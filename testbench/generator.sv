class generator;

  mailbox gen2drv;
  transaction tx;

  function new(mailbox gen2drv);
    this.gen2drv = gen2drv;
  endfunction

 
  task run();
    
    generate_write();
    generate_read();
    generate_mix();
  endtask
  task generate_write();
    for(int i = 0; i < 20; i = i + 1) begin
      tx = new();
      tx.randomize() with {
        tx.addr_a inside {[0:3]};
        tx.addr_b inside {[4:7]};
        datain_a inside {[0:255]};
        datain_b inside {[0:255]};
                        };
        tx.we_a = 1;
        tx.we_b = 1;
        tx.dataout_a = 'bz;
        tx.dataout_b = 'bz;
       gen2drv.put(tx);
      tx.print("write_generator");
        end
        endtask
    task generate_read();
          for(int i=0; i< 20; i=i+1) begin
            tx = new();
            tx.randomize() with {
              addr_a inside {[0:3]};
              addr_b inside {[4:7]};
            };
            tx.we_a = 0;
            tx.we_b = 0;
            tx.datain_a = 'bz;
            tx.datain_b = 'bz;
             gen2drv.put(tx);
            tx.print("read_generator");
          end
        endtask
  task generate_mix();
    for(int i = 0; i < 10; i = i + 1) begin
      tx = new();
      tx.randomize() with {
        tx.addr_a inside {[0:7]};
        tx.addr_b inside {[0:7]};
        datain_a inside {[0:255]};
        datain_b inside {[0:255]};
                        };
       
        tx.dataout_a = 'bz;
        tx.dataout_b = 'bz;
       gen2drv.put(tx);
      tx.print("both_generator");
        end
        endtask
  
  
endclass