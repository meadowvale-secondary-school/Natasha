/*:
 ## Exercise - Create a Protocol
 
 Create a protocol called `Vehicle` with two requirements: a nonsettable `numberOfWheels` property of type `Int`, and a function called `drive()`.
 */
protocol Vehicle {
    var numberOfWheels: Int { get }//define the property as read only (not setting)
    func drive()// requiring a method should have the name, parameters, and return type
    
}

struct Car: Vehicle { //struct implementing Vehicle protocol
    var numberOfWheels: Int { //includes required property
        return 4
    }
    
    func drive() {
        print("Vroom, vroom!") //includes required method
    }
}

let car = Car() //calling Car struct for instance

print(car.numberOfWheels) //printing out values from property and method

car.drive()



/*:
 Define a `Bike` struct that implements the `Vehicle` protocol. `numberOfWheels` should return a value of 2, and `drive()` should print "Begin pedaling!". Create an instance of `Bike`, print its number of wheels, then call `drive()`.
 */
struct Bike: Vehicle {
    var numberOfWheels: Int {
        return 2
    }
    
    func drive() {
        print("Begin pedaling!")
    }
}

let bike = Bike()

print(bike.numberOfWheels)

bike.drive()

//: [Previous](@previous)  |  page 3 of 5  |  [Next: App Exercise - Similar Workouts](@next)
