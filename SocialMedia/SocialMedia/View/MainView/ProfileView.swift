//
//  ProfileView.swift
//  SocialMedia
//
//  Created by AMAR on 01/10/23.
//

import SwiftUI
import Firebase
import FirebaseFirestore
import FirebaseStorage

struct ProfileView: View {
    @State private var myProfile: User?
    @AppStorage("log_status") var logStatus: Bool = false
    @State var errorMessage: String = ""
    @State var showError:Bool = false
    @State var isLoading: Bool = false
    
    var body: some View {
        NavigationStack{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    if let myProfile{
                        ReusableProfileContent(user: myProfile)
                            .refreshable {
                                //MARK: Refresh
                                self.myProfile = nil
                                await fetchUserData()
                            }
                    }else{
                        ProgressView()
                    }
                }
            }
            
            .navigationTitle("My Profile")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Menu {
                        Button("Logout", action: logout)
                        
                        Button("Delete Account", role: .destructive, action: deleteAccount)
                    } label: {
                        Image("ellipsis")
                            .rotationEffect(.init(degrees: 90))
                            .tint(.black)
                            .scaleEffect(0.8)
                                
                        
                        
                    }
                }
            }
        }
        .overlay {
            LoadingView(show: $isLoading)
        }
        .alert(errorMessage, isPresented: $showError){
            
        }
        .task{
            if myProfile != nil{return}
            await fetchUserData()
        }
    }
    
    func fetchUserData()async{
        guard let userUID = Auth.auth().currentUser?.uid else{return}
        guard let user = try? await Firestore.firestore().collection("Users").document(userUID).getDocument(as: User.self) else{return}
        await MainActor.run(body: {
            myProfile = user
        })
                
    }
    
    func logout(){
        try? Auth.auth().signOut()
        logStatus = false
    }
    
    func deleteAccount(){
        isLoading = true
        Task{
            do{
                guard let userUID = Auth.auth().currentUser?.uid else{return}
                let referance = Storage.storage().reference().child("Profile_Images").child(userUID)
                try await referance.delete()
                try await Firestore.firestore().collection("Users").document(userUID).delete()
                try await Auth.auth().currentUser?.delete()
                logStatus = false
            }catch{
                await setError(error)
            }
        }
    }
    
    func setError(_ error:Error)async{
        isLoading = false
        await MainActor.run(body:{
            errorMessage = error.localizedDescription
            showError.toggle()
        })
    }
}

#Preview {
    ProfileView()
}
