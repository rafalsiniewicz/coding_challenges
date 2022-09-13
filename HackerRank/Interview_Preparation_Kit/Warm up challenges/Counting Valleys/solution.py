PATH = {"D": -1, "U": 1}


def countingValleys(steps, path):
    level = 0
    nr_valleys = 0
    for i in range(steps):
        level += PATH[path[i]]
        if PATH[path[i]] > 0 and level == 0:
            nr_valleys += 1

    return nr_valleys


if __name__ == "__main__":
    print(countingValleys(8, "UDDDUDUU"))
