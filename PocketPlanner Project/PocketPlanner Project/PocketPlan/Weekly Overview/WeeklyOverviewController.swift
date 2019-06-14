//
//  WeeklyOverviewController.swift
//  PocketPlanner
//
//  Created by Student04 on 2019-06-13.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit


class WeeklyOverviewController: UIViewController {

    //WEEK TITLE
    @IBOutlet weak var mondayDateLabel: UILabel!
    @IBOutlet weak var sundayDateLabel: UILabel!
    
    //WEEKDAY DATES
    @IBOutlet weak var mondayLabel: UILabel!
    @IBOutlet weak var tuesdayLabel: UILabel!
    @IBOutlet weak var wednesdayLabel: UILabel!
    
    var mondayDate = Date.today().previous(.monday)
    var sundayDate = Date.today().next(.sunday)
    
    var mondayWeekDate = Date.today().previous(.monday)
    var tuesdayWeekDate = Date.today().previous(.tuesday)
    var wednesdayWeekDate = Date.today().next(.sunday)
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var clearButton: UIButton!
    
    @IBAction func onClearPressed(_ sender: Any) {
        textView.text = ""
        clearButton.isEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //WEEK TITLE DISPLAY
        let dateFormatter = DateFormatter()
       // dateFormatter.dateFormat = "h:mm a"
        dateFormatter.dateFormat = "EEEE, MMMM d, yyy"
        
        mondayDateLabel.text = dateFormatter.string(from: mondayDate)
        sundayDateLabel.text = dateFormatter.string(from: sundayDate)
        
        //WEEKDAY TITLE DISPLAY
        let weeklyDateFormatter = DateFormatter()
        weeklyDateFormatter.dateFormat = "EEEE d"
        
        mondayLabel.text = weeklyDateFormatter.string(from: mondayWeekDate)
        tuesdayLabel.text = weeklyDateFormatter.string(from: tuesdayWeekDate)
        wednesdayLabel.text = weeklyDateFormatter.string(from: wednesdayWeekDate)

    }
    
}

extension Date {
    
    static func today() -> Date {
        return Date()
    }
    
    func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.Next,
                   weekday,
                   considerToday: considerToday)
    }
    
    func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.Previous,
                   weekday,
                   considerToday: considerToday)
    }
    
    func get(_ direction: SearchDirection,
             _ weekDay: Weekday,
             considerToday consider: Bool = false) -> Date {
        
        let dayName = weekDay.rawValue
        
        let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }
        
        assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")
        
        let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1
        
        let calendar = Calendar(identifier: .gregorian)
        
        if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
            return self
        }
        
        var nextDateComponent = DateComponents()
        nextDateComponent.weekday = searchWeekdayIndex
        
        
        let date = calendar.nextDate(after: self,
                                     matching: nextDateComponent,
                                     matchingPolicy: .nextTime,
                                     direction: direction.calendarSearchDirection)
        
        return date!
    }
    
}


// MARK: Helper methods
extension Date {
    func getWeekDaysInEnglish() -> [String] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        return calendar.weekdaySymbols
    }
    
    enum Weekday: String {
        case monday, tuesday, wednesday, thursday, friday, saturday, sunday
    }
    
    enum SearchDirection {
        case Next
        case Previous
        
        var calendarSearchDirection: Calendar.SearchDirection {
            switch self {
            case .Next:
                return .forward
            case .Previous:
                return .backward
            }
        }
    }
}



