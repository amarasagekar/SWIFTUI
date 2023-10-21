//
//  ProfilePhotoSelectorView.swift
//  TwitterClone
//
//  Created by AMAR on 21/10/23.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @State private var profileImage:Image?
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack{
            AuthHeaderView(title1: "Setup Account", title2: "Add a profile photo")
            
            Button{
                showImagePicker.toggle()
            }label: {
                if let profileImage = profileImage{
                    profileImage
                        .resizable()
                        .modifier(ProfileImageModifier())
                    
                }else{
                    Image("plus_photo")
                        .renderingMode(.template)
                        .modifier(ProfileImageModifier())
                }
            }
            .sheet(isPresented: $showImagePicker,
                   onDismiss: loadImage,
                   content: {
                ImagePicker(selectedImage: $selectedImage)
            })
            .padding(.top, 44)
            
            if let selectedImage = selectedImage{
                Button {
                    viewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(Color(.systemBlue))
                        .clipShape(Capsule())
                        .padding()
                }
                .shadow(color: .gray.opacity(0.5), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: 0, y: 0)
            }
            
            
            Spacer()
        }
        .ignoresSafeArea()
    }
    
    func loadImage(){
        guard let selectedImage = selectedImage else {return}
        profileImage = Image(uiImage: selectedImage)
    }
}

private struct ProfileImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color(.systemBlue))
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
    }
}

#Preview {
    ProfilePhotoSelectorView()
}
