//
//  MapModel.swift
//  Anbulance
//
//  Created by Selen Yanar on 9.04.2021.
//

import UIKit
import SwiftUI
import MapKit
import FirebaseFirestore


struct MapModel: UIViewRepresentable {
    
    let view = UIView()
    let map = MKMapView()
    private var db = Firestore.firestore()
    
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
        
        
        func fetchData() {
            db.collection("posts").addSnapshotListener { querySnapshot, error in
                guard let documents = querySnapshot?.documents else {
                    print("No documents")
                    return
                }
                
                var posts = documents.map { (queryDocumentSnapshot) -> MKAnnotation in
                    let data = queryDocumentSnapshot.data()
                    
                    let title = data["title"] as? String ?? ""
                    let description = data["description"] as? String ?? ""
                    let latitude = data["latitude"] as? Double ?? 0
                    let longitude = data["longitude"] as? Double ?? 0
                    
                    let animalAnnotations = AnimalAnnotation(title: description,
                                                             coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), imageUrl: imageUrl)
                    
                    map.addAnnotation(animalAnnotations)
                    return animalAnnotations
                    
                }
            }
        }
        
        fetchData()
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
            
            
            //IF STATEMENT FOR WHAT KIND OF ACTIONSHEET/SCREEN IS GOIN TO BE DISPLAYED
            
            
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
