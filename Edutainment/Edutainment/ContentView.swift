//
//  ContentView.swift
//  Edutainment
//
//  Created by Mateusz Brychczynski on 21/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var chosenNumberOfQuestions = 5
    @State private var multiplier = 2
//    @FocusState private var answerIsFocused: Bool
    let numberOfQuestions = [5, 10, 20]
//    @State private var round = 1
//    @State private var score = 0
    
    
    var body: some View {
            NavigationView {
                    Form {
                        multiplicationTables
                        questionPicker
//                        Spacer()
//                            .frame(height: 200)
//                            .listRowBackground(Color.clear)
//                            .listRowSeparator(.hidden)
                        buttonStartGame
                            .listRowBackground(Color.clear)
                        
                    } 
                    
                    .navigationTitle("Edutainment")
                    
                
            }
        
    }
    
    var buttonStartGame: some View {
        NavigationLink(destination: GameView(multiplier: $multiplier, chosenNumberOfQuestions: $chosenNumberOfQuestions)) {
            Text("Start game")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundColor(.white)
                .background(.red)
                .clipShape(RoundedRectangle(cornerRadius: 30))
        }
    }
    
    var questionPicker: some View {
        Section {
            VStack{
                Picker("How many questions?", selection: $chosenNumberOfQuestions) {
                    ForEach(numberOfQuestions, id: \.self) {
                        Text($0, format: .number)
                    }
                }
                .pickerStyle(.segmented)
            }
            
        } header: {
            Text("How many questions?")
        }
    }
    
    var multiplicationTables : some View {
        Section {
            Stepper("\(multiplier)", value: $multiplier, in: 2...12)
        } header: {
            Text("Multiplication Tables")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
