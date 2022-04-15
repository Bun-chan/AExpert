import UIKit

//2022-04-08
func isValidSubsequence(_ array: [Int], _ sequence: [Int]) -> Bool {
    // firstly, try 2 loops. this is the expensive way.
    if sequence.count > array.count { // this is an edge case. the sequence can not be longer than the array.
        return false
    }
    var tempArray = array
    for index in 0..<sequence.count {
        print(sequence[index], tempArray.first!, index)
        if tempArray.first == sequence[index] {
            print("match found: ", sequence[index], tempArray.first!, tempArray.count, index)
            if index == sequence.count - 1 {
                print("1 true")
                return true
            }
            if tempArray.count != 1 {
                print("0 removing: ", tempArray.first!, index)
                tempArray.removeFirst()
            } else {
                print("0 tempArray.count: ", tempArray.count)
            }
        } else {
            print("not matched: ", sequence[index], tempArray.first!, tempArray.count, index)
            while sequence[index] != tempArray.first {
                if tempArray.count != 1 {
                    print("1 removing: ", tempArray.first!)
                    tempArray.removeFirst()
                } else if tempArray.count == 1 {
                    if sequence[index] != tempArray.first {
                        print("2 false")
                        return false
                    }
                    break
                }
            }
            
            print("2 match found: ", sequence[index], tempArray.first!, tempArray.count, index)
            if index == sequence.count - 1 {
                print("0 true: ", index, sequence[index])
                return true
            }
            if tempArray.count != 1 {
                print("2 removing: ", tempArray.first!)
                tempArray.removeFirst()
            } else if tempArray.count == 1 && index == sequence.count - 1 {
                print("1 tempArray.count: ", tempArray.count, index)
                return true
            }
        }
    }
    return false
}
//print("1")
var array = [5, 1, 22, 25, 6, -1, 8, 10]
var sequence = [1, 6, -1, 10]
//print(isValidSubsequence(array, sequence))
//
//print("\n2")
//array = [5, 1, 22, 25, 6, -1, 8, 10]
//sequence = [22, 25, 6]
//print(isValidSubsequence(array, sequence))
//
//print("\n3")
//array = [5, 1, 22, 25, 6, -1, 8, 10]
//sequence = [1, 6, -1, -1]
//print(isValidSubsequence(array, sequence))

//print("\n10")
//array = [5, 1, 22, 25, 6, -1, 8, 10]
//sequence = [5, 1, 22, 25, 6, -1, 8, 10, 12]
//print(isValidSubsequence(array, sequence))

//print("\n21")
//array = [1, 1, 6, 1]
//sequence = [1, 1, 1, 6]
//print(isValidSubsequence(array, sequence))

print("\n23")
array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [5, 1, 22, 25, 6, -1, 8, 10, 10]
print(isValidSubsequence(array, sequence))


print("\nsolutions from Algo Expert")

func isValidSubsequence2(_ array: [Int], _ sequence: [Int]) -> Bool {
    var arrayIndex = 0
    var sequenceIndex = 0
    while arrayIndex < array.count, sequenceIndex < sequence.count {
        if array[arrayIndex] == sequence[sequenceIndex] {
            sequenceIndex += 1
        }
        arrayIndex += 1
    }
    return sequenceIndex == sequence.count
}
array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [5, 1, 22, 25, 6, -1, 8, 10, 10]
print(isValidSubsequence2(array, sequence))

/*
 NOTES:
 my method involves removing elements from the array. this is not needed. just match them and increment the index. if the index gets to the final element of the sequence, then it is successful
 */
print("\nMore solutions from Algo Expert")
func isValidSubsequence3(_ array: [Int], _ sequence: [Int]) -> Bool {
    var sequenceIndex = 0
    for index in 0..<array.count - 1 {
        if (sequenceIndex == sequence.count), (sequence.count > array.count) {
            break
        }
        if array[index] == sequence[index] {
            sequenceIndex += 1
        }
    }
    return sequenceIndex == sequence.count
}
array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [5, 1, 22, 25, 6, -1, 8, 10, 10]
print(isValidSubsequence3(array, sequence))


print("\nMore from BUN")
func isValidSubsequence4(_ array: [Int], _ sequence: [Int]) -> Bool {
    if sequence.count > array.count {
        return false
    }
    var sequenceCounter = 0
    
    for a in array {
        if sequenceCounter == sequence.count {
            break
        }
        if sequence[sequenceCounter] == a {
            print("matched. Increment sequenceCounter")
            sequenceCounter += 1
        }
    }
    
    return sequenceCounter == sequence.count
}
array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [5, 1, 22, 25, 6, -1, 8, 10, 10]
print(isValidSubsequence4(array, sequence))


array = [5, 1, 22, 25, 6, -1, 8, 10]
sequence = [22, 25, 6]
print(isValidSubsequence4(array, sequence))





















