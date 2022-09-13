


def jumpingOnClouds(c):
    nr_jumps = 0
    i = 0
    while i < len(c) - 2:
        # print("beofre = ", i)
        if c[i + 2] == 0:
            i += 2
        else:
            i += 1
        nr_jumps += 1
        # print("after = ", i)
    if i == len(c) - 2:
        nr_jumps += 1
    return nr_jumps

if __name__ == "__main__":
    print(jumpingOnClouds([0, 0, 1, 0, 0, 1, 0]))
    print(jumpingOnClouds([0, 0, 0, 0, 1, 0]))
    print(jumpingOnClouds([0, 0, 0, 1, 0, 0]))