//
//  main.swift
//  Midterm
//
//  Created by İbrahim Doğan on 5.05.2020.
//  Copyright © 2020 Ibrahim Dogan. All rights reserved.
//

import Foundation

// Question 1

func biggerArrayElements(arr1: [Int], arr2:[Int])-> [Int]{
    
    var arr:[Int] = []
    
    for i in 0...arr1.count-1 {
        if arr1[i] > arr2[i]{
            arr.append(arr1[i])
        } else {
            arr.append(arr2[i])
        }
    }
    
    return arr
    
}

var array1 = [1, 3, -4, 30, -20]
var array2 = [2, -3, 5, -90, 7]

print(biggerArrayElements(arr1: array1, arr2: array2))

// Question 2

func getDiagonalMaxMin(arr: [[Double]]) -> Double {
    let count = arr[0].count // to get size of elements
    var min = arr[0][0]
    var max = arr[0][0]
    
    for i in 0...count-1{
        for j in 0...count-1{
            if i == j && arr[i][j] < min{
                min = arr[i][j]
            }
        }
    }
    
    for i in 0...count-1{
        for j in 0...count-1{
            if i == j && arr[i][j] > max{
                max = arr[i][j]
            }
        }
    }
        
    return min + max
}

var array3 = [[1.4, 3.6, -4.9],[2.5, -3.8, 5.6],[2.8, 3.9, 5.8]]

print(getDiagonalMaxMin(arr: array3))

// Question 3

protocol IntA {
    func sub(a:Int, b:Int) -> Int
}

protocol IntB {
    func max (a:Int, b:Int) -> Int
}

class Phone{
    
    var price: Double
    var color: String

init(color:String, price:Double) {
    self.color = color
    self.price = price
}

    var Price:Double {
        get {
            return self.price
        }
        set (newPrice){
            self.price = newPrice
        }
    }
        
    var Color:String {
        get {
            return self.color
        }
        set (newColor){
            self.color = newColor
        }
    }


func toString() -> String{
    return "Color is \(color) Price is \(price)"
}
    
    func amount(number:Int) -> Double {
        if(number < 0) {
            return 0.0
        }
        else {
            return price * Double(number)
        }
    }
} // end of Phone Class

class MobilePhone : Phone, IntA, IntB {
    var model:String

init(model:String, price:Double, color:String){
    self.model = model

    super.init(color:color, price:price)
   
}
    override func toString() -> String {
        return "\(super.toString()), Model is: \(model)"
    }
    
    override func amount(number:Int) -> Double {
        if(number < 1) {
            return 0.0
        }
        else if (number > 10){
            return price * Double(number) * 0.8
        }
        else {
            return price * Double(number)
            
        }
    }
    
    
    func sub(a:Int, b:Int) -> Int {
        return a - b
    }
    
    func max(a:Int, b:Int) -> Int {
        if(a>b) {
            return a
        }
        else {
            return b
        }
    }

} // end of MobilePhone class


var mobile1 = MobilePhone(model: "iPhone", price: 1000, color: "SpaceGray")
var mobile2 = MobilePhone(model: "Galaxy S20", price: 500, color: "White")

print("sum \(mobile1.price + mobile2.price)")

print(mobile1.toString())
print(mobile2.toString())


