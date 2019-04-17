//
//  Inventory.swift
//  Inventory
//
//  Created by Zachary Pierucci on 4/16/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//

import Foundation

struct Inventory: Codable {
    var status: String
    var products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case status
        case products
    }
}

struct Product: Codable {
    var id: Int
    var category: Category
    var title: String
    var price: Double
    var stockedQuantity: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case category
        case title
        case price
        case stockedQuantity
    }
    
    enum Category: String, Codable {
        case computers
        case electronics
        case kitchen
        case pets
    }
}


