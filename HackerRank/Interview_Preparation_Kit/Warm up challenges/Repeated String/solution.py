
def repeatedString(s, n):
    nr_a_in_s = 0
    for i in s:
        if i == 'a':
            nr_a_in_s += 1
    nr_a = (n // len(s)) * nr_a_in_s
    for i in range(n % len(s)):
        if s[i] == 'a':
            nr_a += 1

    return nr_a


if __name__ == "__main__":
    print(repeatedString("aba", 10))
    print(repeatedString("a", 1000000000000))