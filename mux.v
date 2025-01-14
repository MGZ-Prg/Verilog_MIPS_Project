module MUX_RegDst(instruction_20_16,instruction_15_11,Write_Register,RegDst);

input  wire [4:0] instruction_20_16;
input  wire [4:0] instruction_15_11;
output reg  [4:0] Write_Register;
input wire RegDst;

always@(instruction_20_16,instruction_15_11,RegDst)
begin 
	if(RegDst == 0)
	begin
	Write_Register <= instruction_20_16;
	end

	else if (RegDst == 1)
	begin
	Write_Register <= instruction_15_11;
	end

	else 
	begin
	$display ("RegDst: %b",RegDst);
	end
end

endmodule

module MUX_32(input_0,input1,output_mux,selector);

input  wire [31:0] input_0;
input  wire [31:0] input1;
output reg  [31:0] output_mux;
input wire selector;

always@(input_0,input1,selector)
begin 
	if(selector == 0)
	begin
	output_mux <= input_0;
	end

	else if (selector == 1)
	begin
	output_mux <= input1;
	end

	else 
	begin
	$display ("selector: %b",selector);
	end
end

endmodule

module TEST_MUX;

reg [4:0] ins_20_16;
reg [4:0] ins_15_11;
wire  [4:0] Write_register;
reg Regdst;

initial 
begin
$monitor("output=%b",Write_register);

ins_20_16 = 5'b01010;
ins_15_11 = 5'b00000;

#1 Regdst = 0;
#1 Regdst = 1;
#1 Regdst = 1'bx;
#1 Regdst = 1'bz;

end

MUX_RegDst Mostafa_Ray2(ins_20_16,ins_15_11,Write_register,Regdst);


endmodule
