import UIKit

protocol SelectRoomTypeTableViewControllerDelegate {
    func didSelect(roomType: RoomType) //defines a function implemented by the main view controller (another class)
}

class SelectRoomTypeTableViewController: UITableViewController {
    var delegate: SelectRoomTypeTableViewControllerDelegate? //prop to reference to implementing instance

    //respond to user's selection of room type
    var roomType: RoomType?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warrning Incomplete implementation, return the number of rows
        return RoomType.all.count //have to have array under RoomType
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RoomTypeCell", for: indexPath)
            let roomType = RoomType.all[indexPath.row] //fetch model object to display
        
        //configure the cell
            cell.textLabel?.text = roomType.name
            cell.detailTextLabel?.text = "$\(roomType.price)"
        
        if roomType == self.roomType {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) //remove grey highlight
        roomType = RoomType.all[indexPath.row] //set the room type to the room that corresponds to the index path
        tableView.reloadData() //reload the table view
        delegate?.didSelect(roomType: roomType!) //can call delegate method and add call 
        tableView.reloadData()
    }

}
