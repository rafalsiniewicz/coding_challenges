def word_order(words):
    words_dict = {}

    for w in words:
        if w not in words_dict:
            words_dict[w] = 1
        else:
            words_dict[w] += 1

    return len(words_dict.keys()), [str(o) for o in words_dict.values()]


if __name__ == '__main__':
    n = int(input())
    words = []

    for i in range(n):
        words.append(input())

    nr_distinct_words, word_occurences = word_order(words)
    print(nr_distinct_words)
    print(" ".join(word_occurences))
