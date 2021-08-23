//
//  Database.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import Foundation

protocol Database {
    func createCategory(with name: String)
    func createItem(with name: String)
    func save()
    func update()
    func deleteItem(item: Item)
    func deleteCategory(category: Category)
}
