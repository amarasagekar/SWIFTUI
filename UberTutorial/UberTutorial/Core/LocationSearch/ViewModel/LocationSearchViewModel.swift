//
//  LocationSearchViewModel.swift
//  UberTutorial
//
//  Created by AMAR on 03/12/23.
//

import Foundation
import MapKit

class LocationSearchViewModel: NSObject, ObservableObject {
    @Published var results = [MKLocalSearchCompletion]()
    @Published var selectedUberlocation: UberLocation?
    @Published var pickupTime: String?
    @Published var dropOffTime: String?
    
    private let searchCompleter = MKLocalSearchCompleter()
    var queryFragment: String = "" {
        didSet{
            searchCompleter.queryFragment = queryFragment
        }
    }
    
    var userLocation: CLLocationCoordinate2D?
    
    override init(){
        super.init()
        searchCompleter.delegate = self
        searchCompleter.queryFragment = queryFragment
    }
    
    func selectLocation(_ localSearch: MKLocalSearchCompletion) {
        
        locationSearch(forLocalSearchCompletion: localSearch) { response, error in
            if let error = error {
                print("location search failed with error -- \(error.localizedDescription)")
                return
            }
            guard let item = response?.mapItems.first else { return }
            let coordinate = item.placemark.coordinate
            self.selectedUberlocation = UberLocation(title: localSearch.title, coordinate: coordinate)
        }
    }
    
    func locationSearch(forLocalSearchCompletion localSearch: MKLocalSearchCompletion, completion: @escaping MKLocalSearch.CompletionHandler) {
        let searchrequest = MKLocalSearch.Request()
        searchrequest.naturalLanguageQuery = localSearch.title.appending(localSearch.subtitle)
        let search = MKLocalSearch(request: searchrequest)
        
        search.start(completionHandler: completion)
        
    }
    
    func computeRidePrice(for type: RideType) -> Double {
        guard let destCoordinate = selectedUberlocation?.coordinate else {return 0.0}
        guard let userCoordinate = self.userLocation else {return 0.0}
        
        let userLocation = CLLocation(latitude: userCoordinate.latitude,
                                      longitude: userCoordinate.longitude)
        
        let destination = CLLocation(latitude: destCoordinate.latitude,
                                      longitude: destCoordinate.longitude)
        
        let tripDistanceinMeters = userLocation.distance(from: destination)
        
        return type.computePrice(for: tripDistanceinMeters)
        
    }
    
    func getDestinationRoute(from userLocation: CLLocationCoordinate2D, to destination: CLLocationCoordinate2D, completion: @escaping(MKRoute) -> Void) {
        let userPlacemark = MKPlacemark(coordinate: userLocation)
        let destPlacemark = MKPlacemark(coordinate: destination)
        let request = MKDirections.Request()
        request.source = MKMapItem(placemark: userPlacemark)
        request.destination = MKMapItem(placemark: destPlacemark)
        
        let directions = MKDirections(request: request)
        directions.calculate { respose, error in
            if let error = error {
                print("error -- \(error.localizedDescription)")
                return
            }
            
            guard let route = respose?.routes.first else { return }
            self.configurePickupAndDropoffTimes(with: route.expectedTravelTime)
            completion(route)
        }
    }
    
    func configurePickupAndDropoffTimes(with expectedTravelTime: Double){
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        
        pickupTime = formatter.string(from: Date())
        dropOffTime = formatter.string(from: Date() + expectedTravelTime)
    }
}

extension LocationSearchViewModel: MKLocalSearchCompleterDelegate {
    func completerDidUpdateResults(_ completer: MKLocalSearchCompleter) {
        self.results = completer.results
    }
}
