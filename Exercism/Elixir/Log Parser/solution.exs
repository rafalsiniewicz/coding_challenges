defmodule LogParser do
  def valid_line?(line) do
    line =~ ~r/^\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\]/
    # String.match?(line, ~r/^\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\]/)
    # Regex.match?(~r/^\[DEBUG\]|\[INFO\]|\[WARNING\]|\[ERROR\]/, line)
  end

  def split_line(line) do
    Regex.split(~r/\<[\~\*\=\-]*\>/, line)
  end

  def remove_artifacts(line) do
    Regex.replace(~r/end-of-line\d+/i, line, "")
  end

  def tag_with_user_name(line) do
    regex = ~r/User\s+(?<name>[^\s]+)/
    case line =~ regex do
      true ->
        regex
        |> Regex.run(line, capture: ["name"])
        |> List.first()
        |> then(fn name -> "[USER] #{name} " <> line end)
      false ->
        line
    end
  end
end

# 1
true = LogParser.valid_line?("[ERROR] Network Failure")
false = LogParser.valid_line?("Network Failure")

# 2
["[INFO] Start.", "[INFO] Processing...", "[INFO] Success."] = LogParser.split_line("[INFO] Start.<*>[INFO] Processing...<~~~>[INFO] Success.")

# 3
"[WARNING]  Network Failure " = LogParser.remove_artifacts("[WARNING] end-of-line23033 Network Failure end-of-line27")

# 4
"[USER] Alice [INFO] User Alice created a new project" = LogParser.tag_with_user_name("[INFO] User Alice created a new project")
