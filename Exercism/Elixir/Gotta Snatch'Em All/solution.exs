defmodule GottaSnatchEmAll do
  @type card :: String.t()
  @type collection :: MapSet.t(card())

  @spec new_collection(card()) :: collection()
  def new_collection(card) do
    MapSet.new([card])
  end

  @spec add_card(card(), collection()) :: {boolean(), collection()}
  def add_card(card, collection) do
    {MapSet.member?(collection, card), MapSet.put(collection, card)}
  end

  @spec trade_card(card(), card(), collection()) :: {boolean(), collection()}
  def trade_card(your_card, their_card, collection) do
    {
      MapSet.member?(collection, your_card) && not MapSet.member?(collection, their_card),
      collection |> MapSet.delete(your_card) |> MapSet.put(their_card)
    }
  end

  @spec remove_duplicates([card()]) :: [card()]
  def remove_duplicates(cards) do
    cards
    |> MapSet.new()
    |> MapSet.to_list()
    |> Enum.sort()
  end

  @spec extra_cards(collection(), collection()) :: non_neg_integer()
  def extra_cards(your_collection, their_collection) do
    your_collection
    |> MapSet.difference(their_collection)
    |> MapSet.size()
  end

  @spec boring_cards([collection()]) :: [card()]
  def boring_cards([]), do: []
  def boring_cards(collections) do
    Enum.reduce(collections, fn collection, acc ->
      MapSet.intersection(acc, collection)
    end)
    |> MapSet.to_list()
    |> Enum.sort()
  end

  @spec total_cards([collection()]) :: non_neg_integer()
  def total_cards([]), do: 0
  def total_cards(collections) do
     collections
     |> Enum.reduce(fn collection, acc ->
      MapSet.union(acc, collection)
    end)
    |> MapSet.size()
  end

  @spec split_shiny_cards(collection()) :: {[card()], [card()]}
  def split_shiny_cards(collection) do
    {shiny_cards, not_shiny_cards} = MapSet.split_with(collection, fn card -> String.starts_with?(card, "Shiny") end)
    {shiny_cards |> MapSet.to_list() |> Enum.sort(), not_shiny_cards |> MapSet.to_list() |> Enum.sort()}
  end
end


# 1
GottaSnatchEmAll.new_collection("Newthree") |> IO.inspect()

# 2
GottaSnatchEmAll.add_card("Scientuna", MapSet.new(["Newthree"])) |> IO.inspect()

# 3
GottaSnatchEmAll.trade_card("Scientuna", "Newthree", MapSet.new(["Scientuna"])) |> IO.inspect()

# 4
GottaSnatchEmAll.remove_duplicates(["Newthree", "Newthree", "Newthree", "Scientuna"]) |> IO.inspect()

# 5
GottaSnatchEmAll.extra_cards(MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"])) |> IO.inspect()

# 6
GottaSnatchEmAll.boring_cards([MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"])]) |> IO.inspect()
GottaSnatchEmAll.boring_cards([]) == []

# 7
GottaSnatchEmAll.total_cards([MapSet.new(["Scientuna"]), MapSet.new(["Newthree", "Scientuna"])]) |> IO.inspect()

# 8
GottaSnatchEmAll.split_shiny_cards(MapSet.new(["Newthree", "Scientuna", "Shiny Scientuna"])) |> IO.inspect()
