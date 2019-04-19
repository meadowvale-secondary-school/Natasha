//
//  EmojiTableTableViewController.swift
//  EmojiDictionary
//
//  Created by Student04 on 2019-04-14.
//  Copyright © 2019 Student04. All rights reserved.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        //displays an Edit button in the navigation bar for this view controller (already defined Edit button)
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        //tell table view needs to calculate cell height, and estimation of how tall it will be 
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44.0
    }
    var emojis: [Emoji] = [
        Emoji(symbol: "😀", name: "Grinning Face",
              description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure,"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority"),
        Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory"),
        Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti"),
        Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying"),
        Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")
    ]
  
    // MARK: - Table view data source

  /* not needed, if only one section, assumed that there is only one if function not included 
     override func numberOfSections(in tableView: UITableView) -> Int {
        return 0 //tells how many sections the table view has
    } */

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tells how many rows are in each section for the table view
        if section == 0 {
            return emojis.count
        } else {
            return 0
        } //only one section group
//returns the count of the emojis as each of the rows for the section
      
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {     //indexPath has two properties to access cell address: section and row

        //STEP 1: Dequeue the cell
        //deques a cell from root table view indentifer, in order to remove/add cell when scrolled
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath) as! EmojiTableViewCell //need to downcast the cell in order to retrieve from EmojiTableViewCell to use update(with:)

        //STEP 2: fetch model object to display
        let emoji = emojis[indexPath.row] //using indexPath property of row, able to get correct array index required to retrieve the correct Emoji

        //STEP 3: Configure cell
        //updates how the cell is configured
        cell.update(with: emoji)

        //UITableView class defines property showReorderControl, when true, table is in editing mode and data source method moveRowAtto is implemented
        cell.showsReorderControl = true
        
        //STEP 4: Return cell
        return cell //returns the configured cell
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row) //remove data within emojis fromIndexPath.row and add it back to.row
        emojis.insert(movedEmoji, at: to.row)
        
        tableView.reloadData() //reload data for table view with updated changes
    }
    
    //indicators when in editing mode for either .insert, .delete, or .none controls
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete //includes delete indicator when in editing mode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData() //whenever view loads, reloads data to update view with table view
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row) //able to remove emoji at selected indexPath row
            tableView.deleteRows(at: [indexPath], with: .automatic) //deletes row, using an UITableViewRowAnimation enum 
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
            }
            
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EditEmoji" { //checks the identifer
            let indexPath = tableView.indexPathForSelectedRow!
            let emoji = emojis[indexPath.row]
            let navController = segue.destination as! UINavigationController //access the destination UINavigation
            
            let addEditEmojiTableViewController = navController.topViewController as! AddEditEmojiTableViewController //downcast it's top view controller
            //access the objects to pass, then assigns the properties
            addEditEmojiTableViewController.emoji = emoji
            
        }
    }
    //unwinds the bar buttons for the static view back to the inital root view controller, Emoji Table View
    @IBAction func unwindToEmojiTableView(segue: UIStoryboardSegue){
        
        //verify saveUnwind was triggered
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! AddEditEmojiTableViewController
        
        //check to see if the table view still has a selected row
        if let emoji = sourceViewController.emoji { //in unwinding after after editing a particular emoji from addEditTableViewController
            if let selectedIndexPath = tableView.indexPathForSelectedRow { //undwind after editing particular emoji
                emojis[selectedIndexPath.row] = emoji //emoji instance selected
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else { //new emoji is being created
                let newIndexPath = IndexPath(row: emojis.count, section: 0) //calcuate index path for new row
                emojis.append(emoji) //add item to end of collection
                tableView.insertRows(at: [newIndexPath], with: .automatic) //update table view by inserting new index path for new emoji
                
            }
        }
    }
}
