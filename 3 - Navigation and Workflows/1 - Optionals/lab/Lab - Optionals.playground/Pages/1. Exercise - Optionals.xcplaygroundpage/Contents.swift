/*:
 ## Exercise - Optionals
 
  >Throughout the exercises in this playground, you will be printing optional values. The Swift compiler will display a warning: "Expression implicitly coerced from `Int?` to Any". For the purposes of these exercises, you can ignore this warning.

 Imagine you have an app that asks the user to enter his/her age using the keyboard. When your app allows a user the input text, what is captured for you is given as a `String`. However, you want to store this information as an `Int`. Is it possible for the user to make a mistake and for the input to not match the type you want to store?
 
 Declare a constant `userInputAge` of type `String` and assign it "34e" to simulate a typo while typing age. Then declare a constant `userAge` of type `Int` and use the `Int` initializer and pass in `userInputAge`. What error do you get?
*/
let userInputAge: Int = 34 //typo

let userAge: Int? = (userInputAge) //Set to 34, but could be 'nil' later

print(userAge) //prints: Optional(34)

if userAge != nil { //! (bang operator)
    let userAge = userInputAge // in order for userAge to be properly displayed, unwrapping the value using the != for if the value is not nil
    print(userAge)
}
/*:
 Go back and change the type of `userAge` to `Int?`, and print the value of `userAge`. Why is `userAge`'s value `nil`? Provide your answer in a comment or print statement below.
 */
//Because userInputAge is a String type, userAge is not provided to proper values, so it set to nil, or nothing.


/*:
 Now use optional binding to unwrap `userAge`. If `userAge` has a value, print it to the console.
 */
if let anotherUserAge = userAge { //set to the optional value, changing userAge property value
    print(anotherUserAge) //prints: 34
} else {
    print("The user ages are not the same")
}

//: page 1 of 6  |  [Next: App Exercise - Finding a Heart Rate](@next)
