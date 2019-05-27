import UIKit

struct SomeType {
    
}

extension SomeType {
    //new functionality to add to SomeType goes here
}

//adding computed properties

//add a new computer prop. to type already existing

extension UIColor {
    //add a custom colour by extending the UIColor with favoriteColor
    static var favoriteColor: UIColor {
        return UIColor(red: 0.5, green: 0.1, blue: 0.5, alpha: 1.0)
    }
}

//adding instance or type methods

//use the func keyword, and optionally define a return type
extension String {
    mutating func pluralize() {
        //complex code that takes the current value (self) and converts it to the plural version
    }
}

//print("Apple".pluralized())
//print("Song".pluralized())
//print("Person".pluralized())
//print("Tennis court".pluralized())

//organizing code
/*
class Restaurant {
 let name: String
 var menuItems: [MenuItem]
 var servers: [Employee]
 var cookingStaff: [Employee]
 var customer: [Customer]
 
}
 
 extension Restaurant {
   
 func add(employee: Employee, to group: StaffGroup) {...}
 func remove(employee: Employee, from group: StaffGroup) {...}
 func add(menuItem: MenuItem)
 func remove(menuItem: MenuItem)
   
 func welcome(guest: Customer) {...}
    func serve(item: MenuItem, to: guest: Customer) {...}
    func prepareCheck(for guest: Customer) -> Check {...}

//other methods related to the restaurant

*/

//adding protocols (differnet style from adding directly to type)
/*
 struct Employee {
    var firstName: String
    var lastName: String
    var jobTitle: String
    var phoneNumber: String
}
 
extension Employee: Equatable {
    static func ==(lhs: Employee, rhs: Employee) -> Bool {
        return lhs.firstName == rhs.firstName && lhs.lastName ==
            rhs.lastName && lhs.jobTitle == rhs.jobTitle &&
            lhs.phoneNumber == rhs.phoneNumber
    }
}
 */
