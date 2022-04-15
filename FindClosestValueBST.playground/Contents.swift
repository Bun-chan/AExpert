import UIKit
/* hmmm, what is the condition that ends this?
 if left == nil && if right == nil??
 
 i need to check every value in the BST. not just some of them.
 */

/*
 what do i need to be on the lookout for?
 what if the first tree is nil?
 what if the first tree has no left or right nodes?
 what if both nodes are the same value?
 negative values
 once the difference from the current node's value to the target increase, i can break. as traversing more will just increase the difference.
 
 */


class BST {
    var value: Int
    var left: BST?
    var right: BST?
    
    init(value: Int) {
        self.value = value
        left = nil
        right = nil
    }
}

func findClosestValueInBST(tree: BST?, target: Int) -> Int {
    if tree == nil {
        return -1
    }
    print("tree", tree!.value)
    var closest = tree!.value
    findClosest(tree, target: target, closest: &closest)
    
    
    return closest
}

func findClosest(_ tree: BST?, target: Int, closest: inout Int) {
    print("start: ", tree?.value, closest)
    if tree != nil {
        if tree!.value == target {
            closest = tree!.value
            return
        }
        if abs(closest - target) > abs(tree!.value - target) {
            closest = tree!.value
        }
        if tree!.value > closest {
            //go through the left nodes
            print("going left")
            findClosest(tree!.left, target: target, closest: &closest)
        } else {
            //go through the right nodes
            findClosest(tree!.right, target: target, closest: &closest)
        }
    }
}




//This goes through each node in the tree. I should only go through nodes whose value is closer.
//func findClosest(_ tree: BST?, target: Int, closest: inout Int) {
//    print("start: ", tree?.value, closest)
//    if tree != nil {
//        if abs(closest - target) > abs(tree!.value - target) {
//            closest = tree!.value
//            print("set :", closest)
//        }
//        if tree!.left != nil {
//            findClosest(tree!.left, target: target, closest: &closest)
//        }
//        if tree!.right != nil {
//            findClosest(tree!.right, target: target, closest: &closest)
//        }
//    }
//}



let bst10 = BST(value: 10)
let bst15 = BST(value: 15)
let bst5 = BST(value: 5)
let bst22 = BST(value: 22)
let bst13 = BST(value: 13)
let bst14 = BST(value: 14)
let bst2 = BST(value: 2)
let bst5_2 = BST(value: 5 - 2)
let bst1 = BST(value: 1)
bst10.left = bst5
bst10.right = bst15
bst15.left = bst13
bst15.right = bst22
bst22.left = nil
bst22.right = nil
bst13.left = nil
bst13.right = bst14
bst14.left = nil
bst14.right = nil
bst5.left = bst2
bst5.right = bst5_2
bst5_2.left = nil
bst5_2.right = nil
bst2.left = bst1
bst2.right = nil
bst1.left = nil
bst1.right = nil

print("result: ", findClosestValueInBST(tree: bst10, target: 12))





/*{"id": "10", "left": "5", "right": "15", "value": 10},
 {"id": "15", "left": "13", "right": "22", "value": 15},
 {"id": "22", "left": null, "right": null, "value": 22},
 {"id": "13", "left": null, "right": "14", "value": 13},
 {"id": "14", "left": null, "right": null, "value": 14},
 {"id": "5", "left": "2", "right": "5-2", "value": 5},
 {"id": "5-2", "left": null, "right": null, "value": 5},
 {"id": "2", "left": "1", "right": null, "value": 2},
 {"id": "1", "left": null, "right": null, "value": 1}
 ],
 "root": "10"*/


//func reccy(value: Int) {
//    print("entered with value: ", value)
//    if value != 0 {
//        print("CALLING value: ", value - 1)
//        reccy(value: value - 1)
//    }
//    print("ending: ", value)
//}
//reccy(value: 10)


//func fibonachi(number: Int) -> Int {
//    print("number: ", number)
//    if number <= 0 {
//        return 0
//    } else if number == 1 {
//        return 1
//    } else {
//        return fibonachi(number: number - 1) + fibonachi(number: number - 2)
//    }
//}
//print("fibo: ", fibonachi(number: 4))
