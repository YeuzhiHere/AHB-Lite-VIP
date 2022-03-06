interface dut_if(input bit hclk_f,hresetn_f);
    logic hsel_f;
    logic [31:0] haddr_f;
    logic [1:0] htrans_f;
    logic hwrite_f;
    logic [2:0] hsize_f;
    logic [2:0] hburst_f;
    logic [3:0] hprot_f;
    logic [31:0] hwdata_f;
    logic [31:0] hrdata_f;
  	logic hready_f;
    logic hresp_f;
  	logic error_f;
    
    clocking drv_cb @ (posedge hclk_f);
      output hsel_f, haddr_f, htrans_f, hwrite_f, hsize_f,   hburst_f, hprot_f, hwdata_f, error_f;
    endclocking
    
    clocking mon_cb @ (posedge hclk_f);
      input hrdata_f, hready_f, hresp_f; 
    endclocking
  
    modport driver(clocking drv_cb, input hclk_f, hresetn_f);
    modport monitor(clocking mon_cb, input hclk_f, hresetn_f);
  
endinterface
 