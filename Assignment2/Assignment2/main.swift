//
//  main.swift
//  Assignment2
//
//  Created by İbrahim Doğan on 7.05.2020.
//  Copyright © 2020 Ibrahim Dogan. All rights reserved.
//

import Foundation

//you can change the length
let length = 5

// random string generator by length
func randomString(length: Int) -> String {
  let letters = "abcdefghijklmnopqrstuvwxyz"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

// generating string with length
var hiddenString = randomString(length: length)

// sending message to user
let message = "Hey! I have word with lenght \(length)."
print(message, "Can you guess it?")

// setting variables
var count = 0
var hint = 1
while true {
    let typed = readLine()!
    
    //if user guess true
    if hiddenString == typed{
        print("You guess the word!")
        calculatePoint(hint: hint, wordlength: hiddenString.count)
        break
    }
    // if user guess wrong
    else {
        count += 1
        print("My word is not \(typed), guess again :")
        
        // if user guess more than 2 times wrong showing hint
        if count > 2 {
            let hintString = giveHint(hiddenString: hiddenString, hint: hint)
            hint += 1
            print(hintString)
            count = 0
        }
        
    }
}

//hint function for giving hint string
//first n chars reveal other are *
//ex: giveHint("ibrahim", 3) -> "ibr****"
func giveHint(hiddenString: String, hint: Int) -> String {
    var result = String()

    var index = 0
    for _ in hiddenString{
        if index < hint {
            result.append(hiddenString[hiddenString.index(hiddenString.startIndex, offsetBy: index)])
            index += 1
        } else {
            result.append("*")
        }
    }
    
    return result
}

// score is simple
// if user gets 1 hint for 5 length of word 100 - 20 = 80 points
// if user gets 2 hint for 5 length of word 100 - 40 = 60 points
// if user gets 1 hint for 10 length of word 100 - 10 = 90 points
func calculatePoint(hint: Int, wordlength: Int){
    var score = 0
    
    score = 100 / wordlength * (wordlength - hint + 1)
    
    print("Your score is \(score)")
}

print("Bye bye")
