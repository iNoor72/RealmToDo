//
//  Category.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import Foundation
import RealmSwift

class Category : Object {
    @objc dynamic var name = ""
    let items = List<Item>()
    
    override class func primaryKey() -> String? {
        return "name"
    }
}
