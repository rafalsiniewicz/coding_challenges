defmodule TwoFer do
  @moduledoc """
  Module for dealing with for/fer pronounciation
  """

  @doc """
  Two-fer or 2-fer is short for two for one. One for you and one for me.
  """
  @spec two_fer(String.t()) :: String.t()
  def two_fer(name \\ "you") when is_bitstring(name) do
    "One for #{name}, one for me."
  end
end


"One for you, one for me." = TwoFer.two_fer()
"One for Bob, one for me." = TwoFer.two_fer("Bob")
TwoFer.two_fer(10) |> IO.inspect()
