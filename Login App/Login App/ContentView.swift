//
//  ContentView.swift
//  Login App
//
//  Created by AMAR on 30/09/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home :View {
    @State var index = 0
    
    var body: some View{
        GeometryReader{_ in
            VStack{
               Image("logo")
                    .resizable()
                    .frame(width: 60, height: 60,alignment: .center)
                  
                ZStack{
                    SignUP(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                }
                
                HStack(spacing: 15){
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame( height: 1)
                    
                    Text("OR")
                    
                    Rectangle()
                        .fill(Color("Color1"))
                        .frame(height: 1)
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
                HStack(spacing: 25){
                    Button(action:{
                        
                    }){
                        Image("apple")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action:{
                        
                    }){
                        Image("fb")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                    Button(action:{
                        
                    }){
                        Image("twitter")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    }
                }
                .padding(.top, 30)
                
            }
            .padding(.vertical)
        }
        .background(Color("Color").edgesIgnoringSafeArea(.all))
    }
}

//Curve...
struct CShape: Shape{
    func path(in rect: CGRect) -> Path {
        return Path{path in
            //right side
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}

struct CShape1: Shape{
    func path(in rect: CGRect) -> Path {
        return Path{path in
            //left side
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}

struct Login : View{
    @State var email = ""
    @State var password = ""
    @Binding var index : Int
    
    var body: some View{
        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    VStack{
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text:  self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text:  self.$password)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack{
                    Spacer(minLength: 0)
                    Button(action: {
                        
                    }){
                        Text("Forgot Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action:{
                
            }){
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}

struct SignUP : View{
    @State var email = ""
    @State var password = ""
    @State var confPassword = ""
    @Binding var index : Int
    var body: some View{
        ZStack(alignment: .bottom){
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    VStack(spacing: 10){
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                }
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text:  self.$email)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text:  self.$password)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15){
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Confirm Password", text:  self.$confPassword)
                    }
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
               
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action:{
                
            }){
                Text("SIGN UP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
