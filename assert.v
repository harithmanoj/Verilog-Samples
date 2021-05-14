// Assert module not synthesisable, checks equality condition.

module assert(input clk, input lhs, input rhs);
    always @(posedge clk)
    begin
        if (lhs !== rhs)
        begin
            $display("ASSERTION FAILED in %m");
            $finish;
        end
    end
endmodule