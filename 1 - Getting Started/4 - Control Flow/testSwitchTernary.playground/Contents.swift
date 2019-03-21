import UIKit

//Switch Statements: used to run multiple cases

let numberOfWheels = 2
switch numberOfWheels {
case 1:
    print("Unicycle") //considered as value 1
case 2:
    print("Bicycle") //value 2
case 3:
    print("Tricycle") //value 3...
case 4:
    print("Quadcycle")
default:
    print("That's a lot of wheels!") //what will display if all other cases are not met
}
//case values can evaluate multiple conditions at once:
let character = "z"

switch character {
case "a", "e", "i", "o", "u" : //cases that can be true
    print("This character is a vowel")
default:
    print("This character is a consonant")
}
//when working with numbers, you can use interval matching to check for inclusion in range
let distance = 88
switch distance {
case 0...9:
    print("Your destination is close")
case 10...99:
    print("Your destination is in walking distance")
case 100...999:
    print("Your destination is driving distance")
default:
    print("Are you sure you want to travel this far?")
}


//TERNARY OPERATOR used for an if statement to set a variable or return a value
var largest: Int //selects type

let a = 15 //constants
let b = 4

if a > b {      //checks if the value of one number is greater than the other
    largest = a
} else {
    largest = b
} // whichever has highest value will be assigned to a largest variable

// To make more concise, use ternary operator (?:)
var largest2: Int
let A = 15
let B = 4

largest2 = A > B ? A : B // read as "if a > b, assign a to the largest constant. Otherwise, assign b."

// Since a is greater than b, it is assigned to largest
