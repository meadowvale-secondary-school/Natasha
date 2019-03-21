/*:
 ## Exercise - Methods
 
 A `Book` struct has been created for you below. Add an instance method on `Book` called `description` that will print out facts about the book. Then create an instance of `Book` and call this method on that instance.
 */
struct Book {
    var title: String
    var author: String
    var pages: Int
    var price: Double
    
    func description() -> String { // instance method: By creating a function within a type with a return value
        return "The book is called \(title) and was written by \(author). It is \(pages) pgs and costs \(price) dollars" //returns properties
    }
}

var bookDetails = Book(title: "Hiding Edith", author: "Noona Naomi", pages: 300, price: 15.0)
print(bookDetails.description()) //call by using instance name and function name
/*:
 A `Post` struct has been created for you below, representing a generic social media post. Add a mutating method on `Post` called `like` that will increment `likes` by one. Then create an instance of `Post` and call `like()` on it. Print out the `likes` property before and after calling the method to see whether or not the value was incremented.
 */
struct Post {
    var message: String
    var likes: Int
    var numberOfComments: Int
    
    mutating func Like() {
        likes += 1
    }
    
}

var postUpdate = Post(message: "Let's try this!", likes: 10, numberOfComments: 2) //instance

print(postUpdate.likes) //print values of likes property: 10
postUpdate.Like() //increments Like() function value by 1, increasing likes to 11
print(postUpdate.likes) //prints likes property: 11

//: [Previous](@previous)  |  page 5 of 10  |  [Next: App Exercise - Workout Functions](@next)
