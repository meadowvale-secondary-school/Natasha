//
//  EventTableViewCell.swift
//  MonthlyEvents:PocketPlanner
//
//  Created by Student04 on 2019-06-03.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var endTimeEventLabel: UILabel!
    @IBOutlet weak var eventDetailsLabel: UILabel!
    @IBOutlet weak var startTimeLabel: UILabel!
    @IBOutlet weak var eventNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
