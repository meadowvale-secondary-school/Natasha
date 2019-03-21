import UIKit

//Enumerations - special Swift type that allows you to represent a named set of options.

//ENUM - it defines at common type for a group of related values
//Example: Compass for tracking direction
enum CompassPoint { //enum defines the type
    case north
    case east //case options define the available values allowed with the type
    case south
    case west
    //This is the SAME AS: case north, east, south, west
}

//Case 1
//once you've defined the enumeration, you can start using it like any other type in Swift
var compassHeading1 = CompassPoint.west
// The compiler assigns "compassHeading" as a "CompassPoint" by type inference

//Case 2
var compassHeading2: CompassPoint = .west
//The compiler assigns "compassHeading" as a "CompassPoint" because of type annotation. The value can then be assigned with dot notation

//Now that the type of compassHeading is set, can change the value to another point using the shorter dot notation
compassHeading2 = .north

//CONTROL FLOW - working with same logic with different cases of an enumeration

//Example: prints a different sentence based on which CompassPoint is set to the compassHeading constant

let compassHeading3: CompassPoint = .west

switch compassHeading3 {
case .north: //prints based on which CompassPoint is set to the compassHeading constant
    print("I am heading north")
case  .east:
    print("I am heading east")
case .south:
    print("I am heading south")
case .west:
    print("I am heading west")
}

//Example 2: prints out direction of CompassPoint type if equal to value of .west
let compassHeading4: CompassPoint = .west

if compassHeading4 == .west {
    print("I am heading west")
}

//TYPE SAFETY BENEFITS - important as they allow you to represent information in a type-safe way

//Example: Creating data that represents movies of specific genres

//PROBLEM - imagine you had a simple movie structure like this:

/*struct Movie {
    var name: String
    var releaseYear: Int
    var genre: String
}
//Given that definition, you would use a String when setting the genre

let movie = Movie(name: "Finding Dory", releaseYear: 2016, genre: "Aminated") // Issue with genre initalizer!
// Genre is prone to all errors of String values - including spelling. Now if all movie genres were fetched in the "Animated genre", Finding Dory would be missing
*/
//RESOLVED BY... - Assigning genre a value from an enumeration called Genre
enum Genre {
    case animated, action, romance, documentary, biography, thriller //Genre cases
}

//UPDATED VERSION - incorporating Genre enumeration
struct Movie {
    var name: String
    var releaseYear: Int
    var genre: Genre
}

let movie = Movie(name: "Finding Dory", releaseYear: 2016,
    genre: .animated) //able to choose a case from Genre enumeration when intialzing a new movie - cannot be mistaken now!

