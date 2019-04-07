/*:
 ## Exercise - Adopt Protocols: CustomStringConvertible, Equatable, and Comparable
 
 Create a `Human` class with two properties: `name` of type `String`, and `age` of type `Int`. You'll need to create a memberwise initializer for the class. Initialize two `Human` instances.
 */
class Human: CustomStringConvertible, Equatable /*Codable*/ { //protocols assigned
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
    
}
let humanOne = Human(name: "Natasha", age: 16) //initalized instances
let humanTwo = Human(name: "Aaron", age: 21)
/*let humanThree = Human(name: "Rachel", age: 17)

let jsonEncoder = JSONEncoder()
if let jsonData = try? jsonEncoder.encode(humanThree), let Data = String(data: jsonData, encoding: .utf8) {
    print(Data)
}
do {"name":"Rachel", "age": "17"}



print(humanOne)
print(humanTwo)*/

/*:
 Make the `Human` class adopt the `Comparable` protocol. Sorting should be based on age. Create another three instances of a `Human`, then create an array called `people` of type `[Human]` with all of the `Human` objects that you have initialized. Create a new array called `sortedPeople` of type `[Human]` that is the `people` array sorted by age.
 */
if humanOne == humanTwo {
    print(humanTwo)
}

/*:
 Make the `Human` class adopt the `Codable` protocol. Create a `JSONEncoder` and use it to encode as data one of the `Human` objects you have initialized. Then use that `Data` object to initialize a `String` representing the data that is stored, and print it to the console.
 */
import Foundation



//: page 1 of 5  |  [Next: App Exercise - Printable Workouts](@next)
