`include "transaction.sv"
`include "generator.sv"
`include "interface.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module testbench_top;
  logic clk, rst;
  always
   begin
	forever begin
		#5 clk = ~clk;	
	end
   end  
   initial begin
    clk = 1;
	rst = 0;
	#10
	rst = 1;
    #3000;
    $stop; 
   end

  dut_if dif_1(clk,rst);
  test t0(dif_1);
  amba_ahb_slave ahb_s (.hclk (clk),
                        .hresetn(rst),
                        .hsel(dif_1.hsel_f),
                        .haddr(dif_1.haddr_f),
                        .htrans(dif_1.htrans_f),
                        .hwrite(dif_1.hwrite_f),
                        .hsize(dif_1.hsize_f),
                        .hburst(dif_1.hburst_f),
                        .hprot(dif_1.hprot_f),
                        .hwdata(dif_1.hwdata_f),
                        .hrdata(dif_1.hrdata_f),
                        .hready(dif_1.hready_f),
                        .hresp(dif_1.hresp_f),
                        .error(dif_1.error_f));
  
    initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
    end
 
  covergroup cover_burst @(posedge clk);
    option.per_instance =  1;
    option.goal         =  40;
    option.weight       =  20;
    option.at_least     =  1;
    coverpoint dif_1.hburst_f {
      bins SINGLE   = {3'b000};
      bins INCR     = {3'b001};
      bins WRAP4    = {3'b010};
      bins INCR4    = {3'b011};
      bins WRAP8    = {3'b100};
      bins INCR8    = {3'b101};
      bins WRAP16   = {3'b110};
      bins INCR16   = {3'b111};
    }
  endgroup
	
  covergroup cover_size @(posedge clk);
    coverpoint dif_1.hsize_f {
      bins Word              = {3'b010};
    }
  endgroup

  
  covergroup cover_trans @(posedge clk);
    option.per_instance = 1;
    option.goal         = 40;
    option.weight       = 20;
    option.at_least     =  1;
    coverpoint dif_1.htrans_f {
      bins trans_idle_idle   = (2'b00  => 2'b00);
      bins trans_idle_busy   = (2'b00  => 2'b01);
      bins trans_busy_nonseq = (2'b01  => 2'b10 );
      bins trans_nonseq_seq  = (2'b10  => 2'b11 );
      bins trans_nonseq_busy = (2'b10  => 2'b01);
      bins trans_nonseq_idle = (2'b10 => 2'b00);
      bins trans_nonseq_nonseq  = (2'b10 => 2'b10);		
      bins trans_seq_nonseq  = (2'b11 => 2'b10);			
    }
  endgroup

 
  covergroup cover_address @(posedge clk);
    option.per_instance = 1;
    coverpoint dif_1.haddr_f {
      bins zero = {[0:8]};
      bins low[4] = {[8:16]};
      bins med[4] = {[16:64]};
      bins high[4] = {[64:256]};
      bins misc = default;
    }
  endgroup

  
  covergroup cross_cover_HBURST_HSIZE @(posedge clk);
    option.per_instance = 1;
    coverpoint dif_1.hburst_f {
      bins SINGLE   = {3'b000};
      bins INCR     = {3'b001};
      bins WRAP4    = {3'b010};
      bins INCR4    = {3'b011};
      bins WRAP8    = {3'b100};
      bins INCR8    = {3'b101};
      bins WRAP16   = {3'b110};
      bins INCR16   = {3'b111};
    }
    coverpoint dif_1.hsize_f {
      bins Word              = {3'b010};
    }
    cross dif_1.hburst_f, dif_1.hsize_f;
  endgroup
  cover_burst cg1;
  cover_size cg2;
  cover_trans cg3;
  cover_address cg4;
  cross_cover_HBURST_HSIZE cg5;
  
  initial
    begin
    cg1 =new();
    cg2 = new();
    cg3 = new();
    cg4 = new();
    cg5 = new();
    end
  
endmodule



