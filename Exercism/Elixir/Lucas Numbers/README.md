# Instruction
You are a huge fan of the Numberphile Youtube channel and you just saw a cool video about the Lucas Number Sequence. You want to create this sequence using Elixir.

While designing your function, you want to make use of lazy evaluation, so that you can generate as many numbers as you want, but only if you need to -- So you decide to use a stream:

1. Generate the base cases
You know that the sequence has two starting numbers which don't follow the same rule. Write two base case clauses to return these numbers:

LucasNumbers.generate(1)
# => [2]

LucasNumbers.generate(2)
# => [2, 1]
2. Create the generalized case
For any sequence longer than 2, you know that you need to add the previous two numbers to get the next number and so on. Write the generalized case.

LucasNumbers.generate(3)
# => [2, 1, 3]

LucasNumbers.generate(4)
# => [2, 1, 3, 4]
3. Catch bad arguments
Later, you find someone is using your function and having problems because they are using incorrect arguments. Add a guard clause to raise an error if a non-integer or an integer less than 1 is used to generate the sequence:

LucasNumbers.generate("Hello World")
# => ** (ArgumentError) count must be specified as an integer >= 1

# Links
1. https://exercism.org/tracks/elixir/exercises/lucas-numbers
