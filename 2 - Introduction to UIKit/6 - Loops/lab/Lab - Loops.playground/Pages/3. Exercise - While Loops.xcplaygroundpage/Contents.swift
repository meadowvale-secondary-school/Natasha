import Foundation
/*:
 ## Exercise - While Loops
 
 Create a while loop that simulates rolling a 6-sided dice repeatedly until a 1 is rolled. After each roll, print the value. (Hint: use `Int(arc4random_uniform(6) + 1)` to generate a random number between 1 and 6).
 */
var rolled = true //declare variable at its current state

while rolled {
    let dices = Int(arc4random_uniform(6) + 1) // causes dice to generate random values up to 6
    if dices > 1 { //sets condition for if the values is greater than 1
        print("The value of the dice is \(dices)") //prints: "the value of the dice is..6,5,4,3,2,"
    } else if dices == 1 { // sets condition if dice is = 1
        rolled = false //while loop is no longer true once dice = 1, stops looping
        print("You finally reached a dice with a value of 1!")
    }
}

//: [Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - While Loops](@next)
