//
//  ItemList.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class ItemList{
    var items = [Item]()
    var userDefaults = UserDefaults()
    
    // appends Item instance into the list and call saveItems function
    func addItem(item: Item){
        print(items)
        var indexPath : IndexPath?
        var isUpdate = false
        var updateIndex : Int?
        for (index, element) in items.enumerated() {
            if(element.SKU == item.SKU) {
                indexPath = IndexPath(row: index, section: 0)
                updateIndex = index
                isUpdate = true
                break;
                
            }
        }
        if(isUpdate == true) {
            deleteItem(indexPath: indexPath!)
            items.insert(item, at: updateIndex!)
        } else {
            items.append(item)
        }
        saveItems()
    }
    
    // deleteItem from the indexPath provided and calls saveItems function
    func deleteItem(indexPath: IndexPath){
        items.remove(at: indexPath.row)
        saveItems()
    }
    
    // moveItem from the provided IndexPath to provided IndexPath and calls saveItems function
    func moveItem(fromIndexPath: IndexPath, toIndexPath: IndexPath){
        let temp = items[fromIndexPath.row]
        deleteItem(indexPath: fromIndexPath)
        items.insert(temp, at: toIndexPath.row)
        saveItems()
    }
    
    // Stores the items value in a UserDefaults
    func saveItems() {
        do {
            let encoder = JSONEncoder()
            let encodItems = try encoder.encode(self.items)
            UserDefaults.standard.set(encodItems, forKey: "items")
        } catch {
            print("err")
        }
    }
}
