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
    
    func makeUIView(context: Context) -> UIView {
        
        view.addSubview(map)
        map.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            map.widthAnchor.constraint(equalTo: view.widthAnchor),
            map.heightAnchor.constraint(equalTo: view.heightAnchor),
            map.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            map.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            
        ])
        return view
    }
    
    
    func updateUIView(_ uiView: UIView, context: Context) {
        map.delegate = context.coordinator
        map.showsUserLocation = true
        map.userTrackingMode = .follow
        map.addAnnotation(yedikuleShelter)
        map.addAnnotation(kadikoy1)
        
    }
    
    func makeCoordinator() -> MapViewCoordinator{
        MapViewCoordinator(self)
    }
    
    
}

class MapViewCoordinator: NSObject, MKMapViewDelegate {
    var mapModelController: MapModel
    
    init(_ control: MapModel) {
        self.mapModelController = control
    }
    
    //EDIT THE ANNOTATION VIEWS HERE:
    func mapView(_ mapView: MKMapView, viewFor
                    annotation: MKAnnotation) -> MKAnnotationView?{
        let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "customView")
        
        //CUSTOM IMAGE ICON
        
        switch annotation {
        case is ShelterAnnotation:
            annotationView.image = #imageLiteral(resourceName: "AnbulancePin")
            annotationView.frame.size = CGSize(width: 50, height: 50)
        case is AnimalAnnotation:
            annotationView.image = #imageLiteral(resourceName: "AnbulanceRedPin")
            annotationView.frame.size = CGSize(width: 50, height: 50)
        case is MKUserLocation:
            annotationView.image = #imageLiteral(resourceName: "GreenCircle")
            annotationView.frame.size = CGSize(width: 20, height: 20)
        default:
            annotationView.image = #imageLiteral(resourceName: "AnbulancePin")
            annotationView.frame.size = CGSize(width: 50, height: 50)
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let btn = UIButton(type: .detailDisclosure)
        view.canShowCallout = true
        view.rightCalloutAccessoryView = btn
        
    }
    
    //Display alert once annotation is tapped
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("annotation is tapped")
        
    }
    
    
    func mapView(_ mapView: MKMapView, didAdd views: [MKAnnotationView]) {
        
        if let annotationView = views.first {
            if let annotation = annotationView.annotation {
                if annotation is MKUserLocation {
                    let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 7000, longitudinalMeters: 7000)
                    mapView.setRegion(region, animated: true)
                    
                }
            }
        }
    }
}
