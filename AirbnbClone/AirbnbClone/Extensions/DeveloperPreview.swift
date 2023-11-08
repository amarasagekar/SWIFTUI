//
//  DeveloperPreview.swift
//  AirbnbClone
//
//  Created by AMAR on 08/11/23.
//

import Foundation

class DeveloperPreview{
    var listings: [Listing] = [
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Jhon Smith",
            ownerImageUrl:"male-profile-phone",
            numberOfBedroom: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7850,
            longitude: -80.1936,
            imageUrls: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "124 Main st",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony, .laundry, .tv],
            type: .villa
            
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Jhon Smith",
            ownerImageUrl:"male-profile-phone",
            numberOfBedroom: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 567,
            latitude: 25.7706,
            longitude: -80.1340,
            address: "124 Main st",
            city: "Miami",
            state: "Florida",
            title: "Miami Villa",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem,.tv, .kitchen, .office],
            type: .villa
            
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Steve Johnson",
            ownerImageUrl:"male-profile-phone",
            numberOfBedroom: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            latitude: 25.7650,
            longitude: -80.1936,
            address: "124 Main st",
            city: "Miami",
            state: "Florida",
            title: "Beatiful Miami aprtment in downtown Brickell",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .villa
            
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Harry Styles",
            ownerImageUrl:"male-profile-phone",
            numberOfBedroom: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            latitude: 34.2,
            longitude: -118.0426,
            imageUrls: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "124 Main st",
            city: "Los Angles",
            state: "California",
            title: "Beatiful Los Angles home in Malibu",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .pool],
            type: .villa
        ),
        .init(
            id: NSUUID().uuidString,
            ownerUid: NSUUID().uuidString,
            ownerName: "Timothy Chalamet",
            ownerImageUrl:"male-profile-phone",
            numberOfBedroom: 4,
            numberOfBathrooms: 3,
            numberOfGuests: 4,
            numberOfBeds: 4,
            pricePerNight: 763,
            latitude: 34.1,
            longitude: -118.1426,
            imageUrls: ["listing-2", "listing-1", "listing-3", "listing-4"],
            address: "124 Main st",
            city: "Los Angles",
            state: "California",
            title: "Beatiful Los Angles home in the Hollywood Hills",
            rating: 4.86,
            features: [.selfCheckIn, .superHost],
            amenities: [.wifi, .alarmSystem, .balcony],
            type: .villa
        ),
    ]
}
