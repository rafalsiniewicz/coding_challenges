defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @type school :: any()

  @doc """
  Create a new, empty school.
  """
  @spec new() :: school
  def new() do
    %{}
  end

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(school, String.t(), integer) :: {:ok | :error, school}
  def add(school, name, grade) do
    all_names = Map.values(school) |> List.flatten()
    if name in all_names do
      {:error, school}
    else
      {:ok, Map.put(school, grade, Map.get(school, grade, []) ++ [name])}
    end

  end

  @doc """
  Return the names of the students in a particular grade, sorted alphabetically.
  """
  @spec grade(school, integer) :: [String.t()]
  def grade(school, grade) do
    school
    |> Map.get(grade, [])
    |> Enum.sort()
  end

  @doc """
  Return the names of all the students in the school sorted by grade and name.
  """
  @spec roster(school) :: [String.t()]
  def roster(school) do
    school
    |> Map.keys()
    |> Enum.sort()
    |> Enum.map(& grade(school, &1))
    |> List.flatten()
  end
end
