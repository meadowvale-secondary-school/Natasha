//
//  EventTableViewController.swift
//  MonthlyEvents:PocketPlanner
//
//  Created by Student04 on 2019-06-03.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

protocol EventManagementDelegate {
    func addNew(_ event: Event)
}

class EventTableViewController: UITableViewController {

    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
        events = Event.loadEvents() ?? events
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
        
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCellIdentifier", for: indexPath) as? EventTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        
        let event = events[indexPath.row]
        
        cell.eventNameLabel?.text = event.eventTitle
        cell.dateLabel?.text = event.eventDate
        cell.startTimeLabel?.text = event.startTime
        cell.endTimeEventLabel?.text = event.endTime
        cell.eventDetailsLabel?.text = event.eventDetails

        return cell
    }
 
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            events.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            Event.saveEvents(events)
            }
        }
    
    @IBAction func unwindToEventList(segue: UIStoryboardSegue){
  //      guard segue.identifier == "saveUnwind" else { return }
  //      let sourceViewController = segue.source as! EventPopoverViewController
        
 //       if let event = sourceViewController.event {
 //           if let selectedIndexPath = tableView.indexPathForSelectedRow {
 //              events[selectedIndexPath.row] = event
//              tableView.reloadRows(at: [selectedIndexPath], with: .none)
//            } else {
//
 //               let newIndexPath = IndexPath(row: events.count, section: 0)
//                events.append(event)
 //               tableView.insertRows(at: [newIndexPath], with: .automatic)
//        }
            
 //   }

}
    
    
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEvents = events.remove(at: fromIndexPath.row)
        events.insert(movedEvents, at: to.row)
        Event.saveEvents(events)
        tableView.reloadData()
    }
    
}

extension EventTableViewController: EventManagementDelegate {
    func addNew(_ event: Event) {
        let newIndexPath = IndexPath(row: events.count, section: 0)
        events = Event.loadEvents() ?? events
        events.append(event)
        Event.saveEvents(events)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
}
