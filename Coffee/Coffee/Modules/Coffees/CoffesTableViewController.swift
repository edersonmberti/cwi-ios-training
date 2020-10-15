//
//  CoffesTableViewController.swift
//  Coffee
//
//  Created by Ederson Machado on 15/10/20.
//

import UIKit

class CoffeesTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        "Section \(section)"
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "coffee-cell", for: indexPath)
        
        cell.textLabel?.text = "Indix \(indexPath.row)"
        
        return cell
    }
    
}
