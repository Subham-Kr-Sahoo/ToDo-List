//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Subham  on 07/06/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var listviewmodel : ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }.navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listviewmodel)
        }
    }
}
