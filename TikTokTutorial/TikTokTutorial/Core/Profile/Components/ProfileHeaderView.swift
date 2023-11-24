//
//  ProfileHeaderView.swift
//  TikTokTutorial
//
//  Created by AMAR on 24/11/23.
//

import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 8) {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .foregroundStyle(Color(.systemGray5))
                
                Text("@lewis.hamilton")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                
            }
        
            //stats view
            
            HStack(spacing: 16) {
                UserStatView(value: 56, title: "Following")
                UserStatView(value: 10, title: "Follower")
                UserStatView(value: 567, title: "Likes")
                
            }
            
            //action button
            Button{
                
            } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .foregroundStyle(.black)
                    .background(Color(.systemGray6))
                    .clipShape(RoundedRectangle(cornerRadius: 6))
            }
            
            Divider()
        }
    }
}

#Preview {
    ProfileHeaderView()
}

