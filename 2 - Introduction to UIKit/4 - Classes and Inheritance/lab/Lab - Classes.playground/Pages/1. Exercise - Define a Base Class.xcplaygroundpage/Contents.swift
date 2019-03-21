/*:
 ## Exercise - Define a Base Class
 
 - Note: The exercises below are based on a game where a spaceship avoids obstacles in space. The ship is positioned at the bottom of a coordinate system and can only move left and right while obstacles "fall" from top to bottom. Throughout the exercises, you'll create classes to represent different types of spaceships that can be used in the game.
 
 Create a `Spaceship` class with three variable properties: `name`, `health`, and `position`. The default value of `name` should be an empty string and `health` should be 0. `position` will be represented by an `Int` where negative numbers place the ship further to the left and positive numbers place the ship further to the right. The default value of `position` should be 0.
 */
//BASE CLASS - not very useful on its own
class Spaceship {
    var name = String() //properties
    var health: Int = 5
    var position: Int = 0
    
    init(name: String){ //The initalizer sets the name to the parameter specified
        self.name = name//(now name can be used as a parameter when Spaceship() instance is called
    }
    func moveLeft() -> String{ //methods
        position -= 1
        return "The \(name) position has moved \(position) units to the left!"
    }
   func moveRight() -> String {
        position += 1
        return "The \(name) position has moved \(position) units to the right!"
    }
    
    func wasHit() {
        health -= 5
        if health <= 0 {
         print("The \(name) was hit! Health reduced to \(health)")
        }
    }
}




/*:
 Create a `let` constant called `falcon` and assign it to an instance of `Spaceship`. After initialization, set `name` to "Falcon".
 */

/*:
 Go back and add a method called `moveLeft()` to the definition of `Spaceship`. This method should adjust the position of the spaceship to the left by one. Add a similar method called `moveRight()` that moves the spaceship to the right. Once these methods exist, use them to move `falcon` to the left twice and to the right once. Print the new position of `falcon` after each change in position.
 */
var falcon = Spaceship(name: "Falcon")
print(falcon.moveLeft())
print(falcon.moveLeft())
print(falcon.moveRight())
/*:
 The last thing `Spaceship` needs for this example is a method to handle what happens if the ship gets hit. Go back and add a method `wasHit()` to `Spaceship` that will decrement the ship's health by 5, then if `health` is less than or equal to 0 will print "Sorry. Your ship was hit one too many times. Do you want to play again?" Once this method exists, call it on `falcon` and print out the value of `health`.
 */

falcon.wasHit() //refers back to Spaceship class and calls print statement 





//: page 1 of 4  |  [Next: Exercise - Create a Subclass](@next)
