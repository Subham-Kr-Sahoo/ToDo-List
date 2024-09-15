//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Subham  on 07/06/24.
//

import Foundation

class ListViewModel : ObservableObject{
    @Published var items :[ItemModel] = []{
        didSet{
            SaveItems()
        }
    }
    let itemskey : String = "for_key"
    init(){
        GetItems()
    }
    func GetItems(){
//        let NewItems = [
//            ItemModel(title: "First", isCompleted: false),
//            ItemModel(title: "Second", isCompleted: true),
//            ItemModel(title: "Third", isCompleted: false)
//        ]
//        items.append(contentsOf: NewItems)
        guard let data = UserDefaults.standard.data(forKey: itemskey) else {return}
        guard let SavedItems = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        
        self.items = SavedItems
    }
    func deleteItem(indexset : IndexSet){
        items.remove(atOffsets: indexset)
    }
    func MovingItem(from : IndexSet , to : Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    func addItem(title : String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    func UpdateItem(item : ItemModel){
        if let index = items.firstIndex(where:{$0.id == item.id}){
            items[index] = item.updateCompleted()
        }
    }
    // userdefaults dont know item model so we have to change it to json data then try it
    func SaveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey:itemskey )
        }
    }
}
