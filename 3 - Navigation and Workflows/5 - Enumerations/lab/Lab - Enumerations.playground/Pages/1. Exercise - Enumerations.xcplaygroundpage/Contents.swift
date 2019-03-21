/*:
 ## Exercise - Enumerations
 
 Define a `Suit` enum with four possible cases: `clubs`, `spades`, `diamonds`, and `hearts`.
 */
enum Suit {
    case clubs
    case spades
    case diamonds
    case hearts
}

/*:
 Imagine you are being shown a card trick and have to draw a card and remember the suit. Create a variable instance of `Suit` called `cardInHand` and assign it to the `hearts` case. Print out the instance.
 */
var cardInHand = Suit.hearts //option 1: type inference
print(cardInHand)

var cardInMyHand:Suit = .hearts//option 2: type annotation
print(cardInMyHand)
/*:
 Now imagine you have to put back the card you drew and draw a different card. Update the variable to be a spade instead of a heart.
 */
cardInHand = Suit.spades
print(cardInHand)

/*:
 Imagine you are writing an app that will display a fun fortune (i.e. something like "You will soon find what you seek.") based on cards drawn. Write a function called `getFortune(cardSuit:)` that takes a parameter of type `Suit`. Inside the body of the function, write a switch statement based on the value of `cardSuit`. Print a different fortune for each `Suit` value. Call the function a few times, passing in different values for `cardSuit` each time.
 */
func getFortune(cardSuit: Suit) {
    switch cardSuit {
    case .clubs:
        print("This card is a club!")
    case .diamonds:
        print("This card is a diamond!")
    case .hearts:
        print("This card is a heart!")
    case .spades:
        print("This card is a spade!")
    }
}

getFortune(cardSuit: .spades) //printing specified values of type Suit

getFortune(cardSuit: .diamonds)

/*:
 Create a `Card` struct below. It should have two properties, one for `suit` of type `Suit` and another for `value` of type `Int`.
 */
struct Card {
    var suit: Suit
    var value: Value
    
    enum Value {
        case ace, two, three, four, five, six, seven, eight, nine, ten, jack, queen, king
        
    }
    
}

let cardTwo = Card(suit: .clubs, value: .two)
let cardSeven = Card(suit: .hearts, value: .seven)
/*:
 How many values can playing cards have? How many values can `Int` be? It would be safer to have an enum for the card's value as well. Inside the struct above, create an enum for `Value`. It should have cases for `ace`, `two`, `three`, `four`, `five`, `six`, `seven`, `eight`, `nine`, `ten`, `jack`, `queen`, `king`. Change the type of `value` from `Int` to `Value`. Initialize two `Card` objects and print a statement for each that details the card's value and suit.
 */
print("Your card is the \(cardTwo.value) of \(cardTwo.suit)")
print("Your card is the \(cardSeven.value) of \(cardSeven.suit)")

//: page 1 of 2  |  [Next: App Exercise - Swimming Workouts](@next)
