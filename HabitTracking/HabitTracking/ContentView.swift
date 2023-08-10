//
//  ContentView.swift
//  HabitTracking
//
//  Created by Mateusz Brychczynski on 25/04/2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var data = Activities()
    var activity: Activity
    @State var loading = 0.0
    @State var showingAddHabit = false
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])
    
    
    var body: some View {
        ZStack {
            NavigationStack {
                List(data.activites) { activity in
                    Section {
                        NavigationLink {
                            ActivityView(data: data, activity: activity)
                        } label: {
                            HStack {
                                Image(systemName: passStringName(type: activity.type))
                                    .resizable()
                                    .frame(width: 44, height: 44)
                                Text(activity.title)
                                    .frame(maxWidth: .infinity)
                                    
                                Spacer()
                                Gauge(value: Double(activity.completionCount), in: 0...Double(activity.target)) {
                                    Text("\(activity.completionCount)")
                                }
                                .gaugeStyle(.accessoryCircularCapacity)
                                .tint(color(for: activity))
                                .frame(width: 44, height: 44)
                            }
                        }
                    }
                    
                }
                
                .navigationTitle("HabitTracker")
                .toolbar {
                    ToolbarItemGroup(placement: .bottomBar) {
                        Spacer()
                        customMenu
                    }
                }
                .sheet(isPresented: $showingAddHabit) {
                    AddHabitView(data: data)
                }
            }
        }
    }
    
    var customMenu: some View {
        HStack {
            Menu {
                Button {
                    showingAddHabit = true
                } label: {
                    Label("Add habit", systemImage: "plus")
                }
            } label: {
                Image(systemName: "ellipsis")
            }
        }
    }
    
    func passStringName(type: String) -> String {
        switch type {
        case "Education": return "book.circle"
        case "Health": return "heart.circle"
        case "Hobby": return "pawprint.circle"
        case "Business": return "creditcard.circle"
        default:
            return "questionmark.circle"
        }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(activity: Activity.example)
    }
}
