//
//  Favorites.swift
//  SnowSeeker
//
//  Created by Mateusz Brychczynski on 23/06/2023.
//

import SwiftUI

class Favorites: ObservableObject {
//    the actual resorts the user has favorited
    private var resorts: Set<String>
    
//    the key we're using to read/write in UserDefaults
    private let saveKey = "Favorites"
    
    init() {
//        load our saved data
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                resorts = decoded
            }
        }
        
//        still here? Use an empty arrat
        resorts = []
    }
    
//    returns true if our set contains this resort
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
//    adds the resort to our set, updates all views, and saves the change
    func add(_ resort: Resort) {
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
//    removes the resort form our set, updates all views, and saves the change
    func remove(_ resort: Resort) {
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(resorts) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
        
    }
}
