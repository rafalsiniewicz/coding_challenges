# Conclussions
1. Armstrong number is a number that is equal to the sum of its digits raised to the power of number of digits, e.g.:

`9 is an Armstrong number, because 9 = 9^1 = 9`

and generally every one-digit number is Armstrong number

`10 is not an Armstrong number, because 10 != 1^2 + 0^2 = 1`

`153 is an Armstrong number, because: 153 = 1^3 + 5^3 + 3^3 = 1 + 125 + 27 = 153`

2. To get a list of letters/chars/strings of the given string/binary use `String.codepoints/1`, e.g.:
```elixir
String.codepoints("olá")
["o", "l", "á"]

String.codepoints("оптими зации")
["о", "п", "т", "и", "м", "и", " ", "з", "а", "ц", "и", "и"]

String.codepoints("ἅἪῼ")
["ἅ", "Ἢ", "ῼ"]

String.codepoints("\u00e9")
["é"]

String.codepoints("\u0065\u0301")
["e", "́"]
```

3. You can use `**/2` operator/syntax for raising number to power in newer versions of elixir (>= 1.13). You can also use math module or integer module to explicitely call power function
4. You can use `Enum.reduce/3` for calculating aggregated value of enumerable values


# Links
1. https://exercism.org/tracks/elixir/exercises/armstrong-numbers
2. https://hexdocs.pm/elixir/1.12/String.html#codepoints/1
3. https://stackoverflow.com/questions/32024156/how-do-i-raise-a-number-to-a-power-in-elixir





