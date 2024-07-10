//
//  ContentView.swift
//  PasswordStrength
//
//  Created by AMAR on 09/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
//            Color.Neumorphic.main.ignoresSafeArea()
            
            passwordStrength()
        }
        
    }
}

#Preview {
    ContentView()
}

struct passwordStrength: View {
    @State var text = ""
    @State var progress: CGFloat = 0
    @State var checkMinCharacters = false
    @State var checkLetter = false
    @State var checkPunctuation = false
    @State var checkNumber = false
    @State var showPassword = false
    
    var progressColor: Color {
        let containsLetters = text.rangeOfCharacter(from: .letters) != nil
        let containsNumber = text.rangeOfCharacter(from: .decimalDigits) != nil
        let containsPunctuation = text.rangeOfCharacter(from: CharacterSet(charactersIn: "!@/#*%^+&?")) != nil
        
        if containsLetters && containsNumber && containsPunctuation && text.count >= 0 {
            return Color.green
        }else if containsLetters && !containsNumber && !containsPunctuation{
            return Color.red
        }else if !containsLetters && containsNumber && !containsPunctuation{
            return Color.red
        }else if containsLetters && containsNumber && !containsPunctuation{
            return Color.yellow
        }else if containsLetters && containsNumber && containsPunctuation{
            return Color.blue
        }else{
            return Color.gray
        }
    }
    
    
    var body: some View{
        VStack(alignment: .leading,spacing: 40){
            VStack(alignment: .leading,spacing: 10){
                CheckText(text: "Minimum 8 characters", check: $checkMinCharacters)
                CheckText(text: "At least one letter", check: $checkLetter)
                CheckText(text: "Special character (!@/#*%^+&?)", check: $checkPunctuation)
                CheckText(text: "At least one number", check: $checkNumber)
            }
            ZStack{
                if !showPassword{
                    SecureField("Password", text: $text)
                        .padding(.leading).bold()
                        .onChange(of: text) { newValue in
                            withAnimation {
                                progress = min(1.0, max(0, CGFloat(newValue.count) / 8.0))
                                checkMinCharacters = newValue.count >= 8
                                checkLetter = newValue.rangeOfCharacter(from: .letters) != nil
                                checkNumber = newValue.rangeOfCharacter(from: .decimalDigits) != nil
                                checkPunctuation = newValue.rangeOfCharacter(from: CharacterSet(charactersIn: "!@/#*%^+&?")) != nil
                            }
                        }
                        .frame(height: 60)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .softInnerShadow(RoundedRectangle(cornerRadius: 10))
                                .softOuterShadow()
                        }
                }else {
                    TextField("Password", text: $text)
                        .padding(.leading).bold()
                        .onChange(of: text) { newValue in
                            withAnimation {
                                progress = min(1.0, max(0, CGFloat(newValue.count) / 8.0))
                                checkMinCharacters = newValue.count >= 8
                                checkLetter = newValue.rangeOfCharacter(from: .letters) != nil
                                checkNumber = newValue.rangeOfCharacter(from: .decimalDigits) != nil
                                checkPunctuation = newValue.rangeOfCharacter(from: CharacterSet(charactersIn: "!@/#*%^+&?")) != nil
                            }
                        }
                        .frame(height: 60)
                        .background{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.white)
                                .softInnerShadow(RoundedRectangle(cornerRadius: 10))
                                .softOuterShadow()
                        }
                }
                RoundedRectangle(cornerRadius: 10).trim(from: 0, to: progress)
                    .stroke(progressColor, lineWidth: 3)
                    .frame(height: 60)
                    .rotationEffect(.degrees(-100))
            }
            .overlay(alignment: .trailing){
                Image(systemName: showPassword ? "eye.fill" : "eye.slash.fill")
                    .padding(.trailing, 10)
                    .onTapGesture {
                        withAnimation {
                            showPassword.toggle()
                        }
                    }
            }
        
        }
        .padding(.horizontal)
    }
}

struct CheckText: View {
    let text: String
    @Binding var check: Bool
    
    var body: some View{
        HStack{
            Image(systemName: check ? "checkmark.circle.fill" : "circle")
            Text(text)
        }
    }
}
