interface alu_inter( input bit clk);

logic reset;

logic [3:0] a,b;

logic [2:0] opcode;

logic [7:0] c;

clocking cb@(posedge clk);

default input #2ns output #3ns;

output a, b, opcode;

endclocking

modport TB(clocking cb, output reset);
sequence s1;

  (opcode==3'b000) ##[0:$](c==a+b);

endsequence

property p1;

@(posedge clk) s1;

endproperty:p1

  a1:assert property (p1)$display("c=a+b,P1 passed");

else $display("P1 failed");

property p2;

@(posedge clk) (reset==1)|-> (c==3'b000);

endproperty:p2

a2: assert property(p2) $display("counter reset,P2
passed");

else $display("P2 failed");
endinterface
