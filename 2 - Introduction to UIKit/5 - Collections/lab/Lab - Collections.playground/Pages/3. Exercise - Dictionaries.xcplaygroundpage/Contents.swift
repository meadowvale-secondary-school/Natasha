/*:
 ## Exercise - Dictionaries
 
 Create a variable `[String: Int]` dictionary that can be used to look up the number of days in a particular month. Use a dictionary literal to initialize it with January, February, and March. January contains 31 days, February has 28, and March has 31. Print the dictionary.
 */

var monthDays: [String: Int]  = ["January":31, "February":28, "March":31]
print(monthDays) //prints: ["January": 31, "February": 28, "March": 31]

/*:
 Using subscripting syntax to add April to the collection with a value of 30. Print the dictionary.
 */
monthDays["April"] = 30 //using subscripting to add a key and value to dictionary
print(monthDays) //prints:["March": 31, "April": 30, "February": 28, "January": 31]



/*:
 It's a leap year! Update the number of days in February to 29 using the `updateValue(_:, forKey:)` method. Print the dictionary.
 */
monthDays.updateValue(29, forKey: "February") //.updateValue method to change February key's value to 29
print(monthDays)

/*:
 Use if-let syntax to retrieve the number of days under "January". If the value is there, print "January has 31 days", where 31 is the value retrieved from the dictionary.
 */
if let myScore = monthDays["January"] { // if-let syntax to look up a particlar value within a dictionary. If the key you specify is in the dictionary, the result will be the key's corresponding value. If not, no code will be executed in the brackets
    print("January has \(myScore) days.")
}


/*:
 Given the following arrays, create a new [String : [String]] dictionary. `shapesArray` should use the key "Shapes" and `colorsArray` should use the key "Colors". Print the resulting dictionary.
 */
let shapesArray = ["Circle", "Square", "Triangle"] //dictionaries array
let colorsArray = ["Red", "Green", "Blue"]


var Array2 = ["Shape":shapesArray, "Colors":colorsArray] //assigns values to dictionaries

print(Array2)
//: [Previous](@previous)  |  page 3 of 4  |  [Next: App Exercise - Pacing](@next)
