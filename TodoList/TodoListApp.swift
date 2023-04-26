//
//  TodoListApp.swift
//  TodoList
//
//  Created by M.Huzaifa on 19/04/2023.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - Data point
 View - UI
 ViewModel - Mangaes models for View
 
 */

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(.stack)
            .environmentObject(ListViewModel())
        }
    }
}
