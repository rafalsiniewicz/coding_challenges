defmodule LanguageList do
  def new() do
    []
  end

  def add(list, language) do
    [language | list]
  end

  def remove([_ | t]) do
    t
  end

  def first([h | _]) do
    h
  end

  def count(list) do
    length(list)
  end

  def functional_list?(list) do
    "Elixir" in list
  end
end


IO.puts(LanguageList.new())

language_list = LanguageList.new()
language_list = LanguageList.add(language_list, "Clojure")
IO.puts(language_list)
language_list = LanguageList.add(language_list, "Haskell")
IO.puts(language_list)

language_list = LanguageList.new()
language_list = LanguageList.add(language_list, "Clojure")
IO.puts(language_list)
language_list = LanguageList.add(language_list, "Haskell")
IO.puts(language_list)
language_list = LanguageList.remove(language_list)
IO.puts(language_list)


language_list = LanguageList.new()
language_list = LanguageList.add(language_list, "Elm")
language_list = LanguageList.add(language_list, "Prolog")
IO.puts(LanguageList.first(language_list))


language_list = LanguageList.new()
language_list = LanguageList.add(language_list, "Elm")
language_list = LanguageList.add(language_list, "Prolog")
IO.puts(LanguageList.count(language_list))

language_list = LanguageList.new()
language_list = LanguageList.add(language_list, "Elixir")
IO.puts(LanguageList.functional_list?(language_list))
