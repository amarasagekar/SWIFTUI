//
		//  ExploreViewModel.swift
//  AirbnbClone
//
//  Created by AMAR on 08/11/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var listings = [Listing]()
    @Published var seatchLocation = ""
    
    private let service: ExploreService
    private var listingsCopy = [Listing]()
    
    init(service: ExploreService){
        self.service = service
        
        Task {await fetchLisings()}
    }
    
    func fetchLisings() async{
        do{
            self.listings = try await service.fetchListing()
            self.listingsCopy = listings
        } catch {
            print("Debug: failed to fetch listings with error: \(error.localizedDescription)")
        }
    }
    
    func updateListingsForLocation() {
        let filteredListings = listings.filter({
            $0.city.lowercased() == seatchLocation.lowercased() ||
            $0.state.lowercased() == seatchLocation.lowercased()
        })
        
        self.listings = filteredListings.isEmpty ? listingsCopy : filteredListings
    }
}
