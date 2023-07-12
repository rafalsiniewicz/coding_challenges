from functools import cmp_to_key


class Player:
    def __init__(self, name, score):
        self.name = name
        self.score = score

    def __repr__(self):
        pass

    @staticmethod
    def comparator(a, b):
        if a.score != b.score:
            if a.score < b.score:
                return 1
            else:
                return -1
        else:
            if a.name == b.name:
                return 0
            elif a.name < b.name:
                return -1
            else:
                return 1


if __name__ == "__main__":
    n = 3
    data = [Player("Smith", 20), Player("Jones", 15), Player("Jones", 20)]
    data = sorted(data, key=cmp_to_key(Player.comparator))
    for i in data:
        print(i.name, i.score)

    # n = 5
    # data = [Player("amy", 100), Player("david", 100), Player("heraldo", 50), Player("aakansha", 75), Player("aleksa", 150)]
    # data = sorted(data, key=cmp_to_key(Player.comparator), reverse=True)
    # for i in data:
    #     print(i.name, i.score)
