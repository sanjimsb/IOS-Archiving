//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {

    var itemList : ItemList = ItemList()
    var currentCell : Int?
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let getRow = currentCell else { return }
        
        // updating the text fields and date fields based on the stored list
        nameField.text = itemList.items[getRow].name
        SKUField.text = itemList.items[getRow].SKU
        descField.text = itemList.items[getRow].desc
        print(itemList.items[getRow].dateAdded!)
        dateField.setDate(itemList.items[getRow].dateAdded!, animated: true)
        
    }
    
    // Triggers when save button is clicked, calls the method name addItem
    @IBAction func save(_ sender: Any) {
        
        guard let getName = nameField.text else { return }
        guard let getSKU = SKUField.text else { return }
        guard let getDesc = descField.text else { return }
        let getDate = dateField.date
        
        let updateModel = Item(name: getName, SKU: getSKU, desc: getDesc, dateAdded: getDate)
        itemList.addItem(item: updateModel)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
