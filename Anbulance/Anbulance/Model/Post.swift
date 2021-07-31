//
//  Post.swift
//  Anbulance
//
//  Created by Selen Yanar on 16.05.2021.
//

import Foundation
import Firebase
import FirebaseFirestore


struct Post: Identifiable {
    
    var id: String = UUID().uuidString
    
    var latitude : Double
    var longitude : Double
    var description : String
    var title : String
    
    
}
