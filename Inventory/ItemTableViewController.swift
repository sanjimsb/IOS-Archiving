//
//  ItemTableViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class ItemTableViewController: UITableViewController {

    var itemList: ItemList = ItemList()
    var userDefaults = UserDefaults()
    var tableCell: Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        if let getSavedItems = UserDefaults.standard.data(forKey: "items") {
            print(getSavedItems)
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                let decodedItems = try decoder.decode([Item].self, from: getSavedItems)
                for i in decodedItems {
                    itemList.addItem(item: i)
                }
            } catch {
                print("Unable to Decode Items (\(error))")
            }
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let keys = itemList.items.count
        print(itemList.items.count)
        return keys
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath)
        let getItem = itemList.items[indexPath.row]
        cell.textLabel?.text  = getItem.name
        // Configure the cell...

        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            itemList.deleteItem(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        itemList.moveItem(fromIndexPath: fromIndexPath, toIndexPath: to)
    }

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        self.tableCell = nil
        if let indexPath = self.tableView.indexPathForSelectedRow {
                self.tableCell = indexPath.row
        }
        let dst = segue.destination as! DetailsViewController
        dst.itemList = self.itemList
        dst.currentCell = self.tableCell
    }

}
