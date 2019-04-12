/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable, Comparable, Codable { //protocols assigned
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.age = age
        self.name = name
    }
    
    var description: String {
        return "Hello! My name is \(name) and I am \(age)." //required computed property
    }
    
    static func ==(lhs: Human, rhs: Human) -> Bool  { //equatable required method for comparison
       return lhs.name == rhs.name && lhs.age == rhs.age
    }
    //comparable method
    static func <(lhs: Human, rhs: Human) -> Bool {
        return lhs.age < rhs.age //comparing if left side is less than right side for ages
    }
    
}


let humanOne = Human(name: "Natasha", age: 16) //initalized instances
let humanTwo = Human(name: "Aaron", age: 21)


if humanOne == humanTwo {
    print(humanTwo)
}
/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
let humans = [humanOne, humanTwo] //collection of humans

let sortedHumans = humans.sorted(by: <) //sorted out humans by smallest to largest (Can reverse sign to sort large to small)

for theHumans in sortedHumans {
    print(theHumans) //loops through by sorted collection  
}

/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
 */
import Foundation

//CODABLE: Used to make your data types encodable and decodable for compatibility with external representations such as JSON

let jsonEncoder = JSONEncoder()

do {
    let jsonData = try jsonEncoder.encode(humanOne) //takes humanOne object to retrieve data
    let jsonString = String(data: jsonData, encoding: .utf8) //JSONEncoder will give us the JSPN data used to retrieve JSON string
    print("JSON String : " + jsonString!)
}
catch {
}

//OUPUT STRING:
/*
 JSON String : {"name":"Natasha","age":16}
 */
//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
