//
//  ContentView.swift
//  Rock, Paper, Scissors
//
//  Created by Brashan Mohanakumar on 2023-11-04.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["Rock", "Paper", "Scissors"]
    @State private var shouldWin = true
    @State private var randomInt = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
    @State private var questions = 0
    @State private var gameOver = false
    
    
    var body: some View {
        ZStack {
            Color
                .blue
                .ignoresSafeArea()
            VStack {
                Text("Rock, Paper, Scissors!")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .bold()
                Spacer()
                VStack {
                    Text("Computer chooses...")
                        .foregroundStyle(.white)
                        .font(.title3)
                        .bold()
                    Text(options[randomInt])
                        .foregroundStyle(.white)
                        .font(.largeTitle)
                        .bold()
                    Text("Which would you need to \(shouldWin ? "win" : "lose")?")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                        .multilineTextAlignment(.center)
                    
                    ForEach(0..<3) { number in
                        Button {
                            moveMade(number)
                        } label: {
                            Image(options[number])
                                .resizable()
                                .clipShape(.rect)
                                .shadow(radius: 5)
                                .cornerRadius(15)
                                .frame(width: 175, height: 175)
                        }
                    }
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is \(score)")
        }
        .alert("Game Over", isPresented: $gameOver) {
            Button("Continue", action: resetGame)
        } message: {
            Text("Final Score is \(score)")
        }
    }
    
    func askQuestion() {
        randomInt = Int.random(in: 0...2)
    }
    
    func moveMade(_ number: Int) {
        let correctAnswer = options[randomInt]
        if (correctAnswer == "Rock") {
            if shouldWin {
                if (options[number] == "Paper") {
                    scoreTitle = "Correct"
                    score = score + 1
                }
                else {
                    scoreTitle = "Wrong"
                }
            }
            else {
                if (options[number] == "Scissors") {
                    scoreTitle = "Correct"
                    score = score + 1
                }
                else {
                    scoreTitle = "Wrong"
                }
            }
        }
        else if (correctAnswer == "Paper") {
            if shouldWin {
                if (options[number] == "Scissors") {
                    scoreTitle = "Correct"
                    score = score + 1
                }
                else {
                    scoreTitle = "Wrong"
                }
            }
            else {
                if (options[number] == "Rock") {
                    scoreTitle = "Correct"
                    score = score + 1
                }
                else {
                    scoreTitle = "Wrong"
                }
            }
        }
        else {
            if shouldWin {
                if (options[number] == "Rock") {
                    scoreTitle = "Correct"
                    score = score + 1
                }
                else {
                    scoreTitle = "Wrong"
                }
            }
            else {
                if (options[number] == "Paper") {
                    scoreTitle = "Correct"
                    score = score + 1
                }
                else {
                    scoreTitle = "Wrong"
                }
            }
        }
        showingScore = true
        questions = questions + 1
        shouldWin.toggle()
        if questions == 10 {
            gameOver = true
        }
    }
    
    func resetGame() {
        score = 0
        questions = 0
    }
}

#Preview {
    ContentView()
}
