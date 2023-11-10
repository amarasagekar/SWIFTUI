//
//  ExploreView.swift
//  AirbnbClone
//
//  Created by AMAR on 29/10/23.
//

import SwiftUI

struct ExploreView: View {
    @State private var showDestinationSearchView = false
    @StateObject var viewModel = ExploreViewModel(service: ExploreService())
    
    var body: some View {
        NavigationStack{
            if showDestinationSearchView{
                DestinationSearchView(show: $showDestinationSearchView, viewModel: viewModel)
            }else{
                ScrollView{
                    SearchAndFilterBar(location: $viewModel.seatchLocation)
                        .onTapGesture {
                            withAnimation(.snappy){
                                showDestinationSearchView.toggle()
                            }
                        }
                    LazyVStack(spacing: 32){
                        ForEach(viewModel.listings){ listing in
                            NavigationLink(value: listing){
                                ListingItemView(listing: listing)
                                    .frame(height: 400)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            
                        }
                    }
                    .padding()
                }
                .navigationDestination(for: Listing.self) { listing in
                    ListingDetailview(listing: listing)
                        .navigationBarBackButtonHidden()
                }
        }
        }
    }
}

#Preview {
    ExploreView()
}
