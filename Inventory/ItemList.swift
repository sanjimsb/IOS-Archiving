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
    
    func addItem(item: Item){
        items.append(item)
        print(items)
        do {
            let encoder = JSONEncoder()
            let encodItems = try encoder.encode(self.items)
            UserDefaults.standard.set(encodItems, forKey: "items")
        } catch {
            print("err")
        }
        
    }
    
    func deleteItem(indexPath: IndexPath){
        items.remove(at: indexPath.row)
        do {
            let encoder = JSONEncoder()
            let encodItems = try encoder.encode(self.items)
            UserDefaults.standard.set(encodItems, forKey: "items")
        } catch {
            print("err")
        }
    }
    
    func moveItem(fromIndexPath: IndexPath, toIndexPath: IndexPath){
        let temp = items[fromIndexPath.row]
        deleteItem(indexPath: fromIndexPath)
        items.insert(temp, at: toIndexPath.row)
    }
}
