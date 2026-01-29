defmodule SpaceAge do
  @type planet ::
          :mercury
          | :venus
          | :earth
          | :mars
          | :jupiter
          | :saturn
          | :uranus
          | :neptune

  @planets_orbital_period %{
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  }

  @seconds_in_earths_year 31_557_600

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet', or an error if 'planet' is not a planet.
  """
  @spec age_on(planet, pos_integer) :: {:ok, float} | {:error, String.t()}
  def age_on(planet, seconds) do
    if planet not in Map.keys(@planets_orbital_period) do
      {:error, "not a planet"}
    else
      {:ok, Float.round(seconds / @seconds_in_earths_year / @planets_orbital_period[planet], 2)}
    end
  end
end


IO.inspect(SpaceAge.age_on(:earth, 1_000_000_000))
IO.inspect(SpaceAge.age_on(:earth, 2_134_835_688))
IO.inspect(SpaceAge.age_on(:mercury, 2_134_835_688))
