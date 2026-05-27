defmodule Tournament do
  @doc """
  Given `input` lines representing two teams and whether the first of them won,
  lost, or reached a draw, separated by semicolons, calculate the statistics
  for each team's number of games played, won, drawn, lost, and total points
  for the season, and return a nicely-formatted string table.

  A win earns a team 3 points, a draw earns 1 point, and a loss earns nothing.

  Order the outcome by most total points for the season, and settle ties by
  listing the teams in alphabetical order.
  """
  @spec tally(input :: list(String.t())) :: String.t()
  def tally(input) do
    input
    |> Enum.filter(fn line ->
      result = String.split(line, ";")
      length(result) == 3 and Enum.at(result, 2) in ["win", "draw", "loss"]
    end)
    |> Enum.reduce(%{}, fn line, acc ->
      [team_1, team_2, result] = String.split(line, ";")
      case result do
        "win" -> update_points(acc, team_1, 3) |> update_points(team_2, 0)
        "draw" -> update_points(acc, team_1, 1) |> update_points(team_2, 1)
        "loss" -> update_points(acc, team_1, 0) |> update_points(team_2, 3)
      end
    end)
    |> Enum.sort(fn {_k1, v1}, {_k2, v2} -> elem(v1, 4) >= elem(v2, 4) end)
    |> Enum.reduce("#{pad_trailing("Team", 31)}| MP |  W |  D |  L |  P", fn {k, v}, acc ->
      "#{acc}\n#{pad_trailing(k, 31)}|#{pad(elem(v, 0), 4)}|#{pad(elem(v, 1), 4)}|#{pad(elem(v, 2), 4)}|#{pad(elem(v, 3), 4)}|#{pad_leading(elem(v, 4), 3)}"
    end)
  end

  defp pad_trailing(word, n), do: String.pad_trailing("#{word}", n, " ")
  defp pad_leading(word, n), do: String.pad_leading("#{word}", n, " ")

  defp pad(word, n) do
    len = String.length("#{word}")
    num_trail = :math.floor((n - len) / 2) |> round()
    num_lead = :math.ceil((n - len) / 2) |> round()
    "#{String.duplicate(" ", num_lead)}#{word}#{String.duplicate(" ", num_trail)}"
  end

  defp update_points(acc, team, points) do
    {win, draw, loss} = case points do
      3 -> {1, 0, 0}
      1 -> {0, 1, 0}
      0 -> {0, 0, 1}
    end
    Map.update(acc, team, {1, win, draw, loss, points}, fn {mp, w, d, l, p} -> {mp + 1, w + win, d + draw, l + loss, p + points} end)
  end
end

Tournament.tally([]) |> IO.puts()
Tournament.tally(["Allegoric Alaskans;Blithering Badgers;win"]) |> IO.puts()
Tournament.tally(["Blithering Badgers;Allegoric Alaskans;loss"]) |> IO.puts()
Tournament.tally(["Blithering Badgers;Allegoric Alaskans;win"]) |> IO.puts()
Tournament.tally(["Allegoric Alaskans;Blithering Badgers;win",
      "Allegoric Alaskans;Blithering Badgers;win"]) |> IO.puts()
