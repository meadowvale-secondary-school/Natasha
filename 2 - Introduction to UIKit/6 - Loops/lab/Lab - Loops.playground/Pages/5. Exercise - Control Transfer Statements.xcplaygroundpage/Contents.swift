/*:
 ## Exercise - Control Transfer Statements
 
 Create a for-in loop that will loop through the characters of `alphabet`, and print every other letter by continuing to the next iteration if you are on a letter you do not wish to print. (Hint: You can use the modulo operator to only print even indexed characters).
 */
let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

for (index,letter) in alphabet.characters.enumerated() {
    let evenIndex: Int = index % 2 //% operator (modulo) checks for remainder value (1) for evenIndex
    if evenIndex == 1 { //between index values of 0, (odd), and 1, (even) chooses 1 values for condition to be true
        print("\(evenIndex):\(letter)") //prints even index and letters that accompany them
    }
 }
/*:
 Create a `[String: String]` dictionary where the keys are names of states and the values are their capitals. Include at least three key/value pairs in your collection, with one of them being your home state. Now loop through this dictionary again, printing out the keys and values in a sentence, but add an if statement that will check if the current iteration is your home state. If it is, print("I found my home!") and break out of the loop.
 */
var provinces: [String:String] =  ["Ontario":"Ottawa","Quebec":"Montreal","New Brunswick":"Fredriction"]

for (province,capital) in provinces {
    print("The \(province) has a captial \(capital)")
    
    if let myProvince = provinces["Ontario"] {
        print("I found my home, \(myProvince)!")
        break
    }
    
}
//: [Previous](@previous)  |  page 5 of 6  |  [Next: App Exercise - Finding Movements](@next)
