defmodule BasketballWebsite do

  def extract_from_path(data, path) do
    do_extract_from_path(data, String.split(path, "."))
  end

  defp do_extract_from_path(data, []) do
    data
  end

  defp do_extract_from_path(data, [head | tail]) do
    do_extract_from_path(data[head], tail)
  end

  def get_in_path(data, path) do
    Kernel.get_in(data, String.split(path, "."))
  end
end

# 1
data = %{
  "team_mascot" => %{
    "animal" => "bear",
    "actor" => %{
      "first_name" => "Noel"
    }
  }
}
"bear" = BasketballWebsite.extract_from_path(data, "team_mascot.animal")
nil = BasketballWebsite.extract_from_path(data, "team_mascot.colors")

# 2
"Noel" = BasketballWebsite.get_in_path(data, "team_mascot.actor.first_name")
