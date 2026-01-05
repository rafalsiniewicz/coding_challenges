defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    options = options ++ [maximum_price: 100]
    for x <- tops,
        y <- bottoms,
        x[:base_color] == nil and y[:base_color] == nil or x[:base_color] != y[:base_color],
        (x[:price] != nil and y[:price] != nil and x[:price] + y[:price] <= options[:maximum_price] or x[:price] == nil and y[:price] == nil) do
      {x, y}
    end
  end
end

# 1
tops = [
  %{item_name: "Dress shirt"},
  %{item_name: "Casual shirt"}
]
bottoms = [
  %{item_name: "Jeans"},
  %{item_name: "Dress trousers"}
]
[
  {%{item_name: "Dress shirt"}, %{item_name: "Jeans"}},
  {%{item_name: "Dress shirt"}, %{item_name: "Dress trousers"}},
  {%{item_name: "Casual shirt"}, %{item_name: "Jeans"}},
  {%{item_name: "Casual shirt"}, %{item_name: "Dress trousers"}}
] = BoutiqueSuggestions.get_combinations(tops, bottoms)

# 2
tops = [
  %{item_name: "Dress shirt", base_color: "blue"},
  %{item_name: "Casual shirt", base_color: "black"}
]
bottoms = [
  %{item_name: "Jeans", base_color: "blue"},
  %{item_name: "Dress trousers", base_color: "black"}
]
[
  {%{item_name: "Dress shirt", base_color: "blue"},
  %{item_name: "Dress trousers", base_color: "black"}},
  {%{item_name: "Casual shirt", base_color: "black"},
  %{item_name: "Jeans", base_color: "blue"}}
] = BoutiqueSuggestions.get_combinations(tops, bottoms)

# 3
tops = [
  %{item_name: "Dress shirt", base_color: "blue", price: 35},
  %{item_name: "Casual shirt", base_color: "black", price: 20}
]
bottoms = [
  %{item_name: "Jeans", base_color: "blue", price: 30},
  %{item_name: "Dress trousers", base_color: "black", price: 75}
]
[
  {%{item_name: "Casual shirt", base_color: "black", price: 20},
  %{item_name: "Jeans", base_color: "blue", price: 30}}
] = BoutiqueSuggestions.get_combinations(tops, bottoms, maximum_price: 50)


BoutiqueSuggestions.get_combinations(tops, bottoms, other_arg: 50)
