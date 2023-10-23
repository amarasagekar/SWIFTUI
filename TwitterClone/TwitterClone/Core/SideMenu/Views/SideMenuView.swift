//
//  SideMenuView.swift
//  TwitterClone
//
//  Created by AMAR on 12/10/23.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading){
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                    VStack(alignment: .leading, spacing: 4){
                        Text(user.fullName)
                            .font(.headline)
                        
                        Text("@\(user.username)")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    UserStatsView()
                        .padding(.vertical)
                }
                .padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                    if viewModel == .profile{
                        NavigationLink {
                            ProfileView(user: user)
                        } label: {
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    }else if viewModel == .logout{
                        Button{
                            authViewModel.signOut()
                        } label:{
                            SideMenuOptionRowView(viewModel: viewModel)
                        }
                    }else{
                        SideMenuOptionRowView(viewModel: viewModel)
                    }
                   
                }
                .padding(.leading)
                Spacer()
            }
        }
       
    }
}

#Preview {
    SideMenuView()
}

