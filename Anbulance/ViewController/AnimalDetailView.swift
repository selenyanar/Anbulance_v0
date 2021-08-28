//
//  AnimalDetailView.swift
//  Anbulance
//
//  Created by Selen Yanar on 10/08/21.
//

import Foundation
import SwiftUI
import FirebaseUI
import SDWebImageSwiftUI

struct AnimalDetailView: View {
        
    var animalAnnotation: AnimalAnnotation?
    
    var body: some View {
        VStack {
            
            // USE PLACEHOLDER IMAGE IF NONE AVAILABLE
            let imageUrl = animalAnnotation?.imageUrl ?? "https://via.placeholder.com/468x300?text=No%20image"
            WebImage(url: URL(string: imageUrl)).resizable().scaledToFit()
            .frame(width: 250.0, height: 250.0)
            
            Text(animalAnnotation?.title ?? "")
        
        }
        
    }
    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            AnimalDetailView()
        }
    }
}
