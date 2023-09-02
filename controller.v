//Division Controller
module controller(C,St,Sh,Ld,V,CLK);

    //Inputs
    input C;
    input St;
    input CLK;

    //Output Registers
    output reg Sh;
    output reg Ld;

    //Outputs
    output V;

    //Registers
    reg DONE = 0;
    reg [4:0] counter = 0; 

    //Logical Assignment
    assign V = DONE;

    //Logic Circuit
    always @(posedge CLK) begin
        if (St == 1) begin
            DONE = 0;

            if (DONE == 0) begin
                if (C == 0) begin
                Ld <= 1;
                Sh <= 0;
                end

                else begin
                Ld <= 0;
                Sh <= 1;
                counter = counter + 1;

                    if (counter >= 4) begin
                        counter = 0;
                        DONE = 1;
                    end
                end
            end 

            else 
            begin
                counter = 0;
            end 
        end
    end

endmodule