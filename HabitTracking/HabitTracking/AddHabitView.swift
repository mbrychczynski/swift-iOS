//
//  AddHabitView.swift
//  HabitTracking
//
//  Created by Mateusz Brychczynski on 25/04/2023.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var data: Activities
    @State private var title = ""
    @State private var decription = ""
    @State private var type = "Education"
    @State private var completionCount = 0
    @State private var target = 0
    @State private var lengthOfHabit = "Hours"
    
    let types = ["Education", "Health", "Hobby", "Business"]
    
    let lengthOfHabits = ["Hours", "Days"]
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                }
                Section {
                    TextField("Decription", text: $decription, axis: .vertical)
                        .lineLimit(2...4)
                }
                Section {
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Stepper("\(target) \(lengthOfHabit)", value: $target)
                    Picker("lengthOfHabit", selection: $lengthOfHabit) {
                        ForEach(lengthOfHabits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                .listRowSeparator(.hidden)
                
                
            }
            .navigationTitle("Add new habit")
            .toolbar {
                Button("Save") {
                    let trimmedTitile = title.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitile.isEmpty == false else { return }
                    
                    let activity = Activity(title: trimmedTitile, description: decription, type: type, completionCount: completionCount, target: target, lengthOfHabit: lengthOfHabit)
                    data.activites.append(activity)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabitView_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(data: Activities())
    }
}
