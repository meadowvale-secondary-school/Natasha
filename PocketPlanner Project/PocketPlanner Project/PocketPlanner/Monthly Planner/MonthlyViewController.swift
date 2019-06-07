import UIKit

var dateString = ""



class MonthlyViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var events: [Event] = []

    
    @IBOutlet weak var Calendar: UICollectionView!
    @IBOutlet weak var MonthLabel: UILabel!
    //calendar info
    let date = Date()
    let calendar = Foundation.Calendar.current
    
    lazy var day = calendar.component(.day , from: date)
    lazy var weekday = calendar.component(.weekday, from: date) - 1
    lazy var month = calendar.component(.month, from: date) - 1
    lazy var year = calendar.component(.year, from: date)
    
       let Months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
    
    let DaysOfMonth = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    
    var DaysInMonths = [31,28,31,30,31,30,31,31,30,31,30,31]
    
    var currentMonth = String()
    
    var NumberOfEmptyBox = Int()
    
    var NextNumberOfEmptyBox = Int()
    
    var PreviousNumberOfEmptyBox = 0
    
    var Direction = 0
    
    var PositionIndex = 0
    
    var LeapYearCounter = 2
    
    var dayCounter = 0
    
    var highlightDate = -1
    
    var cellArray: [UICollectionViewCell] = [] //array to store cells
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentMonth = Months[month]
        MonthLabel.text = "\(currentMonth) \(year)"
        if weekday == 0 {
            weekday = 7
        }
        GetStartDateDayPosition()

    }
    
//-----------(Calculates the number of "empty" boxes at the start of every month")------------------------------------------------------
    
    func GetStartDateDayPosition() {
        switch Direction{
        case 0:                                     
            NumberOfEmptyBox = weekday
            dayCounter = day
            while dayCounter>0 {
                NumberOfEmptyBox = NumberOfEmptyBox - 1
                dayCounter = dayCounter - 1
                if NumberOfEmptyBox == 0 {
                    NumberOfEmptyBox = 7
                }
            }
            if NumberOfEmptyBox == 7 {
                NumberOfEmptyBox = 0
            }
            PositionIndex = NumberOfEmptyBox
        case 1...:
            NextNumberOfEmptyBox = (PositionIndex + DaysInMonths[month])%7
            PositionIndex = NextNumberOfEmptyBox
            
        case -1:
            PreviousNumberOfEmptyBox = (7 - (DaysInMonths[month] - PositionIndex)%7)
            if PreviousNumberOfEmptyBox == 7 {
                PreviousNumberOfEmptyBox = 0
            }
            PositionIndex = PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }



    @IBAction func Next(_ sender: Any) {
        highlightDate = -1
        
        switch currentMonth {
        case "December":
            Direction = 1

            month = 0
            year += 1
            
            if LeapYearCounter  < 5 {
                LeapYearCounter += 1
            }
            
            if LeapYearCounter == 4 {
                DaysInMonths[1] = 29
            }
            
            if LeapYearCounter == 5{
                LeapYearCounter = 1
                DaysInMonths[1] = 28
            }
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            //month label animation next
            moveAnimationNext(label: MonthLabel)
            
            Calendar.reloadData()
        default:
            Direction = 1
            
            GetStartDateDayPosition()
            
            month += 1

            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            moveAnimationNext(label: MonthLabel)
          
            Calendar.reloadData()
        }
    }
    
    @IBAction func Back(_ sender: Any) {
        highlightDate = -1 //highlight removed
        
        switch currentMonth {
        case "January":
            Direction = -1

            month = 11
            year -= 1
            
            if LeapYearCounter > 0{
                LeapYearCounter -= 1
            }
            if LeapYearCounter == 0{
                DaysInMonths[1] = 29
                LeapYearCounter = 4
            }else{
                DaysInMonths[1] = 28
            }
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            //month label animation back
            moveAnimationBack(label: MonthLabel)
            
            Calendar.reloadData()
            
        default:
            Direction = -1

            month -= 1
            
            GetStartDateDayPosition()
            
            currentMonth = Months[month]
            MonthLabel.text = "\(currentMonth) \(year)"
            moveAnimationBack(label: MonthLabel)
            Calendar.reloadData()
        }
    }
    
    var eventDate = -1
   
//(CollectionView)
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Direction{
        case 0:
            return DaysInMonths[month] + NumberOfEmptyBox
        case 1...:
            return DaysInMonths[month] + NextNumberOfEmptyBox
        case -1:
            return DaysInMonths[month] + PreviousNumberOfEmptyBox
        default:
            fatalError()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Calendar", for: indexPath) as! DateCollectionViewCell
        cell.backgroundColor = UIColor.clear
        
        cell.DateLabel.textColor = UIColor.black
        
        cell.Circle.isHidden = true
        
        if cell.isHidden{
            cell.isHidden = false
        }
        
        switch Direction {      //the first cells that needs to be hidden (if needed) will be negative or zero so we can hide them
        case 0:
            cell.DateLabel.text = "\(indexPath.row + 1 - NumberOfEmptyBox)"
        case 1:
            cell.DateLabel.text = "\(indexPath.row + 1 - NextNumberOfEmptyBox)"
        case -1:
            cell.DateLabel.text = "\(indexPath.row + 1 - PreviousNumberOfEmptyBox)"
        default:
            fatalError()
        }
        
        if Int(cell.DateLabel.text!)! < 1{
            cell.isHidden = true
        }
        
        switch indexPath.row { //weekend days color
        case 5,6,12,13,19,20,26,27,33,34:
            if Int(cell.DateLabel.text!)! > 0 {
                cell.DateLabel.textColor = UIColor.lightGray
            }
        default:
            break
        }
        if currentMonth == Months[calendar.component(.month, from: date) - 1] && year == calendar.component(.year, from: date) && indexPath.row + 1 - NumberOfEmptyBox == day{
            cell.Circle.isHidden = false
            cell.DrawCircle()
            
        }
        
        if highlightDate == indexPath.row {
            cell.backgroundColor = UIColor(red: 199/255, green: 233/255, blue: 252/255, alpha: 1.0)

        }

       cellArray.append(cell)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath){
        cell.alpha = 0 //disappear and transform
        cell.layer.transform = CATransform3DMakeScale(0.5, 0.5, 0.5)
        
        for x in cellArray {
            let cell: UICollectionViewCell = x
            UIView.animate(withDuration: 0.4, delay: 0.4, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseOut, animations: {
                cell.alpha = 1
                cell.layer.transform = CATransform3DMakeScale(1, 1, 1)
            })
        }
    }
    
    //adding highlight to selected date - collects index path
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //equals to date pressed for populating title
        dateString = "\(currentMonth) \(indexPath.row - PositionIndex + 1), \(year)"
        
        //every cell clicked, view controller is loaded
        performSegue(withIdentifier: "nextView", sender: self)
        
        highlightDate = indexPath.row
        
        eventDate = indexPath.row
        
        collectionView.reloadData() //reloads calendar
      
    }
    
    //VIEW EVENTS BUTTON TAPPED
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
            guard segue.identifier == "viewEvents" else { return }
            
        
       //LOADING EVENTS from View Events button 
        
        if let savedEvents = Event.loadEvents() {
            events = savedEvents
        } else {
            events = [Event]()
            print("unable to view events")
        }

        
        }
    

    
}
