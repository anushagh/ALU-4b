module top;

bit clk;

ALU_inter Ia (clk);

ALU DUT(clk, Ia.reset, Ia.a, Ia.b , Ia.opcode, Ia.c);

test TB1 (Ia.TB);

always #5 clk=~clk;

initial

begin

$dumpfile("top.vcd");

$dumpvars;

$monitor("time=%d, clk=%b, reset=%b, a=%b,b=%b,opcode=%b, c=%b", $time, clk, Ia.reset,Ia.a,Ia.b,Ia.opcode, Ia.c);

end

endmodule
