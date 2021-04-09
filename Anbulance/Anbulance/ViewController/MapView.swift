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
        ZStack {
            MapModel()
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
