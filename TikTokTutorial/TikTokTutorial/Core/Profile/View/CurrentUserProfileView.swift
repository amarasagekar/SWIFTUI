//
//  CurrentUserProfileView.swift
//  TikTokTutorial
//
//  Created by AMAR on 24/11/23.
//

import SwiftUI

struct CurrentUserProfileView: View {
    var body: some View {
        NavigationStack {
            ScrollView{
                VStack(spacing: 2){
                    //profile header
                    ProfileHeaderView()
                    // post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
