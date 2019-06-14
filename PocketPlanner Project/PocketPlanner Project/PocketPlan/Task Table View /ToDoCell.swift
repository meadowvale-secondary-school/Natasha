//
//  Created by Student04 on 2019-05-08.
//  Copyright © 2019 Student04. All rights reserved.


//delegate to notify the table view controller when the checkmark is tapped
@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

import UIKit

class ToDoCell: UITableViewCell {
    
    var delegate: ToDoCellDelegate?
    
    @IBOutlet weak var isCompleteButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var weekdayDisplay: UILabel!
    
    @IBOutlet weak var taskDetails: UILabel!
    
    @IBOutlet weak var dateMonthDisplay: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
        if isCompleteButton.isSelected {
        titleLabel.textColor = .lightGray
        weekdayDisplay.textColor = .lightGray
        taskDetails.textColor = .lightGray
        dateMonthDisplay.textColor = .lightGray
        }
    }
}
