//
//  Item.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import Foundation
import RealmSwift

class Item : Object {
    @objc dynamic var name = ""
    @objc dynamic var isDone = false
    dynamic var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
