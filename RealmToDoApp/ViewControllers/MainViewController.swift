//
//  ViewController.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let DBManager = RealmDatabaseManager.shared
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
    }

    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        //Add some code to add a new Category
        var categoryName = ""
        let alert = UIAlertController(title: "Add new category", message: "Please enter the category name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: { _ in
            guard let textfield = alert.textFields?.first else { return }
            categoryName = textfield.text!
            print(categoryName)
        }))
        alert.addTextField(configurationHandler: nil)
        present(alert, animated: true)
        
        if !(categoryName.isEmpty) {
            let safeCategoryName = categoryName.trimmingCharacters(in: .whitespacesAndNewlines)
            if !(safeCategoryName.isEmpty) {
                DBManager.createCategory(with: safeCategoryName)
            }
            tableView.reloadData()
        }else {
            let alert = UIAlertController(title: "Invalid naming", message: "We couldn't create a category because the name is incorrect, try again with a valid name.", preferredStyle: .alert)
            present(alert, animated: true)
        }
        
    }
    
}

