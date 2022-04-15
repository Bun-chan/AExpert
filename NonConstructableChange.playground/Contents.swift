import UIKit
//2022-04-10

func nonConstructibleChange(_ coins: inout [Int]) -> Int {
    //     Write your code here.
    //    do not forget the edge cases.
    if coins.count == 0 {
        return 1
    }
    if coins.count == 1 && coins[0] != 1 {
        return 1
    }
    if coins.count == 1 && coins[0] == 1 {
        return 2
    }
    coins.sort()
    
    var change = coins[0]
    for index in 1..<coins.count {
        if coins[index] > change + 1 {
            return change + 1
        } else {
            change += coins[index]
        }
    }
    return change + 1
}

func nonConstructibleChange2(_ coins: inout [Int]) -> Int {
    coins.sort()
    var change = 0
    for coin in coins {
        if coin > change + 1 {
            return change + 1
        }
        change += coin
    }
    return change + 1
}


print("\ntake 1")
var coins = [1, 2, 4, 5]
print(nonConstructibleChange(&coins))
print(nonConstructibleChange2(&coins))

print("\ntake 6")
coins = [87]
print(nonConstructibleChange(&coins))
print(nonConstructibleChange2(&coins))

print("\ntake 11")
coins = [1]
print(nonConstructibleChange(&coins))
print(nonConstructibleChange2(&coins))
/*
 This Q is tough. i can't see the way to calculate this.
 if there are 50 coins, then how many combinations are there to calculate the amount of change?
 
 Try 0:
 take the first guess at a value i can't create. the lowest coin value + 1, as long as this isn't a coin value.
 minus the largest number less than that and work backwards.
 if this fails, minus the 2nd largest number less than that are repeat.
 I think this is my first recursion test.
 
 Try1:
 find the lowest value, then start at lowestValue + 1 and see if i can make it
 
 Try 2:
 as always, use a hash table.
 how would this help?
 
 Try 3:
 sort the array first. BUT this costs. O(nlogn)
 find the first missing number above the lowest number.
 from firstMissing number to highestNumber, check if the sum can be made.
 
 Try 4:
 they always use a left and right index. and then move inwards.
 can this help me? probably need to sort first.
 
 
 
 */
