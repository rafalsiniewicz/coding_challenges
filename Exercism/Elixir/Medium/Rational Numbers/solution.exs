defmodule RationalNumbers do
  @type rational :: {integer, integer}

  @doc """
  Add two rational numbers
  """
  @spec add(a :: rational, b :: rational) :: rational
  def add(a, b) do
    {elem(a, 0) * elem(b, 1) + elem(b, 0) * elem(a, 1), elem(a, 1) * elem(b, 1)}

    |> reduce()
  end

  @doc """
  Subtract two rational numbers
  """
  @spec subtract(a :: rational, b :: rational) :: rational
  def subtract(a, b) do
    {elem(a, 0) * elem(b, 1) - elem(b, 0) * elem(a, 1), elem(a, 1) * elem(b, 1)} |> reduce()
  end

  @doc """
  Multiply two rational numbers
  """
  @spec multiply(a :: rational, b :: rational) :: rational
  def multiply(a, b) do
    {elem(a, 0) * elem(b, 0), elem(a, 1) * elem(b, 1)}
    |> reduce()
  end

  @doc """
  Divide two rational numbers
  """
  @spec divide_by(num :: rational, den :: rational) :: rational
  def divide_by(num, den) do
    {elem(num, 0) * elem(den, 1), elem(num, 1) * elem(den, 0)} |> reduce()
  end

  @doc """
  Absolute value of a rational number
  """
  @spec abs(a :: rational) :: rational
  def abs(a) do
    {Kernel.abs(elem(a, 0)), Kernel.abs(elem(a, 1))} |> reduce()
  end

  @doc """
  Exponentiation of a rational number by an integer
  """
  @spec pow_rational(a :: rational, n :: integer) :: rational
  def pow_rational(a, n) do
    {num, den, n} = if n > 0, do: {elem(a, 0), elem(a, 1), n}, else: {elem(a, 1), elem(a, 0), -n}
    {Integer.pow(num, n), Integer.pow(den, n)} |> reduce()
  end

  @doc """
  Exponentiation of a real number by a rational number
  """
  @spec pow_real(x :: integer, n :: rational) :: float
  def pow_real(x, n) do
    Float.pow(x * 1.0, elem(n, 0) / elem(n, 1))
  end

  @doc """
  Reduce a rational number to its lowest terms
  """
  @spec reduce(a :: rational) :: rational
  def reduce(a) when elem(a, 0) == 0, do: {elem(a, 0), 1}
  def reduce(a) when elem(a, 0) < 0 and elem(a, 1) < 0, do: RationalNumbers.abs(a)
  def reduce(a) when elem(a, 0) > 0 and elem(a, 1) < 0, do: reduce({-elem(a, 0), -elem(a, 1)})
  def reduce({a, a}), do: {1, 1}
  def reduce(a) when Kernel.abs(elem(a, 0)) == 1 or Kernel.abs(elem(a, 1)) == 1, do: a
  def reduce(a) do
    do_reduce(a)
  end

  defp do_reduce(a) do
    {l, m} = {Kernel.abs(elem(a, 0)), Kernel.abs(elem(a, 1))}
    min = min(l, m) |> max(2)
    # sqrt_min = max(:math.sqrt(min) |> trunc(), 2)
    lcd = Enum.find(2..min, & rem(l, &1) == 0 and rem(m, &1) == 0)
    if lcd, do: do_reduce({div(elem(a, 0), lcd), div(elem(a, 1), lcd)}), else: a
  end
end


# RationalNumbers.add({1, 2}, {2, 3}) |> IO.inspect()
# RationalNumbers.add({1, 2}, {-2, 3}) |> IO.inspect()
# RationalNumbers.add({-1, 2}, {-2, 3}) |> IO.inspect()
# RationalNumbers.add({1, 2}, {-1, 2}) |> IO.inspect()
# RationalNumbers.subtract({1, 2}, {2, 3}) |> IO.inspect()
# RationalNumbers.subtract({1, 2}, {-2, 3}) |> IO.inspect()
# RationalNumbers.subtract({-1, 2}, {-2, 3}) |> IO.inspect()
# RationalNumbers.subtract({1, 2}, {1, 2}) |> IO.inspect()
# RationalNumbers.multiply({1, 2}, {2, 3}) |> IO.inspect()
# RationalNumbers.multiply({-1, 2}, {2, 3}) |> IO.inspect()
# RationalNumbers.multiply({-1, 2}, {-2, 3}) |> IO.inspect()
# RationalNumbers.multiply({1, 2}, {2, 1}) |> IO.inspect()
# RationalNumbers.multiply({1, 2}, {1, 1}) |> IO.inspect()
# RationalNumbers.multiply({1, 2}, {0, 1}) |> IO.inspect()
# RationalNumbers.divide_by({1, 2}, {2, 3}) |> IO.inspect()
# RationalNumbers.divide_by({1, 2}, {-2, 3}) |> IO.inspect()
# RationalNumbers.divide_by({-1, 2}, {-2, 3}) |> IO.inspect()
# RationalNumbers.divide_by({1, 2}, {1, 1}) |> IO.inspect()
# RationalNumbers.abs({1, 2}) |> IO.inspect()
# RationalNumbers.abs({-1, -2}) |> IO.inspect()
# RationalNumbers.abs({-1, 2}) |> IO.inspect()
# RationalNumbers.abs({1, -2}) |> IO.inspect()
# RationalNumbers.abs({0, 1}) |> IO.inspect()
# RationalNumbers.abs({2, 4}) |> IO.inspect()
# RationalNumbers.pow_rational({1, 2}, 3) |> IO.inspect()
# RationalNumbers.pow_rational({-1, 2}, 3) |> IO.inspect()
# RationalNumbers.pow_rational({3, 5}, -2) |> IO.inspect()
# RationalNumbers.pow_rational({-3, 5}, -2) |> IO.inspect()
# RationalNumbers.pow_rational({-3, 5}, -3) |> IO.inspect()
# RationalNumbers.pow_rational({0, 1}, 5) |> IO.inspect()
# RationalNumbers.pow_rational({1, 1}, 4) |> IO.inspect()
# RationalNumbers.pow_rational({1, 2}, 0) |> IO.inspect()
# RationalNumbers.pow_rational({-1, 2}, 0) |> IO.inspect()
RationalNumbers.pow_real(8, {4, 3}) |> IO.inspect()
# RationalNumbers.pow_real(x, r) |> IO.inspect()
# RationalNumbers.pow_real(x, r) |> IO.inspect()
# RationalNumbers.reduce({2, 4}) |> IO.inspect()
# RationalNumbers.reduce({3, -4}) |> IO.inspect()
# RationalNumbers.reduce({-4, 6}) |> IO.inspect()
# RationalNumbers.reduce({3, -9}) |> IO.inspect()
# RationalNumbers.reduce({0, 6}) |> IO.inspect()
# RationalNumbers.reduce({-14, 7}) |> IO.inspect()
# RationalNumbers.reduce({13, 13}) |> IO.inspect()
