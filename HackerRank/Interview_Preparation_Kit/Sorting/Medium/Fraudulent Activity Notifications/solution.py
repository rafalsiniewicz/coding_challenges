import time


# def activityNotifications(expenditure, d):
#     exp_d = []
#     result = 0
#     sorted_flag = False
#     for i in range(len(expenditure) - 1):
#         if i < d:
#             exp_d.append(expenditure[i])
#             # print(exp_d)
#         else:
#             if sorted_flag is False:
#                 exp_d = sorted(exp_d)
#                 sorted_flag = True
#             if sorted_flag is True and exp_d[len(exp_d) - 2] > exp_d[-1]:
#                 exp_d = sorted(exp_d)
#             if len(exp_d) % 2 != 0:
#                 median = exp_d[len(exp_d) // 2]
#             else:
#                 median = (exp_d[len(exp_d) // 2] + exp_d[(len(exp_d) // 2) - 1]) / 2
#             if expenditure[i] >= 2 * median:
#                 result += 1
#             exp_d.remove(expenditure[i - d])
#             exp_d.append(expenditure[i])
#             # print(exp_d)
#
#     return result



def get_median(exp_dict, d):
    cnt = 0
    for i in exp_dict:
        cnt += exp_dict[i]
        if d % 2 == 1:
            if cnt >= d // 2 + 1:
                return i
        else:
            if cnt == d // 2:
                for j in range(i+1, len(exp_dict)):
                    if exp_dict[j] > 0:
                        return (i + j) / 2
            elif cnt > d // 2:
                return i


def activityNotifications(expenditure, d):
    result = 0
    exp_dict = {i: 0 for i in range(max(expenditure) + 1)}
    for i in range(d):
        exp_dict[expenditure[i]] += 1

    for i in range(d, len(expenditure)):
        if expenditure[i] >= 2 * get_median(exp_dict, d):
            result += 1
        exp_dict[expenditure[i-d]] -= 1
        exp_dict[expenditure[i]] += 1

    return result



if __name__ == "__main__":
    start_time = time.perf_counter_ns()
    # print(activityNotifications([80, 70, 60, 50, 40, 30, 20, 10], 3))
    # print(activityNotifications([1, 2, 3, 4, 5], 3))
    print(activityNotifications([10, 20, 30, 40, 50], 3))
    print(activityNotifications([2, 3, 4, 2, 3, 6, 8, 4, 5], 5))
    print(activityNotifications([1, 2, 3, 4, 4], 4))
    exp = [int(x) for x in open("a.txt", "r").read().split()]
    print(activityNotifications(exp, 10000))


    end_time = time.perf_counter_ns()
    print("{} s".format((end_time - start_time) / 10 ** 9))