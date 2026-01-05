defmodule TopSecret do
  def to_ast(string) do
    {:ok, ast} = Code.string_to_quoted(string)
    ast
  end

  def decode_secret_message_part({operator, _, args} = ast, acc) when operator in [:def, :defp] do
    {function_name, function_args} = get_function_name_and_args(args)
    function_name_sliced = String.slice(function_name, 0, length(function_args))
    {ast, [function_name_sliced | acc]}
  end

  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

  defp get_function_name_and_args(args) do
    case args do
      [{:when, _, function_args} | _] -> get_function_name_and_args(function_args)
      [{function_name, _, nil} | _] -> {function_name |> Atom.to_string(), []}
      [{function_name, _, function_args} | _] -> {function_name |> Atom.to_string(), function_args}

    end
  end

  def decode_secret_message(string) do
    to_ast(string)
    |> Macro.prewalk([], fn x, acc -> decode_secret_message_part(x, acc) end)
    |> elem(1)
    |> Enum.reverse()
    |> Enum.join()
  end

  # def decode_secret_message_part(ast, acc) do
  #   case is_tuple(ast) do
  #     true ->
  #       case elem(ast, 0) do
  #         operation when operation in [:defp, :def] ->

  #           args = case elem(ast, 2) |> Enum.at(0) |> elem(0) do
  #             :when -> elem(ast, 2) |> Enum.at(0) |> elem(2) |> Enum.at(0)
  #             _ -> elem(ast, 2) |> Enum.at(0)
  #           end

  #           {ast,
  #           [
  #             args
  #             |> elem(0)
  #             |> Atom.to_string()
  #             |> then(fn function_name ->
  #               case args |> elem(2) do
  #                 args_list when args_list in [nil, []] -> ""
  #                 args_list -> String.slice(function_name, 0..(length(args_list) - 1))
  #               end
  #             end)
  #             | acc
  #           ]}

  #         _ ->
  #           {ast, acc}
  #       end
  #     false -> {ast, acc}
  #   end
  # end

  # def decode_secret_message(string) do
  #   String.split(string, "\n")
  #   |> IO.inspect()
  #   |> Enum.reduce([], fn line, acc ->
  #     case {acc, String.contains?(line, ["def ", "defp "])} do
  #       {[], true} -> ["#{line}\n"]
  #       {_, true} -> ["#{line}\n" | acc]
  #       {[], false} -> acc
  #       _ ->
  #         IO.inspect(line, label: "line")
  #         IO.inspect(List.first(acc), label: "List.first(acc)")
  #         IO.inspect(String.match?(line,~r/\s+end/), label: "String.match?(line, ~r/\s+end/)")
  #         IO.inspect(String.match?(List.first(acc), ~r/\s+end/), label: "String.match?(List.first(acc), ~r/\s+end/)")
  #         case {String.match?(line, ~r/\s+end/) or line == "end", String.match?(List.first(acc), ~r/\s+end/)} do
  #           {true, true} -> acc
  #           {false, true} -> List.replace_at(acc, 0, "#{List.first(acc)}\n#{line}\n")
  #           {_, false} ->
  #             case String.contains?(List.first(acc), "do: ") do
  #               true -> acc
  #               false -> List.replace_at(acc, 0, "#{List.first(acc)}\n#{line}\n")
  #             end
  #         end

  #     end
  #   end)
  #   |> IO.inspect()
  #   |> Enum.reduce([], fn x, acc ->
  #     to_ast(x)
  #     |> decode_secret_message_part(acc)
  #     |> elem(1)
  #    end)
  #   |> IO.inspect()
  #   |> Enum.join()
  # end
end

# 1
ast = TopSecret.to_ast("div(4, 3)")
{:div, [line: 1], [4, 3]} = TopSecret.to_ast("div(4, 3)")

# 2
# ast_node = TopSecret.to_ast("defp cat(a, b, c), do: nil")
# {^ast_node, ["cat", "day"]} = TopSecret.decode_secret_message_part(ast_node, ["day"])

# ast_node = TopSecret.to_ast("10 + 3")
# {^ast_node, ["day"]} = TopSecret.decode_secret_message_part(ast_node, ["day"])

# 3
# ast_node = TopSecret.to_ast("defp cat(a, b), do: nil")
# {^ast_node, ["ca", "day"]} = TopSecret.decode_secret_message_part(ast_node, ["day"])

# ast_node = TopSecret.to_ast("defp cat(), do: nil")
# {^ast_node, ["", "day"]} = TopSecret.decode_secret_message_part(ast_node, ["day"])

# 4
# ast_node = TopSecret.to_ast("defp cat(a, b) when is_nil(a), do: nil")
# IO.inspect(ast_node)
# {^ast_node, ["ca", "day"]} = TopSecret.decode_secret_message_part(ast_node, ["day"])

# 5
code = """
defmodule MyCalendar do
  def busy?(date, time) do
    Date.day_of_week(date) != 7 and
      time.hour in 10..16
  end

  def yesterday?(date) do
    Date.diff(Date.utc_today, date)
  end
end
"""

"buy" = TopSecret.decode_secret_message(code)



# acc = ["abc"]
# {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(12, acc)
# 12 = actual_ast
# ^acc = actual_acc
# {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(true, acc)
# true = actual_ast
# ^acc = actual_acc
# {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(:ok, acc)
# :ok = actual_ast
# ^acc = actual_acc
# {actual_ast, actual_acc} = TopSecret.decode_secret_message_part("meh", acc)
# "meh" = actual_ast
# ^acc = actual_acc

# string = "def adjust, do: :scale"
# ast = TopSecret.to_ast(string)
# |> IO.inspect()
# acc = ["re"]
# {actual_ast, actual_acc} = TopSecret.decode_secret_message_part(ast, acc)
# ^ast = actual_ast
# ["", "re"] = actual_acc

# code =
#   "defmodule Notebook do\n  def note(notebook, text) do\n    add_to_notebook(notebook, text, append: true)\n  end\nend\n"

# secret_message = "no"
# ^secret_message = TopSecret.decode_secret_message(code)

# code =
#   "  defmodule TotallyNotTopSecret do\n    def force(mass, acceleration), do: mass * acceleration\n    def uniform(from, to), do: rand.uniform(to - from) + from\n    def data(%{metadata: metadata}, _opts), do: model(metadata)\n    defp model(metadata, _opts), do: metadata |> less_data |> Enum.reverse() |> Enum.take(3)\n    defp less_data(data, _opts), do: Enum.reject(data, &is_nil/1)\n  end\n"

# secret_message = "foundamole"
# ^secret_message = TopSecret.decode_secret_message(code)
