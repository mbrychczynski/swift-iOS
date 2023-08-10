//
//  Activities.swift
//  HabitTracking
//
//  Created by Mateusz Brychczynski on 25/04/2023.
//

import Foundation

class Activities: ObservableObject {
    @Published var activites: [Activity] {
        didSet {
            if let encoded = try? JSONEncoder().encode(activites) {
                UserDefaults.standard.set(encoded, forKey: "Activites")
            }
        }
    }
    
    init() {
        if let saved = UserDefaults.standard.data(forKey: "Activites") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: saved) {
                activites = decoded
                return
            }
        }
        activites = []
    }
}
