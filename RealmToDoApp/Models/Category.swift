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
    var items = List<Item>()
    
    }
