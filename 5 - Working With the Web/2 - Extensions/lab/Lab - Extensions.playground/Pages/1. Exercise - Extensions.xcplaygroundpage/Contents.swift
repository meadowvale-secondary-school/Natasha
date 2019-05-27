/*:
 ## Exercise - Extensions
 
 Define an extension to `Character` that includes a function `isVowel()`. The function returns `true` if the character is a vowel (a,e,i,o,u), and `false` otherwise. Be sure to properly handle uppercase and lowercase characters.
 */
let vowels: [Character] = ["a", "i", "e", "o", "u"]

extension Character {
    func isVowel() -> Bool {
        if vowels.contains("a") {
            return true
        }
        if vowels.contains("r") {
        return false
        }
        return isVowel()
    }
}

/*:
 Create two `Character` constants, `myVowel` and `myConsonant`, and set them to a vowel and a consonant, respectively. Use the `isVowel()` methods on each constant to determine whether or not it's a vowel.
 */
let myVowel: Character = "a"

let myConstant: Character = "r"

print(myVowel.isVowel())

print(myConstant.isVowel())
/*:
 Create a `Rectangle` struct with two variable properties, `length` and `width`, both of type `Double`. Below the definition, write an extension to `Rectangle` that includes a function, `half()`. This function returns a new `Rectangle` instance with half the length and half the width of the original rectangle.
 */
struct Rectangle {
    var length: Double
    var width: Double
}

extension Rectangle {
    func half() -> String {
        let newLength = length / 2
        let newWidth = width / 2
        
        return "Half of the rectangle is \(newLength) by \(newWidth)"
    }
}


var myRectangle = Rectangle(length: 10, width: 5)

print("The original rectangle is \(myRectangle.length) by \(myRectangle.width)")

var mySmallerRectangle = myRectangle.half()

print(myRectangle)
print(mySmallerRectangle)
/*:
 Create a variable `Rectangle` called `myRectangle`, and set its length to 10 and its width to 5. Create a second instance, `mySmallerRectangle`, that's the result of calling `half()` on `myRectangle`. Then update the values of `myRectangle` by calling `halved()` on itself. Print each of the instances.
 */


//: page 1 of 2  |  [Next: App Exercise - Workout Extensions](@next)
