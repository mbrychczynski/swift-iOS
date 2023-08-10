//
//  GameView.swift
//  Edutainment
//
//  Created by Mateusz Brychczynski on 21/04/2023.
//

import SwiftUI

struct GameView: View {
    @Binding var multiplier: Int
    @State private var randomMultiplier = Int.random(in: 1...12)
    @State private var answer = 0
    @FocusState var answerIsFocused: Bool
    @Binding var chosenNumberOfQuestions: Int
    @State private var round = 1
    @State private var score = 0
    @State private var showingResults = false
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text("\(multiplier) * \(randomMultiplier)")
                } header: {
                    Text("Solve this:")
                }
                .frame(maxWidth: .infinity)
                
                Section {
                    TextField("Answer", value: $answer, format: .number)
                        .keyboardType(.numbersAndPunctuation)
                        .multilineTextAlignment(.center)
                        .focused($answerIsFocused)
                        .onSubmit {
                            checkAnswer()
                        }
                        
                    
                } header: {
                    Text("Answer is:")
                }
                .frame(maxWidth: .infinity)
                
                Button("Check") {
                    checkAnswer()
                }
                .frame(maxWidth: .infinity)
                .listRowSeparator(.hidden)
                HStack {
                    Text("Point: \(score)")
                    Spacer()
                    Text("Round: \(round)/\(chosenNumberOfQuestions)")
                }
                .navigationTitle("Edutainment")
            }
            
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        answerIsFocused = false
                    }
                }
            }
            .alert("You've finised gamge", isPresented: $showingResults) {
                Button("Start again", action: restartGame)
            } message: {
                Text("Your final score was \(score)")
            }
        }
    }
    func checkAnswer() {
        if multiplier * randomMultiplier == answer {
            score += 1
            round += 1
        } else {
            round += 1
        }
        
        randomMultiplier = Int.random(in: 1...12)
        
        if round - 1 == chosenNumberOfQuestions {
            showingResults = true
        }
        
        answer = 0
    }
    
    func restartGame() {
        score = 0
        round = 1
        answer = 0
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(multiplier: .constant(2), chosenNumberOfQuestions: .constant(5))
    }
}
