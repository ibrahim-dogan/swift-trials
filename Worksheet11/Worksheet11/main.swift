//
//  main.swift
//  Worksheet11
//
//  Created by İbrahim Doğan on 4.05.2020.
//  Copyright © 2020 Ibrahim Dogan. All rights reserved.
//
import Foundation

class Student {
    
    var name:String = ""
    var lastname:String = ""
    var age:Int = 0
    
    init() {
        let number = Int.random(in: 5 ..< 11)
        name = randomString(length: number).lowercased()
        name = name.prefix(1).uppercased() + name.dropFirst()
        
        let number2 = Int.random(in: 10 ..< 16)
        self.lastname = randomString(length: number2).uppercased()
        
        self.age = Int.random(in: 18 ..< 30)
    }
    
    func nameStartsWith(str: String) -> Bool {
        if self.name.starts(with: str){
            return true
        } else {
            return false
        }
        
    }
    
    func rangeOfAges(ageMin: Int, ageMax: Int) -> Bool {
        if self.age < ageMax && self.age > ageMin{
            return true
        } else {
            return false
        }
    }
    
    func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
    
}

var studentList:[Student] = []
var numberOfStudents:Int = 20

for _ in 0...numberOfStudents{
    studentList.append(Student())
}

print("############ STUDENT LIST ############")

for student in studentList{
    print("Student name: \(student.name), lastname: \(student.lastname), age: \(student.age)")
}

print("\n##### STUDENT NAME STARTS WITH A #####")

for student in studentList{
    if student.nameStartsWith(str: "A"){
        print("Student name: \(student.name), lastname: \(student.lastname), age: \(student.age)")
    }
}

print("\n##### STUDENT NAME STARTS WITH B #####")

for student in studentList{
    if student.nameStartsWith(str: "B"){
        print("Student name: \(student.name), lastname: \(student.lastname), age: \(student.age)")
    }
}

print("\n##### STUDENT AGE BETWEEN 20 - 25 #####")

for student in studentList{
    if student.rangeOfAges(ageMin: 20, ageMax: 25){
        print("Student name: \(student.name), lastname: \(student.lastname), age: \(student.age)")
    }
}

print("\n##### STUDENT AGE BETWEEN 25 - 30 #####")

for student in studentList{
    if student.rangeOfAges(ageMin: 25, ageMax: 30){
        print("Student name: \(student.name), lastname: \(student.lastname), age: \(student.age)")
    }
}
