//
//  FirebaseService.swift
//  Anbulance
//
//  Created by Selen Yanar on 16.05.2021.
//

import Foundation
import FirebaseFirestore
import MapKit

class FirebaseService: ObservableObject {
    
    @Published var post = Post(latitude: 0, longitude: 0, description: "", title: "")
    private var db = Firestore.firestore()
    

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
                let imageUrl = data["imageUrl"] as? String ?? ""
                let latitude = data["latitude"] as? Double ?? 0
                let longitude = data["longitude"] as? Double ?? 0
                
                let animalAnnotations = AnimalAnnotation(title: title, coordinate: CLLocationCoordinate2D(latitude: latitude, longitude: longitude), imageUrl: imageUrl)
                
                print(animalAnnotations)
                
                
                return animalAnnotations
                
                
            }
            
        }
    }
    
  
 
    
  
}
