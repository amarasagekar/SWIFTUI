//
//  TriviaView.swift
//  TriviaGameDemo
//
//  Created by AMAR on 18/10/23.
//

import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        if triviaManager.reachedEnd{
            VStack(spacing: 20){
                Text("Trivia Game")
                    .lilacTitle()
                
                Text("Congratulations, you completed the game! 🥳")
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
                
                Button{
                    Task.init{
                        await triviaManager.fetchTrivia()
                    }
                } label: {
                    PrimaryButton(text: "Play Again")
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }else{
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

#Preview {
    TriviaView()
        .environmentObject(TriviaManager())
}
