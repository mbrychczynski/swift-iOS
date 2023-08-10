//
//  Activity.swift
//  HabitTracking
//
//  Created by Mateusz Brychczynski on 25/04/2023.
//

import Foundation

struct Activity: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var type: String
    var completionCount = 0
    var target: Int
    var lengthOfHabit: String
    
    static let example = Activity(title: "Example habit", description: "Description of example habit", type: "Hobby", target: 100, lengthOfHabit: "Days")
}
