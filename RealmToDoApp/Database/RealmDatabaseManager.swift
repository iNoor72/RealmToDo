//
//  RealmDatabaseManager.swift
//  RealmToDoApp
//
//  Created by Noor Walid on 22/08/2021.
//

import Foundation
import RealmSwift

class RealmDatabaseManager: Database {
    static let shared = RealmDatabaseManager()
    private let realm = try! Realm()
    
    private init() {}
    
    func createCategory(with name: String) {
        let category = Category()
        category.name = name
        
        try? realm.write {
            realm.add(category)
        }
    }
    
    func createItem(with name: String) {
        let item = Item()
        item.name = name
        
        try? realm.write {
            realm.add(item)
        }
    }
    
    func getCategories() -> [Category] {
        let result = realm.objects(Category.self)
        let categories:[Category] = result.map {$0}
        return categories
    }
    
    func getItems() -> [Item]{
        let result = realm.objects(Item.self)
        let items:[Item] = result.map {$0}
        return items
    }
    
    func save() {

    }
    
    func update() {
        
    }
    
    func deleteItem(item: Item) {
        realm.delete(item)
    }
    
    func deleteCategory(category: Category) {
        realm.delete(category)
    }
    
    
}
