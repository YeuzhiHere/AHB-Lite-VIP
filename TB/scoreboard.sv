class scoreboard;

transaction pkt1, pkt2;      
int a_array[*]; 
  
mailbox  dts;       
mailbox  mts;       
logic [11:0] temp_addr;     

function new(mailbox dts, mailbox  mts);    
    $display("scoreboard function");
    this.dts = dts;
    this.mts = mts;
endfunction

  logic [11:0] mem_tb [4096]; 

task data_write();
  
    $display("scoreboard check...");
    
    dts.get(pkt1);     
    mts.get(pkt2);    
   
    if (pkt1.htrans_t == 2'b10 || pkt1.htrans_t == 2'b00)
    begin   
        temp_addr = pkt1.haddr_t[11:0];
    end
    
    else 
    begin
        temp_addr =  temp_addr +4; 
    end

     a_array[pkt1.haddr_t] = pkt1.haddr_t;
    {mem_tb[temp_addr[11:0]], mem_tb[temp_addr[11:0] + 1], mem_tb[temp_addr[11:0] +2], mem_tb[temp_addr[11:0] +3]} = pkt1.hwdata_t;
    
    $display("HADDR from input packet \t %h", temp_addr);
    
    $display("HWDATA FROM input packet \t %h", pkt1.hwdata_t);
    
    $display(" Data in the memory %h" , {mem_tb[temp_addr[11:0]], mem_tb[temp_addr[11:0] + 1], mem_tb[temp_addr[11:0] +2], mem_tb[temp_addr[11:0] +3]} );
    

    assert (pkt1.hwdata_t == {mem_tb[temp_addr[11:0]], mem_tb[temp_addr[11:0] + 1], mem_tb[temp_addr[11:0] +2], mem_tb[temp_addr[11:0] +3]})
      $display("Data has been written successfully");	
	else  
		$error("Data failed to write");

$display("");
endtask


task data_read();
    $display("Scoreboard read ");
    dts.get(pkt1);
    mts.get(pkt2);
  if(a_array.exists(pkt1.haddr_t)) begin
    if (pkt1.htrans_t == 2'b10 || pkt1.htrans_t == 2'b00)
    begin    
        temp_addr = pkt1.haddr_t[11:0];
    end
    else 
    begin
        temp_addr =  temp_addr +4;
    end

    $display("temp address = %h", temp_addr);

    $display("Read data from DUT %h", pkt2.hrdata_t); 
    $display("DATA from TB memory %h", {mem_tb[temp_addr], mem_tb[temp_addr + 1], mem_tb[temp_addr +2], mem_tb[temp_addr +3] } );
	
    assert (pkt2.hrdata_t == {mem_tb[temp_addr[11:0]], mem_tb[temp_addr[11:0] + 1], mem_tb[temp_addr[11:0] +2], mem_tb[temp_addr[11:0] +3]})
 		$display("Data read successfully and it matches");
	else
		$error("Data reading failed");

     $display("");
     end

    endtask
  
endclass
