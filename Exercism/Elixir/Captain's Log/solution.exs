defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    # "NCC-#{999 + :rand.uniform(8999)}"
    "NCC-#{Enum.random(1000..9999)}"
  end

  def random_stardate() do
    41000.0 + 1000.0 * :rand.uniform()
  end

  def format_stardate(stardate) do
    # :io_lib.format("~.1f", [stardate]) |> IO.iodata_to_binary
    :io_lib.format("~.1f", [stardate]) |> to_string()
  end
end

# 1
IO.inspect(CaptainsLog.random_planet_class())
true = Enum.member?(["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"], CaptainsLog.random_planet_class())

# 2
IO.inspect(CaptainsLog.random_ship_registry_number())
number = CaptainsLog.random_ship_registry_number()
|> String.split("-")
|> Enum.at(1)
|> String.to_integer()
true = number in 1000..9999

# 3
number = CaptainsLog.random_stardate()
IO.inspect(number)
true = number >= 41000.0 and number < 42000.0

# 4
"41458.2" = CaptainsLog.format_stardate(41458.15721310934)
