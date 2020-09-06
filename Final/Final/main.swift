//
//  main.swift
//  Final
//
//  Created by İbrahim Doğan on 4.06.2020.
//  Copyright © 2020 Ibrahim Dogan. All rights reserved.
//

import Foundation

protocol IntA {
    func printStudenList()
}

protocol IntTotal {
    var studentNumber : Int {get set}
    var quiz : Double {get set}
    var lab : Double {get set}
    var midterm : Double {get set}
    var final : Double {get set}
}

protocol IntB {
    func countGrades()
}

protocol IntC {
    func finalGrade()
}

protocol IntD {
    func summaray()
}

func randomString(length: Int) -> String {
    let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    return String((0..<length).map{ _ in letters.randomElement()! })
}

class Student: IntA,IntTotal,IntB,IntC,IntD {
    func printStudenList() {
        print("ID: \(studentNumber) Name: \(name) Quiz:\(quizScore) Lab:\(labScore) Midterm:\(midtermScore) Final:\(finalScore) ")
    }
    
    var name:String = ""
    var lastname:String = ""
    var quizScore:Double
    var labScore:Double
    var midtermScore:Double
    var finalScore:Double
    var average:Double
    var letter:String = ""
    
    var studentNumber: Int = 30
    
    var quiz: Double = 0.10
    
    var lab: Double = 0.15
    
    var midterm: Double = 0.35
    
    var final: Double = 0.40
    
    func countGrades() {
        switch average {
        case 85...100:
            letter = "AA"
            print("AA")
        case 75...85:
            letter = "BB"
            print("BB")
        case 65...75:
            letter = "CC"
            print("CC")
        case 55...65:
            letter = "DD"
            print("DD")
        default:
            letter = "FF"
            print("FF")
        }
    }
    
    func finalGrade() {
        print("Student Number \(studentNumber) Average Grade: \(average) Letter Grade: \(letter)")
    }
    
    func summaray() {
        print("Student Number \(studentNumber) Average Grade: \(average)")
    }
    
    init() {
        let number = Int.random(in: 1 ..< 15)
        name = randomString(length: number).lowercased()
        name = name.prefix(1).uppercased() + name.dropFirst()
        
        let number2 = Int.random(in: 5 ..< 15)
        lastname = randomString(length: number2).uppercased()
        
        quizScore = Double.random(in: 1 ... 100)
        labScore = Double.random(in: 1 ... 100)
        midtermScore = Double.random(in: 1 ... 100)
        finalScore = Double.random(in: 1 ... 100)
        average = (quiz * quizScore) + (lab * labScore) + (midterm * midtermScore) + (final * finalScore)
    }
    
}

var studentList:[Student] = []
var numberOfStudents:Int = 20

for _ in 0...numberOfStudents{
    studentList.append(Student())
}

for student in studentList{
    student.printStudenList()
    student.countGrades()
    student.finalGrade()
    student.summaray()
}
