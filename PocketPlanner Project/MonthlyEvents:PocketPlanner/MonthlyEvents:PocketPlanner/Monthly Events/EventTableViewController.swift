//
//  EventTableViewController.swift
//  MonthlyEvents:PocketPlanner
//
//  Created by Student04 on 2019-06-03.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class EventTableViewController: UITableViewController {

    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = editButtonItem
    
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return events.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCellIdentifier") as? EventTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        
        let event = events[indexPath.row]
        cell.eventNameLabel?.text = event.eventTitle
        cell.dateLabel?.text = event.eventDate
        cell.startTimeLabel?.text = event.startTime
        cell.endTimeEventLabel?.text = event.endTime
        cell.eventDetailsLabel?.text = event.eventDetails
        // Configure the cell...

        return cell
    }
 

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete { //verify the Delete button triggered the method call
            events.remove(at: indexPath.row) //delete the model from the array
            tableView.deleteRows(at: [indexPath], with: .fade) //as well as from the table view
          //  Event.saveTodos(events) //save when user tries to delete an item*
            }
        }
    
    @IBAction func unwindToEventList(segue: UIStoryboardSegue){
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! EventPopoverViewController
        
        if let event = sourceViewController.event {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                events[selectedIndexPath.row] = event
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                
                //add a new todo of the todos array, creating an index path based on how many items are in the array already (if 0, then adds to row 1)
                
                let newIndexPath = IndexPath(row: events.count, section: 0)
                events.append(event)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }




    
    // Override to support rearranging the table view.
 /*   override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
*/

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    }
}
