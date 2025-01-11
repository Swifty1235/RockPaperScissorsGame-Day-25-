//
//  ContentView.swift
//  RockPaperScissorsGame (Day 25)
//
//  Created by Pedro Romero on 1/11/25.
//

import SwiftUI

struct ContentView: View {
    let moves = ["Rock", "Paper", "Scissors"]
    
    @State private var playerScore = 0
    @State private var computerScore = 0
    @State private var round = 1
    @State private var gameOver = false
    @State private var computerMove = ""
    @State private var roundResult = ""
    
    var body: some View {
        VStack {
            Text("ROCK PAPER SCISSORS GAME!!")
                .font(.system(size: 40, weight: .bold))
                .foregroundColor(.green)
            
            // Display scores and rounds
            HStack {
                Text("Player: \(playerScore)")
                    .font(.title2)
                Spacer()
                Text("Computer: \(computerScore)")
                    .font(.title2)
            }
            .padding()
            
            Text("Round \(round)/10")
                .font(.headline)
                .padding()
            
            // Show computer's move
            if !computerMove.isEmpty {
                Text("Computer chose: \(computerMove)")
                    .font(.title2)
                    .padding()
            }
            
            // Show result of the round
            if !roundResult.isEmpty {
                Text(roundResult)
                    .font(.headline)
                    .foregroundColor(roundResult == "You Win!" ? .green : .red)
                    .padding()
            }
            
            Spacer()
            
            // Buttons for player moves
            if !gameOver {
                ForEach(moves, id: \.self) { move in
                    Button(action: {
                        playRound(playerMove: move)
                    }) {
                        Text(move)
                            .font(.title)
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                    }
                }
            } else {
                // Show final message and restart button
                Text(playerScore > computerScore ? "You Win the Game! 🎉" : "You Lose the Game! 😢")
                    .font(.largeTitle)
                    .foregroundColor(playerScore > computerScore ? .green : .red)
                    .padding()
                
                Button("Restart Game") {
                    restartGame()
                }
                .font(.title2)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            Spacer()
        }
        .padding()
    }
    
    func playRound(playerMove: String) {
        computerMove = moves.randomElement() ?? "Rock"
        
        // Compare moves and determine the result
        if playerMove == computerMove {
            roundResult = "It's a Draw!"
        } else if (playerMove == "Rock" && computerMove == "Scissors") ||
                  (playerMove == "Paper" && computerMove == "Rock") ||
                  (playerMove == "Scissors" && computerMove == "Paper") {
            playerScore += 1
            roundResult = "You Win!"
        } else {
            computerScore += 1
            roundResult = "Computer Wins!"
        }
        
        // Move to the next round or end the game
        if round < 10 {
            round += 1
        } else {
            endGame()
        }
    }
    
    // Function to handle the end of the game
    func endGame() {
        gameOver = true
        roundResult = ""
        computerMove = ""
    }
    
    // Function to restart the game
    func restartGame() {
        playerScore = 0
        computerScore = 0
        round = 1
        gameOver = false
        computerMove = ""
        roundResult = ""
    }
}

#Preview {
    ContentView()
}
