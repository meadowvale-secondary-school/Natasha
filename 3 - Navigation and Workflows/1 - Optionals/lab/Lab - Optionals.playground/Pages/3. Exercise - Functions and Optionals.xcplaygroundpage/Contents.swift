/*:
 ## Exercise - Functions and Optionals
 
 If an app asks for a user's age, it may be because the app requires a user to be over a certain age to use some of the services it provides. Write a function called `checkAge` that takes one parameter of type `String`. The function should try to convert this parameter into an `Int` value and then check if the user is over 18 years old. If he/she is old enough, print "Welcome!", otherwise print "Sorry, but you aren't old enough to use our app." If the `String` parameter cannot be converted into an `Int` value, print "Sorry, something went wrong. Can you please re-enter your age?" Call the function and pass in `userInputAge` below as the single parameter. Then call the function and pass in a string that can be converted to an integer.
 */
let userInputAge: String = "34e"


func checkAge(intAge:String) {
    let newAge = Int(intAge)   //checks to see if intAge can become an Int, if not intAge is set to nil
    //how would you then check the user's age if intAge cannot be converted to int? (optional binding and then set to int?)
    if newAge == nil { // newAge cannot be converted to Int, thus it is nil
        print("Sorry, something went wrong. Can you please re-enter your age?")
    }
}

checkAge(intAge: userInputAge)
//: [Previous](@previous)  |  page 3 of 6  |  [Next: App Exercise - Food Functions](@next)

/*:
 Imagine you are creating an app for making purchases. Write a function that will take the name of an item for purchase and will return the cost of that item. In the body of the function, check to see if the item is in stock by accessing it in the dictionary `stock`. If it is, return the price of the item by accessing it in the dictionary `prices`. If the item is out of stock, return `nil`. Call the function and pass in a `String` that exists in the dictionaries below. Print the return value.
 */
var prices = ["Chips": 2.99, "Donuts": 1.89, "Juice": 3.99, "Apple": 0.50, "Banana": 0.25, "Broccoli": 0.99]
var stock = ["Chips": 4, "Donuts": 0, "Juice": 12, "Apple": 6, "Banana": 6, "Broccoli": 3]

func purchases(itemName: String) {
    if let checkPrice = prices[itemName] {
        print("The price of \(itemName) is \(checkPrice)")
    }
    if let checkStock = stock[itemName] {
        if let stockPrice = prices[itemName] {
            if checkStock > 0 {
            print("The price of the item is \(stockPrice)")
            } else {
                let stockPrice: Double? = nil
                print("Sorry, the item is out of stock")
            }
        }
        
    }
}

purchases(itemName: "Donuts")
/*func checkAge(ageString: String) {
 let ageInt = Int(ageString) //Swift infers ageInt is of Int? type bc Int(ageString: String) initalizer may or may not be able to successfully convert String into Int
 if ageInt != nil {
 let ageInt = ageString!
 }
 }*/


// if you want to write a function that accepts an optional as an argument, simply update the  parameter



/*var ageString: String? = nil
 
 func checkAge(ageString: String) {
 if ageString != nil {
 var ageInt = Int(ageString)
 
 if ageInt > 18 {
 print("Welcome!")
 } else {
 print("Sorry, but you aren't old enough to use our app.")
 }
 if ageString == String {
 print("Sorry, something went wrong. Can you please re-enter your age?")
 }
 
 }
 }
 checkAge(ageString: userInputAge)
 */
