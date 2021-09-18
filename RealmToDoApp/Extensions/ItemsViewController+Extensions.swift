//
//  ItemsViewController+Extensions.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 07/09/2021.
//

import UIKit

extension ItemsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category?.items.count ?? 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellID, for: indexPath)
        cell.textLabel?.text = category?.items[indexPath.row].name ?? "Error fetching"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if (category != nil) {
                DBManager.deleteItem(at: indexPath.row, for: category!)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        }
    }
    
}

