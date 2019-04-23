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
    }
    
    //array needed for titles? and array needed for emoji instances?
    var emojis = [ //array of an array in order to create multiple sections
        [Emoji(symbol: "😀", name: "Grinning Face",
              description: "A typical smiley face.", usage: "happiness"),
        Emoji(symbol: "😕", name: "Confused Face", description: "A confused, puzzled face.", usage: "unsure what to think; displeasure,"),
        Emoji(symbol: "😍", name: "Heart Eyes", description: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
        Emoji(symbol: "👮", name: "Police Officer", description: "A police officer wearing a blue cap with a gold badge.", usage: "person of authority")],
        [Emoji(symbol: "🐢", name: "Turtle", description: "A cute turtle.", usage: "Something slow"),
        Emoji(symbol: "🐘", name: "Elephant", description: "A gray elephant.", usage: "good memory")],
        [Emoji(symbol: "🍝", name: "Spaghetti", description: "A plate of spaghetti.", usage: "spaghetti")],
        [Emoji(symbol: "🎲", name: "Die", description: "A single die.", usage: "taking a risk, chance; game"),
        Emoji(symbol: "⛺️", name: "Tent", description: "A small tent.", usage: "camping"),
        Emoji(symbol: "📚", name: "Stack of Books", description: "Three colored books stacked on each other.", usage: "homework, studying")],
        [Emoji(symbol: "💔", name: "Broken Heart", description: "A red, broken heart.", usage: "extreme sadness"), Emoji(symbol: "💤", name: "Snore", description: "Three blue \'z\'s.", usage: "tired, sleepiness"),
        Emoji(symbol: "🏁", name: "Checkered Flag", description: "A black-and-white checkered flag.", usage: "completion")]
    ]
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return emojis.count //tells how many sections the table view has
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //tells how many rows are in each section for the table view
            return emojis[section].count //create a section for each array of type of emojis
//returns the count of the emojis as each of the rows for the section
      
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {  //indexPath has two properties to access cell address: section and row

        //deques a cell from root table view indentifer, in order to remove/add cell when scrolled
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)

        let emoji: Emoji = emojis[indexPath.section][indexPath.row] //using indexPath property of row, able to get correct array index required to retrieve the correct Emoji
        
        //configure cell with information:
        cell.textLabel?.text = "\(emoji.symbol) - \(emoji.name)" //updates the cell's label, taking the Emoji symbol and name into a string for the emoji
        cell.detailTextLabel?.text = emoji.description //below the label, includes the Emoji description for the correct emoji
        
        //UITableView class defines property showReorderControl, when true, table is in editing mode and data source method moveRowAtto is implemented
        cell.showsReorderControl = true
        
        return cell //returns the configured cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.section][indexPath.row]
        print("\(emoji.symbol) \(indexPath)") //as rows are selected, console prints out message
    }
    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row) //remove data within emojis fromIndexPath.row and add it back to.row
        emojis.insert(movedEmoji, at: to.row)
        
        tableView.reloadData() //reload data for table view with updated changes
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .none //removes delete indicator when in editing mode
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let emoji = emojis[section][0]
        return emoji
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData() //whenever view loads, reloads data to update view with table view
    }

    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
