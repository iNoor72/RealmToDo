//
//  ItemsViewController.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import UIKit

class ItemsViewController: UIViewController {
    
    var category : Category?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = category?.name ?? "Items"
    }

}
