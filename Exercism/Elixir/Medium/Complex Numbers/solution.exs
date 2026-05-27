defmodule ComplexNumbers do
  @typedoc """
  In this module, complex numbers are represented as a tuple-pair containing the real and
  imaginary parts.
  For example, the real number `1` is `{1, 0}`, the imaginary number `i` is `{0, 1}` and
  the complex number `4+3i` is `{4, 3}'.
  """
  @type complex :: {number, number}

  @doc """
  Return the real part of a complex number
  """
  @spec real(a :: complex) :: number
  def real({real, _}) do
    real
  end

  @doc """
  Return the imaginary part of a complex number
  """
  @spec imaginary(a :: complex) :: number
  def imaginary({_, imaginary}) do
    imaginary
  end

  @doc """
  Multiply two complex numbers, or a real and a complex number
  """
  @spec mul(a :: complex | number, b :: complex | number) :: complex
  def mul(a, b) do
    recognize(a, b, :mult)
  end

  @doc """
  Add two complex numbers, or a real and a complex number
  """
  @spec add(a :: complex | number, b :: complex | number) :: complex
  def add(a, b) do
    recognize(a, b, :add)
  end

  @doc """
  Subtract two complex numbers, or a real and a complex number
  """
  @spec sub(a :: complex | number, b :: complex | number) :: complex
  def sub(a, b) do
    recognize(a, b, :sub)
  end

  @doc """
  Divide two complex numbers, or a real and a complex number
  """
  @spec div(a :: complex | number, b :: complex | number) :: complex
  def div(a, b) do
    recognize(a, reciprocal(b), :mult)
  end

  @doc """
  Absolute value of a complex number
  """
  @spec abs(a :: complex) :: number
  def abs({real, imaginary}) do
    :math.sqrt(:math.pow(real, 2) + :math.pow(imaginary, 2))
  end

  @doc """
  Conjugate of a complex number
  """
  @spec conjugate(a :: complex) :: complex
  def conjugate({real, imaginary}) do
    {real, -imaginary}
  end

  @doc """
  Exponential of a complex number
  """
  @spec exp(a :: complex) :: complex
  def exp({real, imaginary}) do
    mul(:math.exp(real), {:math.cos(imaginary), :math.sin(imaginary)})
  end

  @spec exp(a :: complex | number) :: complex
  defp reciprocal(a = {real, imaginary}) do
    {real / :math.pow(ComplexNumbers.abs(a), 2), - imaginary / :math.pow(ComplexNumbers.abs(a), 2)}
  end

  defp reciprocal(a) do
    1 / a
  end

  defp recognize({a_real, a_imaginary}, {b_real, b_imaginary}, operation) do
    case operation do
      :add -> {a_real + b_real, a_imaginary + b_imaginary}
      :sub -> {a_real - b_real, a_imaginary - b_imaginary}
      :mult -> {a_real * b_real - a_imaginary * b_imaginary, a_imaginary * b_real + a_real * b_imaginary}
    end
  end

  defp recognize({a_real, a_imaginary}, b_real, operation) do
    case operation do
      :add -> {a_real + b_real, a_imaginary}
      :sub -> {a_real - b_real, a_imaginary}
      :mult -> {a_real * b_real, a_imaginary * b_real}
    end
  end

  defp recognize(a_real, {b_real, b_imaginary}, operation) do
    case operation do
      :add -> {a_real + b_real, b_imaginary}
      :sub -> {a_real - b_real, -b_imaginary}
      :mult -> {a_real * b_real, b_imaginary * a_real}
    end

  end

  defp recognize(a_real, b_real, operation) do
    case operation do
      :add -> {a_real + b_real, 0}
      :sub -> {a_real - b_real, 0}
      :mult -> {a_real * b_real, 0}
    end
  end
end
