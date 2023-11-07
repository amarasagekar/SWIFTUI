//
//  Listing.swift
//  AirbnbClone
//
//  Created by AMAR on 07/11/23.
//

import Foundation

struct Listing: Identifiable, Codable {
    let id: String
    let ownerUid: String
    let ownerName: String
    let ownerImageUrl: String
    let numberOfBedroom: String
    let numberOfBathrooms: String
    let numberOfGuests: String
    let numberOfBeds: String
    let pricePerNight: String
    let latitude: String
    let longitude: String
    let address: String
    let city: String
    let state: String
    let title: String
    let rating: String
}

enum ListingFeatures: Int, Codable, Identifiable, Hashable{
    case selfCheckIn
    case superHost
    
    var id: Int {return self.rawValue}
}

enum ListingAmenities: Int, Codable, Identifiable, Hashable {
    case pool
    case kitchen
    case wifi
    case laundry
    case tv
    case alarmSystem
    case office
    case balcony
    
    var id: Int {return self.rawValue}
}
