//
//  Content-ViewModel.swift
//  LoginWithMVVM
//
//  Created by AMAR on 05/10/23.
//

import SwiftUI

extension ContentView{
    class ViewModel: ObservableObject{
        @AppStorage("AUTH_KEY") var authenticated = false{
            willSet{ objectWillChange.send()}
        }
        @AppStorage("USER_KEY") var username = ""
        @Published var password = ""
        @Published var invalid: Bool = false
        
        private var sampleUser = "username"
        private var samplePassword = "password"
        
        init(){
            print("Currently logged on : \(authenticated)")
            print("Current username : \(username)")
        }
        func toggleAuthentication(){
            self.password = ""
            withAnimation {
                authenticated.toggle()
            }
        }
        func authenticate(){
            guard self.username.lowercased() == sampleUser else{
                self.invalid = true
                return
            }
            
            guard self.password.lowercased() == samplePassword else{
                self.invalid = true
                return
            }
            toggleAuthentication()
        }
        
        func logout(){
            toggleAuthentication()
        }
        
        func logPressed(){
            print("Button Pressed")
        }
    }
}
