//
//  ActivityView.swift
//  HabitTracking
//
//  Created by Mateusz Brychczynski on 26/04/2023.
//

import SwiftUI

struct ActivityView: View {
    @ObservedObject var data: Activities
    var activity: Activity
    
    var body: some View {
        List {
            Section("Description") {
                if activity.description.isEmpty == false {
                    Text(activity.description)
                        .lineLimit(2...4)
                }
            }
            Section {
                Gauge(value: Double(activity.completionCount), in: 0...Double(activity.target)) {
                    Text("\(activity.completionCount)")
                } currentValueLabel: {
                    Text("\(activity.completionCount)")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("\(activity.target)")
                }
                .gaugeStyle(.accessoryCircular)
                .tint(color(for: activity))
                .scaleEffect(3)
            }
            .frame(height: 200)
            .frame(maxWidth: .infinity)
            Section("Completion count: \(activity.completionCount)") {
                Button("Mark Completed") {
                    var newActivity = activity
                    newActivity.completionCount += 1
                    
                    if let index = data.activites.firstIndex(of: activity) {
                        data.activites[index] = newActivity
                    }
                }
            }
            .listRowSeparator(.hidden)
        }
        .navigationTitle(activity.title)
    }
    
    func color(for activity: Activity) -> Color {
        switch activity.completionCount {
        case 0...3: return .red
        case 4...15: return .orange
        case 16...49: return .teal
        case 50...100: return .green
        default: return .mint
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(data: Activities(), activity: Activity.example)
    }
}
