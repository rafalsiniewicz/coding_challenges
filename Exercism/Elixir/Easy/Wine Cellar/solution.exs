defmodule WineCellar do
  def explain_colors do
    [
      white: "Fermented without skin contact.",
      red: "Fermented with skin contact using dark-colored grapes.",
      rose: "Fermented with some skin contact, but not enough to qualify as a red wine."
    ]
  end

  def filter(cellar, color, opts \\ []) do
    cond do
      Keyword.has_key?(opts, :year) and Keyword.has_key?(opts, :country) ->
        Keyword.get_values(cellar, color)
        |> filter_by_year(Keyword.get(opts, :year))
        |> filter_by_country(Keyword.get(opts, :country))
      Keyword.has_key?(opts, :year) ->
        Keyword.get_values(cellar, color)
        |> filter_by_year(Keyword.get(opts, :year))
      Keyword.has_key?(opts, :country) ->
        Keyword.get_values(cellar, color)
        |> filter_by_country(Keyword.get(opts, :country))
      true -> Keyword.get_values(cellar, color)
    end
  end

  # The functions below do not need to be modified.

  defp filter_by_year(wines, year)
  defp filter_by_year([], _year), do: []

  defp filter_by_year([{_, year, _} = wine | tail], year) do
    [wine | filter_by_year(tail, year)]
  end

  defp filter_by_year([{_, _, _} | tail], year) do
    filter_by_year(tail, year)
  end

  defp filter_by_country(wines, country)
  defp filter_by_country([], _country), do: []

  defp filter_by_country([{_, _, country} = wine | tail], country) do
    [wine | filter_by_country(tail, country)]
  end

  defp filter_by_country([{_, _, _} | tail], country) do
    filter_by_country(tail, country)
  end
end

# 1
[
  {"Chardonnay", 2015, "Italy"},
  {"Pinot grigio", 2017, "Germany"}
] = WineCellar.filter(
  [
    white: {"Chardonnay", 2015, "Italy"},
    white: {"Pinot grigio", 2017, "Germany"},
    red: {"Pinot noir", 2016, "France"},
    rose: {"Dornfelder", 2018, "Germany"}
  ],
  :white
)

# 2
[
  {"Chardonnay", 2015, "Italy"}
] = WineCellar.filter(
  [
    white: {"Chardonnay", 2015, "Italy"},
    white: {"Pinot grigio", 2017, "Germany"},
    red: {"Pinot noir", 2016, "France"},
    rose: {"Dornfelder", 2018, "Germany"}
  ],
  :white,
  year: 2015
)

# 3
[] = WineCellar.filter(
  [
    white: {"Chardonnay", 2015, "Italy"},
    white: {"Pinot grigio", 2017, "Germany"},
    red: {"Pinot noir", 2016, "France"},
    rose: {"Dornfelder", 2018, "Germany"}
  ],
  :white,
  year: 2015,
  country: "Germany"
)
