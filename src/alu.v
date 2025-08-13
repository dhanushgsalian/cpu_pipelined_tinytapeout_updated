module alu #(parameter WIDTH = 8,OP_WIDTH = 3) (alu_op, op1, op2, out);
  input [OP_WIDTH - 1:0] alu_op;      // 8-bit opcode that determines the operation
  input [WIDTH - 1:0] op1;            // First operand
  input [WIDTH - 1:0] op2;            // Second operand
  output reg [WIDTH-1:0] out = {8{1'b0}};       // Output result

  always @(alu_op, op1, op2) begin
    case(alu_op)
      3'b001: out = op1 + op2;               // Addition of op1 and op2
      3'b010: out = op1 - op2;               // Subtraction of op2 from op1
      3'b011: out = op1 & op2;               //bitwise AND of op1 and op2
      3'b100: out = op1 | op2;               // Bitwise OR of op1 and op2
      3'b101: out = op1 ^ op2;               // Bitwise XOR of op1 and op2
      default: out = {8{1'b0}};          // Default case: if no opcode matches, set out to 0
    endcase
  end

endmodule
