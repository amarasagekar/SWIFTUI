//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by AMAR on 19/10/23.
//

import Foundation
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    init () {
        self.userSession = Auth.auth().currentUser
         
        print("Debug:-- user session is \(self.userSession)")
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to sign in with error==\(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            self.userSession = user
            print("Did log user in successfully")
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String){
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print("Failed to register with error \(error.localizedDescription)")
                return
            }
            print("Registered user successfully")
            print("User is\(self.userSession)")
            
            guard let user = result?.user else { return }
            self.userSession = user
            
            let data = ["email" : email,
                        "fullname":fullname,
                        "username": username,
                        "uid" : user.uid]
            Firestore.firestore().collection("user")
                .document(user.uid)
                .setData(data) { _ in
                    print("did upload user data")
                    
                }
        }
    }
    
    func signOut() {
        userSession = nil
        
        //Signs user out on server
        try? Auth.auth().signOut()
    }
}
