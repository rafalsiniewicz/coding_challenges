def countSwaps(a):
    num_swaps = 0
    for i in range(len(a)):
        for j in range(len(a) - 1):
            if a[j] > a[j + 1]:
                num_swaps += 1
                temp = a[j]
                a[j] = a[j + 1]
                a[j + 1] = temp

    print(f"Array is sorted in {num_swaps} swaps.")
    print(f"First Element: {a[0]}")
    print(f"Last Element: {a[-1]}")


if __name__ == "__main__":
    countSwaps([6, 4, 1])
    countSwaps([3, 2, 1])
