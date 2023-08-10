//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mateusz Brychczynski on 17/04/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var showingResults = false
    @State private var scoreTitle = ""
    @State private var countries = allCountries.shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var score: Int = 0
    @State private var questionCounter: Int = 1
    @State private var hintShowed = false
    @State private var animationAmount: Double = 0.0
    @State private var selectedFlag = -1
    
    static let allCountries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"]
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.primary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundStyle(.primary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            flagTapped(number)
                            
                        } label: {
                            FlagImage(name: countries[number])
                                .rotation3DEffect(.degrees(selectedFlag == number ? 360 : 0), axis: (x: 0, y: 1, z: 0))
                                .rotation3DEffect(.degrees(selectedFlag == -1 || selectedFlag == number ? 360 : 0), axis: (x: 1, y: 0, z: 0))
                                .scaleEffect(selectedFlag == -1 || selectedFlag == number ? 1 : 0.25)
                                .opacity(selectedFlag == -1 || selectedFlag == number ? 1 : 0.25)
                                .animation(.default, value: selectedFlag)
                                .accessibilityLabel(labels[countries[number]] ?? "Unknown flag")
                        }
                        
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                Button {
                    hintShowed = true
                } label: {
                    Text("Hint")
                }
                .frame(width: 75, height: 44)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(.primary)
                .background(.ultraThinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .alert("Hint",isPresented: $hintShowed) {
                    Button("Thanks", role: .cancel) { }
                } message: {
                    Text("Correct answer is the Flag number:\n\(correctAnswer+1)")
                }
                
                Spacer()
                
                Text("Scorre \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Text("Round number \(questionCounter) of 8")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game over!", isPresented: $showingResults) {
            Button("Start Again", action: newGame)
        } message: {
            Text("Your final score was \(score)")
        }
    }
    func flagTapped(_ number: Int) {
        selectedFlag = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            
        } else {
            let needsThe = ["UK", "US"]
            if needsThe.contains(countries[number]) {
                scoreTitle = "Wrong!\nThat's the flag of the \(countries[number])"
            } else
            {
                scoreTitle = "Wrong!\nThat's the flag of \(countries[number])"
            }
            
        }
        
        if questionCounter == 8 {
            showingResults = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.remove(at: correctAnswer)
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        questionCounter += 1
        selectedFlag = -1
    }
    
    func newGame() {
        questionCounter = 0
        score = 0
        countries = Self.allCountries
        askQuestion()
    }
}

    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
