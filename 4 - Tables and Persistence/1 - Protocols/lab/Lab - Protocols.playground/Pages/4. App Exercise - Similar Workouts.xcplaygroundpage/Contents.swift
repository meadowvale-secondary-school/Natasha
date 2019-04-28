/*:
 ## App Exercise - Similar Workouts
 
 >These exercises reinforce Swift concepts in the context of a fitness tracking app.
 
 Previously in app exercises, you've used inheritance to enforce similar behavior between different kinds of workouts. However, you can enforce this behavior between different workouts using protocols.
 
 Create a protocol `Workout` with two requirements: a settable property called `distance` and a settable property called `time`, both of type `Double`.
 */
protocol Workout {
    var distance: Double { get set } //settable properties
    var time: Double { get set }
}

/*:
 Create two structs, `RunningWorkout` and `SwimmingWorkout`. Both should conform to the `Workout` protocol. Uncomment the function `simpleWorkoutDescription` below, create an instance of each of your structs, and call `simpleWorkoutDescription` twice, passing in a `RunningWorkout` object and then a `SwimmingWorkout` object.
 */
struct RunningWorkout: Workout {
    var distance: Double
    var time: Double
}

struct SwimmingWorkout: Workout {
    var distance: Double
    var time: Double
}

func simpleWorkoutDescription(workout: Workout) { //parameter of Workout protocol
   print("You went \(workout.distance) meters in \(workout.time) seconds.")
}

var runner = RunningWorkout(distance: 4.5, time: 20.50)
var swimmer = SwimmingWorkout(distance: 3.7, time: 17.53)

simpleWorkoutDescription(workout: runner) //running function with each Workout object
simpleWorkoutDescription(workout: swimmer)

/* Prints:
 You went 4.5 meters in 20.5 seconds.
 You went 3.7 meters in 17.53 seconds.
 */
//: [Previous](@previous)  |  page 4 of 5  |  [Next: App Exercise - Heart Rate Delegate](@next)
