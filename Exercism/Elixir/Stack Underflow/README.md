# Instruction
While continuing your work at Instruments of Texas, there is progress being made on the Elixir implementation of the RPN calculator. Your team would like to be able to raise errors that are more specific than the generic errors provided by the standard library. You are doing some research, but you have decided to implement two new errors which implement the Exception Behaviour.

1. Error for Division by Zero
Dividing a number by zero produces an undefined result, which the team decides is best represented by an error.

Implement the DivisionByZeroError module to have the error message: "division by zero occurred"

raise DivisionByZeroError
# => ** (DivisionByZeroError) division by zero occurred
2. Error when encountering stack underflow
RPN calculators use a stack to keep track of numbers before they are added. The team represents this stack with a list of numbers (integer and floating-point), e.g.: [3, 4.0]. Each operation needs a specific number of numbers on the stack in order to perform its calculation. When there are not enough numbers on the stack, this is called a stack underflow error. Implement the StackUnderflowError exception which provides a default message, and optional extra context

raise StackUnderflowError
# => ** (StackUnderflowError) stack underflow occurred

raise StackUnderflowError, "when dividing"
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing
3. Write a dividing function
Implement the divide/1 function which takes a stack (a list of two numbers) and:

raises stack underflow when the stack does not contain enough numbers
raises division by zero when the divisor is 0 (note the stack of numbers is stored in the reverse order)
performs the division when no errors are raised
RPNCalculator.Exception.divide([])
# => ** (StackUnderflowError) stack underflow occurred, context: when dividing

RPNCalculator.Exception.divide([0, 100])
# => ** (DivisionByZeroError) division by zero occurred

RPNCalculator.Exception.divide([4, 16])
# => 4
Note the order of the list is reversed!

# Links
1. https://exercism.org/tracks/elixir/exercises/stack-underflow
