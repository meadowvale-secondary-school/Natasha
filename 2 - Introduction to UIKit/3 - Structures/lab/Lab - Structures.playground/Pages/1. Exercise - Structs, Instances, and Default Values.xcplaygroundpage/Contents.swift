/*:
 ## Exercise - Structs, Instances, and Default Values
 
 Imagine you are creating some kind of app for monitoring location. Create a `GPS` struct with two variable properties, latitude and longitude, both with default values of 0.0.
 */
struct GPS {
    var latitude: Double = 0.0 //variable properties
    var longitude: Double = 0.0
}

/*:
 Create a variable instance of `GPS` called `somePlace`. It should be initialized without supplying any arguments. Print out the latitude and longitude of `somePlace`, which should be 0.0 for both.
 */
var somePlace = GPS() //instance of GPS
print(somePlace.latitude)
print(somePlace.longitude)


/*:
 Change `somePlace`'s latitude to 51.514004, and the longitude to 0.125226, then print the updated values.
 */
var somePlace2 = GPS(latitude: 51.514004, longitude: 0.125226) //instance with arguments of properties
print(somePlace2.latitude)
print(somePlace2.longitude)

/*:
 Now imagine you are making a social app for sharing your favorite books. Create a `Book` struct with four variable properties: `title`, `author`, `pages`, and `price`. The default values for both `title` and `author` should be an empty string. `pages` should default to 0, and `price` should default to 0.0.
 */
struct Book {
    var title = String() //default initalizer
    var author = String()
    var pages = Int()
    var price = Double()
    
}

//UPDATE: favorite book properties included
struct Book2 {
    var title: String = "Tommorow There Will Be Apricots"
    var author: String = "Alia Sholck"
    var pages: Int = 300
    var price: Double = 12.0
    
}

/*:
 Create a variable instance of `Book` called `favoriteBook` without supplying any arguments. Print out the title of `favoriteBook`. Does it currently reflect the title of your favorite book? Probably not. Change all four properties of `favoriteBook` to reflect your favorite book. Then using the properties of `favoriteBook`, print out facts about the book.
 */
var favoriteBook = Book2()
print(favoriteBook.title)
print(favoriteBook.author)
print(favoriteBook.pages)
print(favoriteBook.price)

//: page 1 of 10  |  [Next: App Exercise - Workout Tracking](@next)
