def piggyBank():
    count = 0
    history = []
    def moneyCounter(amount):
        nonlocal count # for inmtable variables
        count += amount 
        history.append(amount)
        return (count, history)
    return moneyCounter

myPiggyBank = piggyBank()

print("total : ", myPiggyBank(10))
print("total : ", myPiggyBank(2))
print("total : ", myPiggyBank(5))
# Tue Aug 18 07:03:21 -05 2020
