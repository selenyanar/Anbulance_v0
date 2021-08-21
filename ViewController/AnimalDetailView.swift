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
                .frame(width: 350.0, height: 300.0)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            
            Text(animalAnnotation?.title ?? "")
                .frame(width: 350.0, height: 250.0)
            Button(
                action: {
                    print("Yayınla")
                },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 350, height: 50, alignment: .center)
                            .foregroundColor(Color("AnbulanceBlue"))
                            .cornerRadius(8)
                        Text("Kurtar")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                })
        }
        
    }
    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            AnimalDetailView()
        }
    }
}
