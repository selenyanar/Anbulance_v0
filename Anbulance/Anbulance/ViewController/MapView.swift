//
//  MapView.swift
//  Anbulance
//
//  Created by Selen Yanar on 6.04.2021.
//

import MapKit
import SwiftUI

struct MapView: View {
    var body: some View {
        NavigationView {
            ZStack {
                MapModel()
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 300, height: 60, alignment: .center)
                        .foregroundColor(Color("AnbulanceBlue"))
                    Text("YARALI HAYVAN BİLDİR")
                        .foregroundColor(.white)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                }
                .offset(y: 200)

            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Çıkış yap") {
                        print("çıkış yap")
                    }
                }
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MapView()
        }
    }
}
