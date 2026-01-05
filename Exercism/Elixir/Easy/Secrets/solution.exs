defmodule Secrets do
  def secret_add(arg) do
    &(&1 + arg)
  end

  def secret_subtract(arg) do
    &(&1 - arg)
  end

  def secret_multiply(arg) do
    &(&1 * arg)
  end

  def secret_divide(arg) do
    &(trunc(&1 / arg))
  end

  def secret_and(arg) do
    &(Bitwise.band(&1, arg))
  end

  def secret_xor(arg) do
    &(Bitwise.bxor(&1, arg))
  end

  def secret_combine(arg1, arg2) do
    &(arg2.(arg1.(&1)))
  end

end


adder = Secrets.secret_add(2)
IO.puts(adder.(2))
subtractor = Secrets.secret_subtract(2)
IO.puts(subtractor.(3))
multiplier = Secrets.secret_multiply(7)
IO.puts(multiplier.(3))
divider = Secrets.secret_divide(3)
IO.puts(divider.(32))
ander = Secrets.secret_and(1)
IO.puts(ander.(2))
xorer = Secrets.secret_xor(1)
IO.puts(xorer.(3))
multiply = Secrets.secret_multiply(7)
divide = Secrets.secret_divide(3)
combined = Secrets.secret_combine(multiply, divide)
IO.puts(combined.(6))
