import UIKit
print("\nSolution 1")
func twoNumberSum(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    // Write your code here.
    //try loop once, take the value and then see if the array holds a value needed to sum to the targetSum. don't use the same number twice.
    if array.count == 1 {
        return []
    }
    for number in array {
        if targetSum - number == number {
            continue
        }
        if array.contains(targetSum - number) {
            return [number, targetSum - number]
        }
    }
    return []
}
var input = [3, 5, -4, 8, 11, 1, -1, 6]
twoNumberSum(&input, 10)


// next solution
print("\nSolution 2")
func twoNumberSum2(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    var numbersHashMap = [Int: Bool]()
    for number in array {
        print("\n")
        let potentialMatch = targetSum - number
        print("N: \(number). P: \(potentialMatch)")
        if let exists = numbersHashMap[potentialMatch], exists {
            print("hey", exists) // when n = 5, there is no 5 in the hashMap, so it fails.
            return [potentialMatch, number]
        } else {
            numbersHashMap[number] = true
            print("?", number, numbersHashMap)
        }
        
    }
    return []
}
twoNumberSum2(&input, 10)


//  solution 3
print("\nSolution 3")
//input.sort() // lowest to highest
//print(input)

func twoNumberSum3(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    print("asdfasdffasddas")
    array.sort()
    var leftPointer = 0
    var rightPointer = array.count - 1
    while leftPointer < rightPointer {
        let leftMost = array[leftPointer]
        let rightMost = array[rightPointer]
        let currentSum = leftMost + rightMost
        if currentSum == targetSum {
            return [leftMost, rightMost]
        } else if currentSum > targetSum {
            rightPointer -= 1
            print("***")
        } else {
            print("+++")
            leftPointer += 1
        }
    }
    print("asdf")
    return []
}
twoNumberSum3(&input, 10)


/*
 NOTES:
 if 2 for loops are used, the time complexity is O^2.
 */
print("\nSolution 4")
func twoNumberSum4(_ array: inout [Int], _ targetSum: Int) -> [Int] {
    for i in 0..<input.count {
        for j in 0..<input.count {
            print(i, j)
            if targetSum == input[i] + input[j] && i != j {
                print(input[i], input[j])
                return [input[i], input[j]]
            }
        }
    }
    return []
}
var input2 = [3, 5, -4, 8, 11, 1, -1, 6]
twoNumberSum4(&input2, 10)
