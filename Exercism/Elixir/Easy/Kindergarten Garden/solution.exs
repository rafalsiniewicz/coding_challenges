defmodule Garden do
  @seeds %{
    "G" => :grass,
    "C" => :clover,
    "R" => :radishes,
    "V" => :violets,
  }
  @student_names [:alice, :bob, :charlie, :david, :eve, :fred, :ginny, :harriet, :ileana, :joseph, :kincaid, :larry]

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """
  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @student_names) do
    sorted_student_names = Enum.sort(student_names)
    initial_map = Map.new(sorted_student_names, &{&1, {}})

    info_string
    |> String.split("\n")
    |> Enum.reduce(initial_map, fn row, acc ->
      row_info(row, acc, sorted_student_names)
    end)
    |> Enum.map(fn {key, value} -> {key, List.to_tuple(value)} end)
    |> Enum.into(%{})
  end

  defp row_info(row, acc, student_names) do
    row
    |> String.codepoints()
    |> Enum.with_index(& {Integer.floor_div(&2, 2), &1})
    |> Enum.reduce(acc, fn {index, char}, acc2 ->
      Map.update(acc2, Enum.at(student_names, index), List.wrap(@seeds[char]), & &1 ++ List.wrap(@seeds[char]))
    end)
  end
end


IO.inspect(Garden.info("RC\nGG"))
