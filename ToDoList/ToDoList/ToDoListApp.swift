//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Mateusz Brychczynski on 16/06/2023.
//

import SwiftUI

/*
 MVVM Architecture
 */

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
        }
    }
}
