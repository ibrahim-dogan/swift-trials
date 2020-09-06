//
//  main.swift
//  ws10
//
//  Created by İbrahim Doğan on 27.04.2020.
//  Copyright © 2020 Ibrahim Dogan. All rights reserved.
//

import Foundation

//the min and max varibles can be changed
let min = 0
let max = 100

//generating random number by range of min and max
let hiddenNumber = Int.random(in: min ..< max)

// I put message to variable to show it later as well
let message = "Hey! I choose number between \(min) and \(max)."
print(message, "Can you guess it?")

//It should be infinite loop so while true
while true {
    
    //bottom 2 line is for unwraping string and convert string to int
    if let typed = readLine() {
      if let guess = Int(typed) {
        
        //if number is out of range the message appears
        if guess < min || guess > max {
            print(message)
        }
        else if guess < hiddenNumber {
            print("Guess higher number")
        }
        else if guess > hiddenNumber {
            print("Guess lower number")
        }
        else {
            print("You guess my number! Congratulations")
            break //if user knows number while loop breaks
        }
        
      }
    }
    
}
