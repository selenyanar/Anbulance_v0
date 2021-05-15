//
//  AnnotationModel.swift
//  Anbulance
//
//  Created by Selen Yanar on 15.05.2021.
//

import UIKit
import MapKit

class ShelterAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    init(title: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}

class AnimalAnnotation: NSObject, MKAnnotation {
    let title: String?
    let coordinate: CLLocationCoordinate2D
    init(title: String?,
         coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
    }
}




