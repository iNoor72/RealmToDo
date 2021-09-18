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
    
    private init() {
        print(realm.configuration.fileURL)
    }
    
    func createCategory(with name: String) {
        let category = Category()
        category.name = name
        
        try? realm.write {
            realm.add(category)
        }
        
    }
    
    func updateCategory(name: String, category:Category) {
        let item = Item()
        item.name = name
        
        try? realm.write{
            category.items.append(item)
        }
    }
    
    func getCategories() -> [Category] {
        let result = realm.objects(Category.self)
        let categories:[Category] = result.map {$0}
        return categories
    }
    
    func getItems(for category: Category) -> [Item]{
        let items: [Item] = category.items.map {$0}
        return items
    }
    
    func deleteItem(at place: Int, for category: Category) {
        try? realm.write {
            category.items.remove(at: place)
        }
    }
    
    func deleteCategory(category: Category) {
        try? realm.write{
            realm.delete(category)
        }
    }
}
