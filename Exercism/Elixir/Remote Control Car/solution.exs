defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100,
    distance_driven_in_meters: 0,
  ]

  def new() do
    %RemoteControlCar{nickname: "none"}
  end

  def new(nickname) do
    %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car = %RemoteControlCar{}) do
    "#{remote_car.distance_driven_in_meters} meters"
  end

  def display_battery(_remote_car = %RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(remote_car = %RemoteControlCar{}) do
    "Battery at #{remote_car.battery_percentage}%"
  end

  def drive(remote_car = %RemoteControlCar{battery_percentage: 0}) do
    remote_car
  end

  def drive(remote_car = %RemoteControlCar{}) do
    %{
      remote_car | battery_percentage:
      remote_car.battery_percentage - 1,
      distance_driven_in_meters: remote_car.distance_driven_in_meters + 20
    }
  end
end

# 1
IO.inspect(RemoteControlCar.new())

# 2
IO.inspect(RemoteControlCar.new("Blue"))

# 3
car = RemoteControlCar.new()
"0 meters" = RemoteControlCar.display_distance(car)

# 4
car = RemoteControlCar.new()
"Battery at 100%" = RemoteControlCar.display_battery(car)

# 5
RemoteControlCar.new("Red")
|> RemoteControlCar.drive()
|> IO.inspect()

# 6
