//: Playground - noun: a place where people can play

/*
 
 Given an array of size n-1 and given that there are numbers from 1 to n with one missing, the missing number is to be found.  Write an efficient code to find the missing integer.
 
 
 Example:
 INPUT:    [1, 2, 4, ,6, 3, 7, 8]
 OUTPUT:    5
 
 */

import UIKit


let array = [1,2,3,5,6,7,8,9,10]

// We have to find missing number.

// Solution 1 : Finding Total Sum and substraction each number from it .

// If Size of Array is n  , then total = (n + 1) * (n + 2)/ 2

// Time Complexcity : O(n)

func getMissingNumber(fromArray array: [Int])->Int {
    
    let n  =  array.count
    
    var total =  (n+1)*(n+2)/2;
    
    for num in array {
        total = total - num
    }
    
    return total
    
}

getMissingNumber(fromArray: array)




// Solution 2 : Using XOR

//1) XOR all the elements of array , let the result is XOR1.
//2) XOR all numbers from 1 to n+1, let the result is XOR2.
//3) XOR of XOR1 and XOR2 gives the missing number.

// Time Complexcity : O(n)

func getMissingNumberUsingXOR(fromArray array: [Int])->Int {
    
    var x1  =  0
    var x2  =  0
    
    for  num  in  array {
        print(num)
        x1 = x1^num
        print("xor1 ==>> \(x1)")
    }
    
    
    for   i  in  1...array.count+1  {
        print(i)
        x2 = x2^(i)
        print("xor2 ==>> \(x2)")
    }
    
    
    return (x1^x2);
    
}

getMissingNumberUsingXOR(fromArray: array)
