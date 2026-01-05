defmodule Chessboard do
  @rank_start 1
  @rank_end 8
  @file_start "A"
  @file_end "H"

  def rank_range do
    @rank_start..@rank_end
  end

  def file_range do
    # (@file_start |> String.to_charlist |> hd)..(@file_end |> String.to_charlist |> hd)
    ?A..?H
  end

  def ranks do
    Enum.to_list(rank_range())
  end

  def files do
    Enum.map(file_range(), fn x -> <<x>> end)
  end
end

# 1
1..8 = Chessboard.rank_range()

# 2
65..72 = Chessboard.file_range()

# 3
[1, 2, 3, 4, 5, 6, 7, 8] = Chessboard.ranks()

# 4
["A", "B", "C", "D", "E", "F", "G", "H"] = Chessboard.files()
