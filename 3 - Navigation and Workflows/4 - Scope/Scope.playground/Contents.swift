import UIKit

//Scope - where constants and variables are visible and accessible

/*GLOBAL SCOPE - refers to code that's defined outside of a function
 (When you are declaring variables inside an Xcode playground, declaring in global scope)
 - After you define a variable on one line, it's available to each line after it
 
 Example
 var age = 55 //Global Variable
   
 func printMyAge() { //not within braces
 print("My age: \(age)") //can be accessed in a control flow
 }
   
 print(age) //prints "55"
 printMyAge() //can be accesed anywhere afterward. Prints: "My age: 55"
 
 //LOCAL SCOPE - when adding a pair of curly braces {} for a function, if statement, or a for loop, the area within the braces is called local scope
 - Any constant or variable declared within the braces isn't accesible by any other scope
 
 Example:
 */
 func printBottleCount() {
 let bottleCount = 99 //variable defined within function: only available in local scope, inside tghe brackets
 print(bottleCount)
 }
 printBottleCount() //prints: 99
// print(bottleCount) //Error: can access Local scope constant

// Example 3: Put it all together
 
 func printTenNames() {
    var name = "Grey" //local variable avaliable to function scope, AND for loop scope.
    for index in 1...10 { //"index" defined within the scope of the for loop, only the loop can access it
 print("\(index): \(name)")
    }
    print(index) //produces error
    print(name) //"Grey"
 }
 
 printTenNames()

//VARIABLE SHADOWING - defining a variable in two different locations: within different local scopes.

//Example: variable points defined within the function's local scope and within the for loop's local scope

func printComplexScope() {
    var points = 100 //points is declared, set to 100
    print(points)
    
    for index in 1...3 {
        var points = 200 //another "points" declared, value of 200 - shadows the function "points", and instead accesses the one closest to the same scope (200), making "points" (100) inaccesible
        print("Loop \(index):\(points + index)")
    }
    print(points) //after loop is finished, the print statement will print the only "points" variable that it can access: the one with a value of 100
}

printComplexScope()

//WORKKING WITH OPTIONALS  Instead of changing the scope names, shadowing can be helpful with optionals.
//Example: Having an optional name string, and using if let syntax to do some work with its value. Rather than coming up with a new variable name, like "unWrappedName", can re-use name within the scope of the if let braces

var name: String? = "Brady"

if let name = name {
    //name is a local "String" that shadows the global "String?" of the same name
    
    print("My name is \(name)")
}

//Example 2: Variable shadowing to simplify naming unwrapped optionals from a guard statement

func exclaim(name: String?) {
    guard let name = name else { return }
    //The optional "String? is no longer accessible, only the "String"
    
    print("Exclaim function was passed: \(name)")
}
//Shadowing the optional with the unwrapped value is common

//SHADOWING AND INITIALIZERS - using variable shadowing, can create clean, easy-to-read intializers

//Example: Creating an instance of a Person, assuming that every Person instance has both name and age properties

struct Person {
    var name: String
    var age: Int
    
    // since name and age are the names of the parameters within the function scope, shadows name and age properties defined within the Person scope
    init(name: String, age: Int) {
        self.name = name //placing key word self in front of the property name to reference the property specifically, and to avoid confusion that variable shadowing may cause to the compiler and the reader
        self.age = age
         //This syntax makes it vert clear that the name and age properties are set to the name and age parameters passed into the initalizer 
    }
}
let tim = Person(name: "Tim", age: 35)
print(tim.name) //Tim
print(tim.age) //35


