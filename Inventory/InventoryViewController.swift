//
//  InventoryViewController.swift
//  Inventory
//
//  Created by Zachary Pierucci on 4/16/19.
//  Copyright © 2019 Zachary Pierucci. All rights reserved.
//

import UIKit

class InventoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var inventoryTableView: UITableView!
    
    let jsonFileName = "invent"
    
    var inventoryArray: [Product] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let inventory = InventoryLoader.load(jsonFileName: jsonFileName) {
            for item in inventory.products {
                let newProduct = Product(id: item.id, category: item.category, title: item.title, price: item.price, stockedQuantity: item.stockedQuantity )
                inventoryArray.append(newProduct)
            }
        } else {
            print("JSON Loading Error")
        }

        inventoryTableView.dataSource = self
        inventoryTableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return inventoryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let inv = inventoryArray[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = inv.title
        cell.detailTextLabel?.text = String(inv.stockedQuantity)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProductViewController,
            let row = inventoryTableView.indexPathForSelectedRow?.row {
            destination.product = inventoryArray[row]
        }
    }


}
