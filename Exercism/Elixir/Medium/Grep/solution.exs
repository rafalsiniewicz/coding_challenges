defmodule Grep do

#   -n Prepend the line number and a colon (':') to each line in the output, placing the number after the filename (if present).
# -l Output only the names of the files that contain at least one matching line.
# -i Match using a case-insensitive comparison.
# -v Invert the program -- collect all lines that fail to match.
# -x Search only for lines where the search string matches the entire line.


  @spec grep(String.t(), [String.t()], [String.t()]) :: String.t()
  def grep(pattern, flags, files) do
    output_filenames = if length(files) > 1, do: true, else: false

    files
    |> Enum.map(&
      &1
      |> read_file()
      |> pattern_match(pattern, flags, output_filenames)
      |> Enum.join("")
    )
    |> Enum.join("")
  end

  defp read_file(file) do
    file
    |> File.read!()
    |> String.split("\n", trim: true)
    # |> IO.inspect()
    |> Enum.map(& &1 <> "\n")
    # |> IO.inspect()
    |> then(& {Enum.with_index(&1, 1), file})
  end

  defp pattern_match({lines, filename}, pattern, flags, output_filenames) do
    is_case_insensitive = case_insensitive?(flags)
    is_line_number = line_number?(flags)
    is_invert = invert?(flags)
    is_entire_line_match = entire_line_match?(flags)
    is_at_least_one_matching_line = at_least_one_matching_line?(flags)
    # |> IO.inspect()

    compare_fn = fn line, pattern ->
      if is_entire_line_match, do: String.replace(line, ["\n", "\r"], "") == pattern, else: String.contains?(line, pattern)
    end

    filtered_lines = Enum.filter(lines, fn {line, _index} ->
      {line, pattern} = if is_case_insensitive, do: {String.downcase(line), String.downcase(pattern)}, else: {line, pattern}
      if is_invert do
        not compare_fn.(line, pattern)
      else
        compare_fn.(line, pattern)
      end
    end
    )

    filename_str = if output_filenames, do: filename <> ":", else: ""
    line_map_fn = if is_line_number, do: fn {line, index} -> "#{filename_str}#{index}:#{line}" end, else: fn {line, _index} -> "#{filename_str}#{line}" end

    if is_at_least_one_matching_line do
      if length(filtered_lines) > 0 do
        [filename <> "\n"]
      else
        []
      end
    else
      Enum.map(filtered_lines, &line_map_fn.(&1))
    end
  end

  defp case_insensitive?(flags) do
    Enum.any?(flags, & &1 == "-i")
  end

  defp line_number?(flags) do
    Enum.any?(flags, & &1 == "-n")
  end

  defp invert?(flags) do
    Enum.any?(flags, & &1 == "-v")
  end

  defp entire_line_match?(flags) do
    Enum.any?(flags, & &1 == "-x")
  end

  defp at_least_one_matching_line?(flags) do
    Enum.any?(flags, & &1 == "-l")
  end
end

# Grep.grep("lorem", ["-n", "-i", "-v"], ["test.txt"]) |> IO.inspect()
# Grep.grep("Agamemnon", [], ["iliad.txt"]) |> IO.inspect()
# Grep.grep("Forbidden", ["-l"], ["paradise-lost.txt"]) |> IO.inspect()
# Grep.grep("With loss of Eden, till one greater Man", ["-x"], ["paradise-lost.txt"]) |> IO.inspect()
Grep.grep("Of", ["-v"], ["paradise-lost.txt"]) |> IO.inspect()
