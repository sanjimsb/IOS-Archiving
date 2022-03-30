//
//  Item.swift
//  Inventory
//
//  Created by Cambrian on 2022-03-23.
//

import Foundation

class Item: Encodable, Decodable{
    var name: String?
    var SKU: String?
    var desc: String?
    var dateAdded: Date?

    // initializes the variables
    init(name: String, SKU: String, desc: String, dateAdded: Date){
        self.name = name
        self.SKU = SKU
        self.desc = desc
        self.dateAdded = dateAdded
    }
}
