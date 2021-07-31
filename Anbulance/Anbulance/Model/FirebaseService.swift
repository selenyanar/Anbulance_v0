//
//  FirebaseService.swift
//  Anbulance
//
//  Created by Selen Yanar on 16.05.2021.
//

import Foundation
import FirebaseFirestore

class FirebaseService: ObservableObject {
    
    @Published var posts = [Post]()
    @Published var post = Post(latitude: 0, longitude: 0, description: "", title: "")
    private var db = Firestore.firestore()
    
    
    

    func fetchData() {
        db.collection("posts").addSnapshotListener { querySnapshot, error in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }
            
            self.posts = documents.map { (queryDocumentSnapshot) -> Post in
                let data = queryDocumentSnapshot.data()
                
                let title = data["title"] as? String ?? ""
                let description = data["description"] as? String ?? ""
                let latitude = data["latitude"] as? Double ?? 0
                let longitude = data["longitude"] as? Double ?? 0
                
                return Post(latitude: latitude, longitude: longitude, description: description, title: title)
                
            }
            
        }
    }
 
    
  
}
