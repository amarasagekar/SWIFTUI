//
//  ContentView.swift
//  TriviaGameDemo
//
//  Created by AMAR on 18/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var triviaManger = TriviaManager()
    
    
    var body: some View {
        NavigationView {
            VStack(spacing:40) {
                VStack(spacing:20){
                    Text("Trivia Game")
                        .lilacTitle()
                    
                    Text("Are you ready to test out your trivia skills?")
                        .foregroundStyle(Color("AccentColor"))
                }
                NavigationLink{
                    TriviaView()
                        .environmentObject(triviaManger)
                } label: {
                    PrimaryButton(text: "Let's go!")
                }
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
        .background(Color(red: 0.984313725490196, green: 0.9294117647058824, blue: 0.8470588235294118))
        }
    }
}

#Preview {
    ContentView()
}
