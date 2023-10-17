//
//  UserStatsView.swift
//  TwitterClone
//
//  Created by AMAR on 12/10/23.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
        HStack(spacing: 24){
            HStack(spacing: 4){
                Text("807")
                    .font(.subheadline)
                    .bold()
                
                Text("following")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            HStack{
                Text("6.9M")
                    .font(.subheadline)
                    .bold()
                
                Text("followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    UserStatsView()
}
