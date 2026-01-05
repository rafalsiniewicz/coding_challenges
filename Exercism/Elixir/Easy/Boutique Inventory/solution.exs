defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    # Enum.sort_by(inventory, fn x, y -> x.price < y.price end, Integer)
    Enum.sort_by(inventory, fn x-> x.price end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn x -> is_nil(x.price) end)
  end

  def update_names(inventory, old_word, new_word) do
    # Enum.map(inventory, fn x -> %{
    #   price: x.price,
    #   name: String.replace(x.name, old_word, new_word),
    #   quantity_by_size: x.quantity_by_size
    # }
    # end)
    Enum.map(
      inventory,
      fn x -> Map.put(x, :name, String.replace(x.name, old_word, new_word)) end
      )
  end

  def increase_quantity(item, count) do
    # %{
    #   price: item.price,
    #   name: item.name,
    #   quantity_by_size: Map.new(item.quantity_by_size, fn {k, v} -> {k, v + count} end)
    # }
    Map.put(
      item,
      :quantity_by_size,
      Map.new(item.quantity_by_size, fn {k, v} -> {k, v + count} end)
      )
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_k, v}, acc -> v + acc end)
  end
end


# 1
[
  %{price: 20, name: "Bamboo Socks Cats", quantity_by_size: %{}},
  %{price: 50, name: "Red Short Skirt", quantity_by_size: %{}},
  %{price: 50, name: "Black Short Skirt", quantity_by_size: %{}},
  %{price: 65, name: "Maxi Brown Dress", quantity_by_size: %{}}
] = BoutiqueInventory.sort_by_price([
  %{price: 65, name: "Maxi Brown Dress", quantity_by_size: %{}},
  %{price: 50, name: "Red Short Skirt", quantity_by_size: %{}},
  %{price: 50, name: "Black Short Skirt", quantity_by_size: %{}},
  %{price: 20, name: "Bamboo Socks Cats", quantity_by_size: %{}}
])

# 2
[
  %{price: nil, name: "Denim Pants", quantity_by_size: %{}},
  %{price: nil, name: "Denim Skirt", quantity_by_size: %{}}
] = BoutiqueInventory.with_missing_price([
  %{price: 40, name: "Black T-shirt", quantity_by_size: %{}},
  %{price: nil, name: "Denim Pants", quantity_by_size: %{}},
  %{price: nil, name: "Denim Skirt", quantity_by_size: %{}},
  %{price: 40, name: "Orange T-shirt", quantity_by_size: %{}}
])

# 3
[
  %{price: 40, name: "Black Tee", quantity_by_size: %{}},
  %{price: 70, name: "Denim Pants", quantity_by_size: %{}},
  %{price: 65, name: "Denim Skirt", quantity_by_size: %{}},
  %{price: 40, name: "Orange Tee", quantity_by_size: %{}}
] = BoutiqueInventory.update_names(
  [
    %{price: 40, name: "Black T-shirt", quantity_by_size: %{}},
    %{price: 70, name: "Denim Pants", quantity_by_size: %{}},
    %{price: 65, name: "Denim Skirt", quantity_by_size: %{}},
    %{price: 40, name: "Orange T-shirt", quantity_by_size: %{}}
  ],
  "T-shirt",
  "Tee"
)

# 4
%{
  name: "Polka Dot Skirt",
  price: 68,
  quantity_by_size: %{l: 9, m: 11, s: 9, xl: 10}
} = BoutiqueInventory.increase_quantity(
 %{
   name: "Polka Dot Skirt",
   price: 68,
   quantity_by_size: %{s: 3, m: 5, l: 3, xl: 4}
 },
 6
)

# 5
16 = BoutiqueInventory.total_quantity(%{
  name: "Red Shirt",
  price: 62,
  quantity_by_size: %{s: 3, m: 6, l: 5, xl: 2}
})
