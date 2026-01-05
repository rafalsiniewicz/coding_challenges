defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name = String.trim(name)
    String.at(name, 0)
  end

  def initial(name) do
    String.upcase(first_letter(name)) <> "."
  end

  def initials(full_name) do
    # full_name = String.split(full_name, " ")
    # initial(hd(full_name)) <> " " <> initial(hd(tl(full_name)))
    # OR
    # [head | tail] = String.split(full_name, " ")
    # [tail | _] = tail
    # initial(head) <> " " <> initial(tail)
    # OR
    full_name = String.split(full_name, " ")
    initial(List.first(full_name)) <> " " <> initial(List.last(full_name))

  end

  def pair(full_name1, full_name2) do
    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{initials(full_name1)}  +  #{initials(full_name2)}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end

IO.puts(HighSchoolSweetheart.first_letter("Jane"))
IO.puts(HighSchoolSweetheart.initial("Robert"))
IO.puts(HighSchoolSweetheart.initials("Lance Green"))
IO.puts(HighSchoolSweetheart.pair("Blake Miller", "Riley Lewis"))
