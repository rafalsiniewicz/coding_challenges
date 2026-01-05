# Conclussions
1. Anagram is a word created from other word by rearranging letter, e.g. `"owns"` is an anagram of `"snow"`
2. Regex is not good for checking letters permutations of given word, i.e. it will require you to write all permutations explicitely, like `abc|acb|bac|bca|cab|cba`. Instead you should rather use `Enum` or `String` functions
3. To check for anagrams and not fall into `O(n^2)` complexity (nested loop) you need to firstly handle/modify the input list of words. You can just sort it (which has lower than `O(n^2)` complexity) firstly and then just iterate over it comparing with target word (which also needs to be sorted)
4. You can also check for anagrams by creating a map of letters frequency for given word, elixir has dedicated function for it: `Enum.frequency/2`
5. Its good to perceive problem solution in terms of having a "check-function", i mean if you have a task to look for anagrams its neat and clean in code if you'll have e.g. `is_anagram()` function. Then you can call/use it e.g. inside loop instead of handling anagram-related checks inside this loop.

# Links
1. 






