//
//  WishlistView.swift
//  AirbnbClone
//
//  Created by AMAR on 01/11/23.
//

import SwiftUI

struct WishlistView: View {
    var body: some View {
        NavigationStack{
            VStack(alignment: .leading, spacing: 32){
                VStack(alignment: .leading, spacing: 4){
                    Text("Login in to view your wishlists")
                        .font(.headline)
                    
                    Text("You can creaste, view or edit wishlists once you've logged in")
                        .font(.footnote)
                }
                
                Button{
                    
                }label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .frame(width: 360, height: 48)
                        .background(.pink)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Wishlists")
        }
    }
}

#Preview {
    WishlistView()
}
