//
//  FirebaseService.swift
//  Anbulance
//
//  Created by Selen Yanar on 16.05.2021.
//

import Foundation
import Firebase
import MapKit


class FirebaseService {
    
    let db = Firestore.firestore()
    var posts = [Post]()
    var mapView = MKMapView()
    
    
    func addNewEntry(post: Post, completion: @escaping (Result<Void, Error>) ->  Void) {
        
        let ref = db.collection("posts").addDocument(data: [
            "latitude" : post.latitude,
            "longitude" : post.longitude,
            "title" : post.title,
            "detailsText" : post.detailsText,
        ]) { err in
            if let err = err {
                
                completion(.failure(err))
                
                print("Error adding document: \(err)")
            } else {
                completion(.success(()))
                print("Document added")
            }
        }
    }
}
