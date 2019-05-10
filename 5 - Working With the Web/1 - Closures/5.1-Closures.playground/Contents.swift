import UIKit
/*
//review of functions syntax
func sum(numbers: [Int]) -> Int {
    //code that adds together the numbers array
    return total
}

//syntax of closures

let sumClosure = { (numbers: [Int]) -> Int in //in keyword to indicate you're now entering the code to be excuted when calling the closure
    //code that adds together the numbers array
    return total
}

//perform the action
let sum = sumClosure([1,2,3,4,])
print(sum) //prints 10
*/

//There are Four Types of Closures:
/*
//A closure with no parameters and no return value
let printClosure = { () -> Void in
    print("This closure does not take any parameters and does not return a value.")
}

//A closure with parameters and no return value
let printClosure2 = { (string: String) -> Void in
    print(string)
}

//A closure with no paramters and a return value
let randomNumberClosure = { () -> Int in
    //Code that returns a random number
}

let randomNumberClosure2 = { (minValue: Int, maxValue: Int) -> Int in
    //Code that returns a random number between minValue and maxValue
    
}*/

struct Track {
    var trackNumber: Int
}

let tracks = [Track(trackNumber: 3), Track(trackNumber: 2), Track(trackNumber: 1), Track(trackNumber: 4)]
//Can use built in sorted(by:) array function on arrays that takes a closure as an argument
let sortedTracks = tracks.sorted { (firstTrack, secondTrack) -> Bool in
    return firstTrack.trackNumber < secondTrack.trackNumber //sorted(by:) function will run the instruction on every pair of objects in the array, if the closure returns true, the first track will stay i fron of the seconded track, if return false, the first track will move behind the second track, will repeat until true
    
    //instead of setting type - since the method being called by [Track] collection, the swift compiler can infer that the two parameters within the closure will be of type Track
}

let sortedTracks2 = tracks.sorted { (firstTrack, secondTrack) in //infers that the closure must return a Bool value, so can remove return type
    return firstTrack.trackNumber < secondTrack.trackNumber
}

//since the sorted function needs two instances to compare, can use placeholder names for the closure parameters, using $ followed by the index of the paramter using $0, and $1 as first and second
let sortedTracks3 = tracks.sorted { $0.trackNumber < $1.trackNumber //when only has one line, swift will sutomatically return the result, so can remove return
}

//Trailing closure Syntax - when the closure is the last argument of a function, can move closing brackets after the second to last argument, leaving the curly braces at the end
func performRequest(url: String, response: (_ code: Int) -> Void)
{ }

//can omit the paranterse entirmey if the functions argument is only a closrue
performRequest(url: "https://www.apple.com") { (data) in
    print(data)
}

//COLLECTION FUNCTIONS USING CLOSURES - for iterating over collections

//MAP - takes a closure parameter telling what to do to each object in array

//Initial Array (TRADITIONAL)
let names = ["Johnny", "Nellie", "Aaron", "Rachel"]


//creates an empty array that will be used to store the full names
var fullNames: [String] =  []

for name in names {
    let fullName = name + " Smith"
    fullNames.append(fullName)
}

//or can use map() function

let names2 = ["Johnny", "Nellie", "Aaron", "Rachel"]

//Creates a new array of full names by adding "Smith" to each first name
let fullNamesMapped = names.map { (name) -> String in
    return name + " Smith"
}

//A shortened version of the mape() function works as well - using $0 as a placeholder for the current object in the array

let fullNamesShortenedMap = names.map { $0 + " Smith" }

print(fullNamesShortenedMap)

// FILTER creates a new array with only the objects from the starting array that make a specific case

//TRADITIONAL using for in loop

let numbers = [4, 8, 15, 16, 23, 42]

var numbersLessThan20: [Int] = []

for number in numbers {
    if number < 20 {
        numbersLessThan20.append(number)
    }
}

print(numbersLessThan20)

//Using the filter() function
let numbersLessThan20Filtered = numbers.filter { (number) -> Bool in
    return number < 20
}
print(numbersLessThan20)

//shortened syntax of filter()
let numbersLessThan20Shortened = numbers.filter { $0 < 20 } //$0 reps the individual object being worked with
print(numbersLessThan20Shortened)

// each prints [4, 8, 15, 16]

//REDUCE - combines all the values into array with one value

//TRADITIONAL FOR LOOP

let numbers3 = [8, 6, 7, 5, 3, 0, 9]
var total = 0

for number in numbers3 {
    total = total + number
}
print(total)

//using reduce() function
let totalReduced = numbers3.reduce(0) { (currentTotal, newValue) -> Int in
    return currentTotal + newValue
}
print(totalReduced)

//Shortened
let totalShortened = numbers3.reduce(0, {$0 + $1}) //starting value in fucntion call - #0, closure paramenter {}, $0 represents items reduced so far, $1 represents - value of new item reducing 
print(totalShortened)

// each prints 38
