defmodule HighScore do

  @default_initial_score 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @default_initial_score) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, @default_initial_score)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, &(&1 + score))
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end

#1
%{} = HighScore.new()

#2
score_map = HighScore.new()
score_map = HighScore.add_player(score_map, "Dave Thomas")
%{"Dave Thomas" => 0} = score_map
IO.inspect(score_map)
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
%{"Dave Thomas" => 0, "José Valim"=> 486_373} = score_map
IO.inspect(score_map)

# 3
score_map = HighScore.new()
score_map = HighScore.add_player(score_map, "Dave Thomas")
score_map = HighScore.remove_player(score_map, "Dave Thomas")
IO.inspect(score_map)

#4
score_map = HighScore.new()
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
%{"José Valim"=> 486_373} = score_map
score_map = HighScore.reset_score(score_map, "José Valim")
%{"José Valim"=> 0} = score_map
IO.inspect(score_map)

#5
score_map = HighScore.new()
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
score_map = HighScore.update_score(score_map, "José Valim", 5)
%{"José Valim"=> 486_378} = score_map
IO.inspect(score_map)

#6
score_map = HighScore.new()
score_map = HighScore.add_player(score_map, "Dave Thomas", 2_374)
%{"Dave Thomas" => 2_374} = score_map
score_map = HighScore.add_player(score_map, "José Valim", 486_373)
%{"Dave Thomas" => 2_374, "José Valim"=> 486_373} = score_map
players = HighScore.get_players(score_map)
["Dave Thomas", "José Valim"] = players
IO.inspect(players)
