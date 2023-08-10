//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Mateusz Brychczynski on 19/04/2023.
//

import SwiftUI




struct ContentView: View {
    @State private var botPick = Int.random(in: 0..<3)
    @State private var score: Int = 0
    @State private var questionCount = 1
    @State private var showingResults = false
    @State private var scoreTitle = ""
    @State private var botGraphic = "?"
    
    
    let moves = ["👊🏻", "🖐🏻", "✌🏻"]
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.indigo,.mint]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                
                HStack {
                    Text("Score: \(score)")
                    Spacer()
                    Text("Round: \(questionCount) / 10")
                }
                .padding()
                .frame(alignment: .top)
                Spacer()
                Group {
                    Text("Rock, Paper, Scissors Game")
                    Text("Your move")
                }
                .font(.title)
                
                
                HStack {
                    ForEach(0..<3) { number in
                        Button {
                            play(choice: number)
                        } label: {
                            Text(moves[number])
                                .emojiStyle()
                        }
                    }
                }
                
                Text("Bot Pick")
                    .font(.title)
                    .padding(.top, 40)
                Text(botGraphic)
                    .emojiStyle()
                
                Spacer()
                
                Text(scoreTitle)
                    .foregroundColor(.primary)
                    .frame(width: 100, height: 50)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .blur(radius: scoreTitle.isEmpty ? 100 : 0)
                
                Spacer()
                
                Button {
                    reset()
                } label: {
                    Text("Reset game")
                        .frame(width: 150, height: 70)
                        .foregroundColor(.primary)
                        .fontWeight(.bold)
                        .background(.thinMaterial)
                        .clipShape(RoundedRectangle(cornerRadius: 30))
                }
                
            }
            .alert("Game over", isPresented: $showingResults) {
                Button("Play again!", action: reset)
            } message: {
                Text("Your score was \(score)")
            }
        }
    }
    
    func play(choice: Int) {
        botGraphic = moves[botPick]
        if choice == botPick {
            scoreTitle = "TIE!"
        } else if choice == 0 && botPick == 2 ||
                    choice == 1 && botPick == 0 ||
                    choice == 2 && botPick == 1 {
            score += 1
            scoreTitle = "WIN!"
        } else {
            scoreTitle = "LOSE!"
        }
        
        if questionCount == 10 {
            showingResults = true
        } else {
            botPick = Int.random(in: 0..<3)
            questionCount += 1
        }
    }
    
    func reset() {
        botGraphic = "?"
        scoreTitle = ""
        botPick = Int.random(in: 0..<3)
        questionCount = 1
        score = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
