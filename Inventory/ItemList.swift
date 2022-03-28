//
//  ItemList.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class ItemList{
    var items = [Item]()
    
    func addItem(item: Item){
        print("test2")
        items.append(item)
        print(items)
    }
    
    func deleteItem(indexPath: IndexPath){
        items.remove(at: indexPath.row)
    }
    
    func moveItem(fromIndexPath: IndexPath, toIndexPath: IndexPath){
        let temp = items[fromIndexPath.row]
        deleteItem(indexPath: fromIndexPath)
        items.insert(temp, at: toIndexPath.row)
    }
    
}
