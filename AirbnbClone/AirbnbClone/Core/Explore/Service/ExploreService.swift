//
//  ExploreService.swift
//  AirbnbClone
//
//  Created by AMAR on 10/11/23.
//

import Foundation
class ExploreService {
    func fetchListing() async throws -> [Listing] {
        return DeveloperPreview.shared.listings
    }
}
