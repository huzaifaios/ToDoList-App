//
//  ListViewModel.swift
//  TodoList
//
//  Created by M.Huzaifa on 19/04/2023.
//

import Foundation

/*
 CRUD Functions
 
 C - Create the items
 R - Add the items
 U - Update the items
 D - Delete the items
 
 */



class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemKey: String = "items_key"
    
    init() {
        addItems()
    }
    
    func addItems() {
//        let newItems = [
//            ItemModel(title: "This is the first title!", isCompleted: false),
//            ItemModel(title: "This is the second!", isCompleted: false),
//            ItemModel(title: "Third!", isCompleted: true),
//        ]
//
//        items.append(contentsOf: newItems)
        
        guard
            let data = UserDefaults.standard.data(forKey: itemKey),
            let decodedData = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = decodedData
    }
    
    func deleteItem(IndexSet: IndexSet){
        items.remove(atOffsets: IndexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateCheckmark(item: ItemModel) {
//       if let index = items.firstIndex { existingItem in
//            return existingItem.id == item.id
//       } {
//
//       }
        if let indexofItemModel = items.firstIndex(where: { $0.id == item.id }) {
//            items[indexofItemModel] = ItemModel(title: item.title, isCompleted: !item.isCompleted)
            items[indexofItemModel] = item.updateCompletion()
        }
    }
    
    func saveItems() {
        
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
}
