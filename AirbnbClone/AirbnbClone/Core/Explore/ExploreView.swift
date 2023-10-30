//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by AMAR on 29/10/23.
//

import SwiftUI

struct ExploreView: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                SearchAndFilterBar()
                LazyVStack(spacing: 32){
                    ForEach(0 ... 10, id: \.self){ listing in
                        NavigationLink(value: listing){
                            ListingItemView()
                                .frame(height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                        
                    }
                }
                .padding()
            }
            .navigationDestination(for: Int.self) { listing in
               ListingDetailview()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

#Preview {
    ExploreView()
}
