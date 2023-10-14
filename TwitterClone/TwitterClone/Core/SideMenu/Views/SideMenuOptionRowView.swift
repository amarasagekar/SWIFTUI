//
//  SideMenuOptionRowView.swift
//  TwitterClone
//
//  Created by AMAR on 14/10/23.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: viewModel.imageName)
                .font(.headline)
                .foregroundColor(.gray)
            
            Text(viewModel.title)
                .foregroundColor(.black)
                .font(.subheadline)
            Spacer()
        }
        .frame(height: 40)
        .padding(.vertical, 4)
    }
}

#Preview {
    SideMenuOptionRowView(viewModel: .profile)
}
