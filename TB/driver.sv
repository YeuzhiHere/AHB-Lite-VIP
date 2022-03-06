class driver;
  virtual dut_if vif;
  transaction trans_1;
  mailbox gtd; 
  mailbox dts;
  
function new(mailbox gtd, mailbox dts, virtual dut_if vif);
        this.gtd = gtd;  
        this.dts = dts;  
        this.vif = vif;     
endfunction

  task drive();
           gtd.get(trans_1);   
           $display($time ,"Enter into the driver "); 
           vif.drv_cb.haddr_f  <= trans_1.haddr_t;
           vif.drv_cb.hwrite_f <= trans_1.hwrite_t;
           vif.drv_cb.htrans_f <= trans_1.htrans_t;
           vif.drv_cb.hsize_f  <= trans_1.hsize_t;
           vif.drv_cb.hburst_f <= trans_1.hburst_t;
           vif.drv_cb.hsel_f <= 1;
           vif.drv_cb.error_f <= 0;
    	   vif.drv_cb.hprot_f <= trans_1.hprot_t;
    	   @(posedge vif.driver.hclk_f);
      	   vif.drv_cb.hwdata_f<= trans_1.hwdata_t;
    	   dts.put(trans_1);    
  endtask
         
endclass
