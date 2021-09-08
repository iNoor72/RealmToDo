//
//  ItemsViewController.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import UIKit
import RealmSwift

class ItemsViewController: UIViewController {
    
    var category : Category?
    let DBManager = RealmDatabaseManager.shared

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.title = category?.name ?? "Items"
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector (addItems))
        navigationItem.rightBarButtonItem = addButton
        fetchItems()
    }
    
    @objc func addItems() {
        let alert = UIAlertController(title: "Add new Item", message: "Please enter the item", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {[weak self] _ in
            guard let textfield = alert.textFields?.first else { return }
            
            let itemName = textfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            if !(itemName.isEmpty) {
                self?.DBManager.createItem(with: itemName)
                self?.fetchItems()
            }
            else {
                let alert = UIAlertController(title: "Invalid naming", message: "We couldn't create an item because the name is incorrect, try again with a valid name.", preferredStyle: .alert)
                let action = UIAlertAction(title: "Close", style: .cancel, handler: nil)
                alert.addAction(action)
                self?.present(alert, animated: true)
            }
        }))
        alert.addTextField(configurationHandler: nil)
        present(alert, animated: true)
    }
    
    func reloadTableView(){
        DispatchQueue.main.async {[weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func fetchItems() {
        guard let category = category else {return}
        let items = DBManager.getItems()
        var itemsList = List<Item>()
//        itemsList = items.map { $0 }
        for item in items {
            itemsList.append(item)
        }
        category.items = itemsList
        reloadTableView()
    }

}
