import UIKit
//2022-04-09

//func sortedSquaredArray(_ array: [Int]) -> [Int] {
//    var result: [Int] = []
//    for value in array {
//        let valueSquared = value * value
//        if result.count == 0 {
//            result.append(valueSquared)
//        } else {
//            if valueSquared >= result.last! {
//                print("1 ", valueSquared)
//                result.insert(valueSquared, at: result.endIndex)
//            } else {
//                result.insert(valueSquared, at: 0)
//            }
//        }
//    }
//    return result
//}

func sortedSquaredArray2(_ array: [Int]) -> [Int] {
    var result: [Int] = []
    var leftIndex = 0
    var rightIndex = array.count - 1
    while leftIndex <= rightIndex {
        if abs(array[leftIndex]) > abs(array[rightIndex]) {
            result.insert(array[leftIndex] * array[leftIndex], at: 0)
            leftIndex += 1
        } else {
            result.insert(array[rightIndex] * array[rightIndex], at: 0)
            rightIndex -= 1
        }
    }
    
    return result
}

var array = [-5, -4, -3, -2, -1]
print(sortedSquaredArray2(array))

print("\n2 Next")
array = [-99, 88, 100]
print(sortedSquaredArray2(array))

print("\n3 Next")
array = [1, 2, 3, 5, 6, 8, 9]
print(sortedSquaredArray2(array))

print("\n4 Next")
array = [-10, -5, 0, 5, 10]
print(sortedSquaredArray2(array))


print("\n5 Next")
array = [-10, -5, 0, 5, 10]
print(sortedSquaredArray2(array))
