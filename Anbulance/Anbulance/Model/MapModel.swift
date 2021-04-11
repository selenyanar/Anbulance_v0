//
//  MapModel.swift
//  Anbulance
//
//  Created by Selen Yanar on 9.04.2021.
//

import Foundation
import UIKit
import SwiftUI
import MapKit


struct MapModel: UIViewRepresentable {

    
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        let coordinate = CLLocationCoordinate2D(latitude: 41.01224, longitude: 28.976018)
        let map = MKMapView()
        map.setRegion(MKCoordinateRegion(center: coordinate,
                                         span: MKCoordinateSpan(latitudeDelta: 0.7,
                                                                longitudeDelta: 0.7)),
                      animated: true)
        
        view.addSubview(map)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: view.widthAnchor),
            map.heightAnchor.constraint(equalTo: view.heightAnchor),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 40.9907822322955, longitude: 28.920995484659933)
        pin.title = "Yedikule Hayvan Barınağı"
        map.addAnnotation(pin)
        
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        // do nothing
    }
    
}
