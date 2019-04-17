//
//  InventoryLoader.swift
//  Inventory
//
//  Created by Zachary Pierucci on 4/16/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//

import Foundation

class InventoryLoader {
    
    class func load(jsonFileName: String) -> Inventory? {
        var inventory: Inventory?
        let jsonDecoder = JSONDecoder()
        
        if let jsonFileUrl = Bundle.main.url(forResource: jsonFileName, withExtension: ".json"),
            let jsonData = try? Data(contentsOf: jsonFileUrl) {
            inventory = try? jsonDecoder.decode(Inventory.self, from: jsonData)
        }
        
        return inventory
    }
}
