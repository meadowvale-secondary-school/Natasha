/*:
 ## App Exercise - Printable Workouts

 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 The `Workout` objects you have created so far in app exercises don't show a whole lot of useful information when printed to the console. They also aren't very easy to compare or sort. Throughout these exercises, you'll make the `Workout` class below adopt certain protocols that will solve these issues.
 */
class Workout: CustomStringConvertible, Equatable, Comparable, Codable {
    var distance: Double
    var time: Double
    var identifier: Int
    
    init(distance: Double, time: Double, identifier: Int) {
        self.distance = distance
        self.time = time
        self.identifier = identifier
    }
    
    var description: String { //customStringConvertable computed prop
        return "\(identifier): You travelled a distance of \(distance) km in \(time) min "
    }
    
    static func ==(lhs: Workout, rhs: Workout) -> Bool { //equatable method
        return lhs.identifier == rhs.identifier
    }
    
    static func <(lhs: Workout, rhs: Workout) -> Bool { //comparable method from lowest to highest value
        return lhs.identifier < rhs.identifier
    }
}

var workoutOne = Workout(distance: 4.2, time: 30.53, identifier: 1)
var workoutTwo = Workout(distance: 3.2, time: 20.60, identifier: 2)
var workoutThree = Workout(distance: 5.94 , time: 50.33, identifier: 3)
var workoutFour = Workout(distance: 1.36, time: 10.3, identifier: 4)
var workoutFive = Workout(distance: 3.43, time: 5.43, identifier: 5)

print(workoutOne)
/*:
 Make the `Workout` class above conform to the `Equatable` protocol. Two `Workout` objects should be considered equal if they have the same identifier. Create another instance of `Workout`, giving it an identifier of 2, and print a boolean expression that evaluates to whether or not it is equal to the first `Workout` instance you created.
 */

if workoutOne == workoutTwo {
    print(workoutTwo) //doesnt print since false 
}
/*:
 Make the `Workout` class above conform to the `Comparable` protocol so that you can easily sort multiple instances of `Workout`. `Workout` objects should be sorted based on their identifier. 
 
 Create three more `Workout` objects, giving them identifiers of 3, 4, and 5, respectively. Then create an array called `workouts` of type `[Workout]` and assign it an array literal with all five `Workout` objects you have created. Place these objects in the array out of order. Then create another array called `sortedWorkouts` of type `[Workout]` that is the `workouts` array sorted by identifier. 
 */
let workouts: [Workout] = [workoutTwo,workoutOne,workoutFour,workoutFive,workoutThree]

for sortedWorkouts in workouts {
    print(sortedWorkouts)
}



/*:
 Make `Workout` adopt the `Codable` protocol so you can easily encode `Workout` objects as data that can be stored between app launches. Use a `JSONEncoder` to encode one of your `Workout` instances. Then use the encoded data to initialize a `String`, and print it to the console.
 */
import Foundation

let jsonEncoder = JSONEncoder()

do {
    let jsonData = try jsonEncoder.encode(workoutOne) //takes humanOne object to retrieve data
    let jsonString = String(data: jsonData, encoding: .utf8) //JSONEncoder will give us the JSPN data used to retrieve JSON string
    print("JSON String : " + jsonString!)
} //if nil, statement in order to address to the user
catch {
    "Your workout details could not be loaded, please try again later!"
}


//: [Previous](@previous)  |  page 2 of 5  |  [Next: Exercise - Create a Protocol](@next)
