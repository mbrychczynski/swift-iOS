//
//  FriendfaceApp.swift
//  Friendface
//
//  Created by Mateusz Brychczynski on 04/05/2023.
//

import SwiftUI

@main
struct FriendfaceApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
