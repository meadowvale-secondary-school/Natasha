/*:
 ## Exercise - For-In Loops
 
 Create a for-in loop that loops through values 1 to 100, and prints each of the values.
 */
/* for values in 1...100 {
    print(values)
}*/

/*:
 Create a for-in loop that loops through each of the characters in the `alphabet` string below, and prints each of the values alongside the index.
 */
/*let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

for (index, letter) in alphabet.characters.enumerated() {
    print("\(index): \(letter)")
}*/


/*:
 Create a `[String: String]` dictionary, where the keys are names of states and the values are their capitals. Include at least three key/value pairs in your collection, then use a for-in loop to iterate over the pairs and print out the keys and values in a sentence.
 */
//FOR LOOP - containing a dictionary - holds the key and value of each entry
var provinices: [String: String] = ["Ontario": "Ottawa", "Quebec": "Montreal", "New Brunswick": "Fredriction"]
for (province, capital) in provinices {
    print("The province \(province) has the capital \(capital)")
}

//: page 1 of 6  |  [Next: App Exercise - Movements](@next)
