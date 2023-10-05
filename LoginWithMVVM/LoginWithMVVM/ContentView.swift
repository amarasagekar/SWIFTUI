//
//  ContentView.swift
//  LoginWithMVVM
//
//  Created by AMAR on 05/10/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = ViewModel()
    var body: some View {
        if vm.authenticated{
            VStack(spacing: 20) {
                Text("Welcome back \(vm.username.lowercased())")
                Text("Tpoday is...\(Date().formatted(.dateTime))")
                Button("Log Out", action: vm.logout)
                    .tint(.red)
                    .buttonStyle(.bordered)
            }
        }else{
            ZStack{
                Image("Sky")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
                
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Text("Log in")
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .medium, design: .rounded))
                    TextField("Username", text: $vm.username)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $vm.password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    
                    HStack{
                        Spacer()
                        Button("Forgot Password?", action: vm.logPressed)
                            .tint(.red.opacity(0.8))
                        Spacer()
                        Button("Log In", action: vm.authenticate)
                            .buttonStyle(.bordered)
                        Spacer()
                    }
                    Spacer()
                }
                .alert("Access Denied", isPresented: $vm.invalid) {
                    Button("Dismiss", action: vm.logPressed)
                }
                .frame(width: 300)
                .padding()
            }
            //.transition(.offset(x: 0, y: 850))
            .transition(.scale)
        }
    
    }
}

#Preview {
    ContentView()
}
