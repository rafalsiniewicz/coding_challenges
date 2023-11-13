defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    data = IO.gets("What is your character's name?\n")
    String.trim(data)
  end

  def ask_class() do
    data = IO.gets("What is your character's class?\n")
    String.trim(data)
  end

  def ask_level() do
    data = IO.gets("What is your character's level?\n")
    String.trim(data)
    |> String.to_integer()
  end

  def run() do
    welcome()
    name = ask_name()
    class = ask_class()
    level = ask_level()
    character = %{name: name, class: class, level: level}
    character
    |> IO.inspect(label: "Your character")
  end
end

:ok = RPG.CharacterSheet.welcome()
"Mathilde" = RPG.CharacterSheet.ask_name()
"healer" = RPG.CharacterSheet.ask_name()
2 = RPG.CharacterSheet.ask_level()
%{class: "healer", level: 2, name: "Mathilde"} = RPG.CharacterSheet.run()
