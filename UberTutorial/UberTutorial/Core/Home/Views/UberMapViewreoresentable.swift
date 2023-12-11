//
//  UberMapViewreoresentable.swift
//  UberTutorial
//
//  Created by AMAR on 29/11/23.
//

import SwiftUI
import MapKit

struct UberMapViewRepresentable: UIViewRepresentable {
  
    let mapview = MKMapView()
    //let locationManager = LocationManager.shared
    @Binding var mapState: MapViewState
    @EnvironmentObject var locationViewModel:LocationSearchViewModel
    
    func makeUIView(context: Context) -> some UIView {
        mapview.delegate = context.coordinator
        mapview.isRotateEnabled = false
        mapview.showsUserLocation = true
        mapview.userTrackingMode = .follow
        
        return mapview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
        switch mapState {
        case .noInput:
            context.coordinator.clearMapViewAndRecenterOnUserLocation()
        case .searchingForLocation:
            break
        case .locationSelected:
            if let coordinate = locationViewModel.selectedUberlocation?.coordinate {
                context.coordinator.addAndSelectAnnotation(withCoordinate: coordinate)
                context.coordinator.configurePolyline(withDestinationCoordinate: coordinate)
            }
            break
        case .polylineAdded:
            break
        }
    }
    
    func makeCoordinator() -> MapCoordinator {
        return MapCoordinator(parent: self)
    }
}

extension UberMapViewRepresentable {
    
    class MapCoordinator: NSObject, MKMapViewDelegate {
        let parent: UberMapViewRepresentable
        var userLocationCoordinate: CLLocationCoordinate2D?
        var currentReagion: MKCoordinateRegion?
        
        init(parent: UberMapViewRepresentable) {
            self.parent = parent
            super.init()
        }
        
        func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
            self.userLocationCoordinate = userLocation.coordinate
            let region = MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
            )
            
            self.currentReagion = region
            parent.mapview.setRegion(region, animated: true)
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let polyline = MKPolylineRenderer(overlay: overlay)
            polyline.strokeColor = .systemBlue
            polyline.lineWidth = 6
            return polyline
        }
        
        func addAndSelectAnnotation(withCoordinate coordinate: CLLocationCoordinate2D){
            parent.mapview.removeAnnotations(parent.mapview.annotations)
            
            let anno = MKPointAnnotation()
            anno.coordinate = coordinate
            parent.mapview.addAnnotation(anno)
            parent.mapview.selectAnnotation(anno, animated: true)
            
            //parent.mapview.showAnnotations(parent.mapview.annotations, animated: true)
        }
        
        func configurePolyline(withDestinationCoordinate coordinate: CLLocationCoordinate2D) {
            guard let userLocationCoordinate = self.userLocationCoordinate else { return }
            parent.locationViewModel.getDestinationRoute(from: userLocationCoordinate, to: coordinate) { route in
                self.parent.mapview.addOverlay(route.polyline)
                self.parent.mapState = .polylineAdded
                let rect = self.parent.mapview.mapRectThatFits(route.polyline.boundingMapRect, edgePadding: .init(top: 64, left: 32, bottom: 500, right: 32))
                
                self.parent.mapview.setRegion(MKCoordinateRegion(rect), animated: true)
            }
        }

        
        func clearMapViewAndRecenterOnUserLocation(){
            parent.mapview.removeAnnotations(parent.mapview.annotations)
            parent.mapview.removeOverlays(parent.mapview.overlays)
            
            if let currentRegion = currentReagion {
                parent.mapview.setRegion(currentRegion, animated: true)
            }
        }
    }
}
