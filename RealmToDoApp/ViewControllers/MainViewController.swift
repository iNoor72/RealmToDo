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
    var categoriesArray = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        fetchCategories()
    }

    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "Add new category", message: "Please enter the category name", preferredStyle: .alert) 
        alert.addAction(UIAlertAction(title: "Add", style: .default, handler: {[weak self] _ in
            guard let textfield = alert.textFields?.first else { return }
            
            let categoryName = textfield.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            if !(categoryName.isEmpty) {
                self?.DBManager.createCategory(with: categoryName)
                self?.fetchCategories()
            }
            else {
                let alert = UIAlertController(title: "Invalid naming", message: "We couldn't create a category because the name is incorrect, try again with a valid name.", preferredStyle: .alert)
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
    
    func fetchCategories() {
        categoriesArray = DBManager.getCategories()
        reloadTableView()
    }
    
}

