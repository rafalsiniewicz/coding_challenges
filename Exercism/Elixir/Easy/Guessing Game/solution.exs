defmodule GuessingGame do
  def compare(secret_number, guess\\:no_guess)
  def compare(_secret_number, guess) when guess == :no_guess do
    "Make a guess"
  end
  def compare(secret_number, guess) when secret_number == guess do
    "Correct"
  end
  def compare(secret_number, guess) when abs(secret_number - guess) == 1 do
    "So close"
  end
  def compare(secret_number, guess) when secret_number < guess do
    "Too high"
  end
  def compare(secret_number, guess) when secret_number > guess do
    "Too low"
  end
end


IO.puts(GuessingGame.compare(5, 5))
IO.puts(GuessingGame.compare(5, 8))
IO.puts(GuessingGame.compare(5, 2))
IO.puts(GuessingGame.compare(5, 6))
IO.puts(GuessingGame.compare(5, 4))
IO.puts(GuessingGame.compare(5))
IO.puts(GuessingGame.compare(5, :no_guess))
