class transaction;
  rand bit [31:0] haddr_t;
  rand logic[1:0] htrans_t;
  rand logic hwrite_t;
  rand logic[2:0] hsize_t;
  rand logic[2:0] hburst_t;
  rand logic[3:0] hprot_t;
  rand logic[31:0] hwdata_t;  
  logic [31:0] hrdata_t;
  rand bit hsel_t;
  logic hready_t;
  logic hresp_t;
  logic error_t;

  constraint address {
      hsize_t == 3'b010;      
      hprot_t == 4'b0001;
      hsel_t == 1;
         };
  constraint c_addr { 
      hsize_t == `H_SIZE_32 -> haddr_t[1:0] == '0;
    haddr_t inside {[0:255]};
      solve hsize_t before haddr_t;
    }

endclass
