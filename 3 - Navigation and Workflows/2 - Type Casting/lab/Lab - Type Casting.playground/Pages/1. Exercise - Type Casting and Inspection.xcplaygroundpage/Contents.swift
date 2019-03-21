/*:
 ## Exercise - Type Casting and Inspection
 
 Create a collection of type [Any], including a few doubles, integers, strings, and booleans within the collection. Print the contents of the collection.
 */
var randomCollection: [Any] = [1.3, "hello", 42.9, "bye", true, "yes", false,]

print(randomCollection)
/*:
 Loop through the collection. For each integer, print "The integer has a value of ", followed by the integer value. Repeat the steps for doubles, strings and booleans.
 */
//Doubles
if let intItems = randomCollection[0] as? Double {
    print("The integer has a value of \(intItems)")
}
if let intItems = randomCollection[2] as? Double {
    print("The integer has a value of \(intItems)")
}

//Strings
if let stringItems = randomCollection[1] as? String {
    print("The string has a value of \(stringItems)")
}

if let stringItems = randomCollection[3] as? String {
    print("The string has value of \(stringItems)")
}

//Booleans
if let boolItems = randomCollection[4] as? Bool {
    print("The boolean has a value of \(boolItems)")
}

if let boolItems = randomCollection[6] as? Bool {
    print("The boolean has a value of \(boolItems)")
}
/*:
 Create a [String : Any] dictionary, where the values are a mixture of doubles, integers, strings, and booleans. Print the key/value pairs within the collection
 */
var mixedItems: [String: Any] = ["First Value": 2.7, "Second Value": 4, "Third Value": "I'm third!", "Fourth Value": false]

for (keyName,value) in mixedItems {
    if let doubleValue = value as? Double {
        print("The \(keyName) is \(doubleValue)")
    }
    if let intValue = value as? Int {
        print("The \(keyName) is \(intValue)")
    }
    if let stringValue = value as? String {
        print("The \(keyName) is \(stringValue)")
    }
    if let boolValue = value as? Bool {
        print("The \(keyName) is \(boolValue)")
    }
}



/*:
 Create a variable `total` of type `Double` set to 0. Then loop through the dictionary, and add the value of each integer and double to your variable's value. For each string value, add 1 to the total. For each boolean, add 2 to the total if the boolean is `true`, or subtract 3 if it's `false`. Print the value of `total`.
 */
//var total: Double = 0


for (keyName, anyValue) in mixedItems {
    var total: Double = 0

    if let doubleValue = anyValue as? Double {
        total + doubleValue
    }
    
    else if let intValue = anyValue as? Int  {
        total + Double(intValue)
    }
    
    if let stringValue = anyValue as? String {
        let stringValue = 1
        total = Double(stringValue)
    }
    if let boolValue = anyValue as? Bool {
       if boolValue == true {
            total + 2
}   else if boolValue == false {
            total - 3
        }
    }
}


/*:
 Create a variable `total2` of type `Double` set to 0. Loop through the collection again, adding up all the integers and doubles. For each string that you come across during the loop, attempt to convert the string into a number, and add that value to the total. Ignore booleans. Print the total.
 */
var total2: Double = 0
for (keyName, anyValue) in mixedItems {
    if let numbers = anyValue as? Int {
     total2 + Double(numbers)
    }
    
    else if let strings = anyValue as? String {
        let string = "12"
        let newTotal = Int(string)!
        print(total2 + Double(newTotal))
    }
}



//: page 1 of 2  |  [Next: App Exercise - Workout Types](@next)
