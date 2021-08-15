//
//  LocationManager.swift
//  Anbulance
//
//  Created by Selen Yanar on 14.05.2021.
//

import Foundation
import MapKit


class LocationManager: NSObject, ObservableObject {
    
    private let locationManager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var latitude : Double?
    @Published var longitude : Double?
    
    override init() {
        
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLDistanceFilterNone
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        guard let location = locations.last else {
            return
        }
        
        guard let locationData: CLLocationCoordinate2D = locationManager.location?.coordinate else { return }
        
        latitude = locationData.latitude
        longitude = locationData.longitude
        
        self.location = location

    }
    
}
