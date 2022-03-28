//
//  DetailsViewController.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import UIKit

class DetailsViewController: UIViewController {

    var itemList : ItemList = ItemList()
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var SKUField: UITextField!
    @IBOutlet weak var descField: UITextField!
    @IBOutlet weak var dateField: UIDatePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let getName = nameField.text else { return }
        guard let getSKU = SKUField.text else { return }
        guard let getDesc = descField.text else { return }
        let getDate = dateField.date

        let updateModel = Item(name: getName, SKU: getSKU, description: getDesc, dateAdded: getDate)
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
