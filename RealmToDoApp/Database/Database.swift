//
//  Database.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import Foundation
import RealmSwift

protocol Database {
    func createCategory(with name: String)
    func getCategories() -> [Category]
    func deleteItem(at place: Int, for category: Category)
    func deleteCategory(category: Category)
}
