VOWELS = ["a", "e", "o", "u", "i"]


def minion_game(string):
    points = {"Stuart": 0, "Kevin": 0}
    string = string.lower()
    str_len = len(string)
    for i in range(len(string)):
        if string[i] in VOWELS:
            points["Kevin"] += str_len - i
        else:
            points["Stuart"] += str_len - i

    if points["Stuart"] == points["Kevin"]:
        print("Draw")
    else:
        max_points = max(points.values())
        keys = list(points.keys())
        values = list(points.values())
        print(keys[values.index(max_points)], max_points)

    
if __name__ == '__main__':
    minion_game("BANANA")
