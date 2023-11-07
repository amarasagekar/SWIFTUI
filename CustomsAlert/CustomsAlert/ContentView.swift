//
//  ContentView.swift
//  CustomsAlert
//
//  Created by Immortal Lion on 05/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var presentAlert = false
    
    var body: some View {
        ZStack{
            
            Button{
                withAnimation{
                    presentAlert.toggle()
                }
            } label: {
                Text("Show Custom Alert")
            }
            
            if presentAlert{
                
//                Success Alert
                
//                CustomAlert(presentAlert: $presentAlert) {
//                    withAnimation{
//                        presentAlert.toggle()
//                    }
//                } rightButtonAction: {
//                    withAnimation{
//                        presentAlert.toggle()
//                    }
//                }

                
//                Error Alert
                
                CustomAlert(presentAlert: $presentAlert, alertType: .error(title: "Error", message: "Please confirm that you're still open to session requests then you will find the call from new user."), isShowVerticalButtons: true){
                    withAnimation{
                        presentAlert.toggle()
                    }
                } rightButtonAction: {
                    withAnimation{
                        presentAlert.toggle()
                    }
                }
            }
        }
    }
}

//struct ContentView: View {
    
    
//    @State private var showAlert: Bool = false
//    @State private var showingAlert = false
//
//
//    var body: some View {
//        VStack(spacing: 40){
//            Button("Show Alert") {
//                showingAlert = true
//            }
//            .alert(isPresented: $showingAlert) {
//                Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))
//            }
//        }
//                    Button("Native Alert") {
//                        showAlert = true
//                    }
//                    .alert("Title", isPresented: $showAlert, actions: {
//                        Button("Cancel", role: .cancel) {}
//
//                        Button("Delete", role: .destructive) {}
//                    })//: ALERT
//                    .padding(.horizontal, 30)
//                    .padding(.vertical, 15)
//                    .background(.blue)
//                    .foregroundColor(.white)
//                }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home: View{
    @State var nativeAlert = false
    @State var customAlert = false
    @State var HUD = false
    @State var password = ""
    
    var body: some View{
        ZStack{
            VStack(spacing: 25){
                Button {
                    alertView()
                } label: {
                    Text("Native Alert with Textfields")
                }
                Text(password)
                    .fontWeight(.bold)

            }
        }
    }
    
    func alertView(){
        let alert = UIAlertController(title: "Login", message: "Enter Your Password", preferredStyle: .alert)
        
        alert.addTextField{(pass) in
            pass.isSecureTextEntry = true
            pass.placeholder = "Password"
        }
        
        //Action button
        let login = UIAlertAction(title: "Login", style: .default){(_) in
            //handle action
            print("Login pressed")
            password = alert.textFields![0].text!
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .destructive){(_) in
            
            print("Cancel pressed")
        }
        
        alert.addAction(cancel)
        alert.addAction(login)
        
//        UIApplication.shared.windows.keyWindow.present(alert, animated: true)
        
    }
}
