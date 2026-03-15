defmodule Matrix do
  defstruct matrix: nil

  @doc """
  Convert an `input` string, with rows separated by newlines and values
  separated by single spaces, into a `Matrix` struct.
  """
  @spec from_string(input :: String.t()) :: %Matrix{}
  def from_string(input) do
    rows = String.split(input, "\n") |> Enum.map(& String.split(&1, " ") |> Enum.map(fn x -> String.to_integer(x) end))
    columns =
      rows
      |> Enum.reduce([], fn row, acc ->
        row
        |> Enum.with_index()
        |> Enum.reduce(acc, fn {col, j}, acc2 ->
          if acc == [] do
            List.insert_at(acc2, j, [col])
          else
            List.update_at(acc2, j, & &1 ++ [col])
          end
      end)
    end)
    %Matrix{matrix: %{rows: rows, columns: columns}}
  end

  @doc """
  Write the `matrix` out as a string, with rows separated by newlines and
  values separated by single spaces.
  """
  @spec to_string(matrix :: %Matrix{}) :: String.t()
  def to_string(matrix) do
    matrix.matrix.rows
    |> Enum.map(& Enum.join(&1, " "))
    |> Enum.join("\n")
  end

  @doc """
  Given a `matrix`, return its rows as a list of lists of integers.
  """
  @spec rows(matrix :: %Matrix{}) :: list(list(integer))
  def rows(matrix) do
    matrix.matrix.rows
  end

  @doc """
  Given a `matrix` and `index`, return the row at `index`.
  """
  @spec row(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def row(matrix, index) do
    Enum.at(matrix.matrix.rows, index-1)
  end

  @doc """
  Given a `matrix`, return its columns as a list of lists of integers.
  """
  @spec columns(matrix :: %Matrix{}) :: list(list(integer))
  def columns(matrix) do
    matrix.matrix.columns
  end

  @doc """
  Given a `matrix` and `index`, return the column at `index`.
  """
  @spec column(matrix :: %Matrix{}, index :: integer) :: list(integer)
  def column(matrix, index) do
    Enum.at(matrix.matrix.columns, index-1)
  end
end



a = IO.inspect(Matrix.from_string("1 2 3\n4 5 6\n7 8 9\n8 7 6"))
IO.inspect(Matrix.to_string(a))
