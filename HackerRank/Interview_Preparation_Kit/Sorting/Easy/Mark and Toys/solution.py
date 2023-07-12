def maximumToys(prices, k):
    amount = 0
    min_price = 1000000001
    cnt = 0
    while amount < k:
        for i in prices:
            if i < min_price:
                min_price = i



        if amount + min_price > k:
            break
        prices.remove(min_price)
        cnt += 1
        amount += min_price
        min_price = 1000000001

    return cnt




if __name__ == "__main__":
    print(maximumToys([1,2,3,4], 7))
    print(maximumToys([1, 12, 5, 111, 200, 1000, 10], 50))
