//: Playground - noun: a place where people can play

/*
 Given an unsorted array of nonnegative integers, find a continous subarray which adds to a given number.
 
 Examples:
 
 Input: arr[] = [1, 4, 0, 0, 3, 10, 5]  and  sum = 7
 Ouptut: [4,0,0,3]
 
 Input: arr[] = {1, 4}, sum = 0
 Output: []

 */

import UIKit



let array = [1, 4, 0, 0, 3, 10, 5]

//First Solution :  Consider all sub array and Check sum of each sub array(s) .
//Time Complexity: O(n^2) in worst case.
func getSubArray(from array: [Int], forSum sum: Int)-> [Int] {
    var subArray = [Int]()
    let n =  array.count
    
    for i in 0..<n {
        
        var newSum = array[i]

        for j in i+1...n {
            
            if newSum == sum {
                subArray = Array(array[i..<j])
            }
            
            if newSum > sum || j == n {
                break
            }
            newSum +=  array[j]
        }
    }
    
    return subArray
    
}

getSubArray(from: array, forSum: 7)



// Second Solution:

//  1. Consider a new Variable  curr_sum as value of first element  in array
//  2. Start from the second element and add all elements one by one to the curr_sum.
//  3. Before adding Check If curr_sum becomes equal to sum, then print the solution.
//  4. Also check If curr_sum exceeds the sum, then remove trailing elemnents , while curr_sum is greater than sum

// Time Complexity: O(n)

func getSubArray(fromArray array:[Int], withSum sum:Int)-> [Int] {
    var subArray = [Int]()
    
    var currSum = array[0]
    var startIndex = 0
    for i in 1...array.count {
        
        while currSum > sum  && startIndex < (i - 1) {
            currSum -= array[startIndex]
            startIndex += 1
        }
        
       
        if currSum == sum {
            subArray = Array(array[startIndex..<i])
        }
        
        if i < array.count {
            currSum += array[i]
        }
    }
    
    return subArray
}

getSubArray(fromArray: array, withSum: 7)
