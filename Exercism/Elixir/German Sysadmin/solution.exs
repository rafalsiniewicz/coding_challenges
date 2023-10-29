defmodule Username do

  def sanitize([]) do
    []
  end

  @doc """
  Sanitize email addresses, by leaving only alphabet lowercase letters or "_" and replacing german letters
  """
  @spec sanitize(username :: list(integer())) :: charlist()
  def sanitize(username) do
    [head | tail] = username
    # if head > 96 and head < 123 do
    #   [head] ++ sanitize(tail)
    # else
    #   sanitize(tail)
    # end
    case head do
      head when head == ?_ or (head >= ?a and head <= ?z) -> [head | sanitize(tail)]
      ?ä -> ~c"ae" ++ sanitize(tail)
      ?ö -> ~c"oe" ++ sanitize(tail)
      ?ü -> ~c"ue" ++ sanitize(tail)
      ?ß -> ~c"ss" ++ sanitize(tail)
      _ -> sanitize(tail)

    end
  end
end

# 1
sanitize = Username.sanitize(~c"schmidt1985")
~c"schmidt" = sanitize
IO.inspect(sanitize)

# 2
sanitize = Username.sanitize(~c"mark_fischer$$$")
~c"mark_fischer" = sanitize
IO.inspect(sanitize)

# 3
sanitize = Username.sanitize(~c"cäcilie_weiß")
~c"caecilie_weiss" = sanitize
IO.inspect(sanitize)
