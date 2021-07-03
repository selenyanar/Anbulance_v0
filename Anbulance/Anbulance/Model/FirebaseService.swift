//
//  FirebaseService.swift
//  Anbulance
//
//  Created by Selen Yanar on 16.05.2021.
//

import Foundation
import FirebaseFirestore

class FirebaseService {
    
    let db = Firestore.firestore()
    var posts = [Post]()
    
    func addNewEntry(post: Post, completion: @escaping (Result<Void, Error>) ->  Void) {
        
        let ref = db.document("posts")
            ref.setData([
            "latitude" : post.latitude,
            "longitude" : post.longitude,
            "description" : post.description!,
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
