//
//  ViewController.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let DBManager = RealmDatabaseManager()
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        super.viewDidLoad()
    }

    @IBAction func addCategory(_ sender: UIBarButtonItem) {
        //Add some code to add a new Category
    }
    
}

