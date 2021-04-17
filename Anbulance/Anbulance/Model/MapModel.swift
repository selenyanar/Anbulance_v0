//
//  MapModel.swift
//  Anbulance
//
//  Created by Selen Yanar on 9.04.2021.
//

import UIKit
import SwiftUI
import MapKit


struct MapModel: UIViewRepresentable {
    
    let view = UIView()
    let map = MKMapView()
    
    let yedikuleShelter = ShelterAnnotation(title: "Yedikule Hayvan Barınağı", coordinate: CLLocationCoordinate2D(latitude: 40.9907822322955, longitude: 28.920995484659933))
    
    typealias UIViewType = UIView
    
    func makeUIView(context: Context) -> UIView {
        
        view.addSubview(map)
        
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: view.widthAnchor),
            map.heightAnchor.constraint(equalTo: view.heightAnchor),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        
        //   let pin = MKPointAnnotation()
        //   pin.coordinate = CLLocationCoordinate2D(latitude: 40.9907822322955, longitude: 28.920995484659933)
        //   pin.title = "Yedikule Hayvan Barınağı"
        //    map.addAnnotation(pin)
        
        
        return view
    }
    
    
    class MapViewCoordinator: NSObject, MKMapViewDelegate {
        var mapModelController: MapModel
        
        init(_ control: MapModel) {
            self.mapModelController = control
        }
        
        func mapView(_ mapView: MKMapView, viewFor
                        annotation: MKAnnotation) -> MKAnnotationView?{
            //Custom View for Annotation
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
            annotationView.canShowCallout = true
            //Your custom image icon
            annotationView.image = #imageLiteral(resourceName: "AnbulancePin")
            annotationView.frame.size = CGSize(width: 50, height: 50)
            return annotationView
        }
    }
    
    class ShelterAnnotation: NSObject, MKAnnotation {
        let title: String?
        let coordinate: CLLocationCoordinate2D
        init(title: String?,
             coordinate: CLLocationCoordinate2D) {
            self.title = title
            self.coordinate = coordinate
        }
    }
    
    
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
        let coordinate = CLLocationCoordinate2D(latitude: 41.01224, longitude: 28.976018)
        let span = MKCoordinateSpan(latitudeDelta: 0.7,
                                    longitudeDelta: 0.7)
        map.setRegion(MKCoordinateRegion(center: coordinate,
                                         span: span),
                      animated: true)
        
        map.delegate = context.coordinator
        map.addAnnotation(yedikuleShelter)
        
        
    }
    
    func makeCoordinator() -> MapViewCoordinator{
        MapViewCoordinator(self)
    }
    
}
