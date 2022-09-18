import time

def get_words_dict(arr):
    d = dict()
    for i in arr:
        if i not in d:
            d[i] = 1
        else:
            d[i] += 1

    return d

def checkMagazine(magazine, note):
    mag_list = magazine.split(" ")
    note_list = note.split(" ")
    mag_dict = get_words_dict(mag_list)
    note_dict = get_words_dict(note_list)
    for i in note_dict:
        if i not in mag_dict:
            print("No")
            return
        else:
            if note_dict[i] > mag_dict[i]:
                print("No")
                return
    print("Yes")


# def checkMagazine(magazine, note):
#     mag_list = magazine.split(" ")
#     note_list = note.split(" ")
#     for i in note_list:
#         if i in mag_list:
#             mag_list.remove(i)
#         else:
#             print("No")
#             return
#     print("Yes")


if __name__ == "__main__":
    start_time = time.perf_counter_ns()
    checkMagazine("give me one grand today night", "give one grand today")
    checkMagazine("two times three is not four", "two times two is four")
    checkMagazine("ive got a lovely bunch of coconuts", "ive got some coconuts")
    checkMagazine("apgo clm w lxkvg mwz elo bg elo lxkvg elo apgo apgo w elo bg", "elo lxkvg bg mwz clm w")
    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))
