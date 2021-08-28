//
//  MapView.swift
//  Anbulance
//
//  Created by Selen Yanar on 6.04.2021.
//

import MapKit
import SwiftUI
import Firebase

struct MapView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    @State private var annotaionSelection: String? = nil
    @State private var showingAlert = false

    @State private var animalAnnotation: AnimalAnnotation? = nil
    @State private var shelterAnnotation: ShelterAnnotation? = nil

    var body: some View {
        ZStack {
            

            // NAVIGATION LINK FOR ANIMAL DETAIL VIEW
            NavigationLink(destination: AnimalDetailView(animalAnnotation: animalAnnotation), tag: "animal_detail_view_tag", selection: $annotaionSelection) { EmptyView()
            }

            MapModel().onAnnotationTapped(perform: { annotation in
                
                // HERE YOU GET ANNOTATION TAPPED CALLBACKS
                if annotation is AnimalAnnotation {
                    self.animalAnnotation = annotation as? AnimalAnnotation
                    annotaionSelection = "animal_detail_view_tag"
                }else if annotation is ShelterAnnotation {
                    self.shelterAnnotation = annotation as? ShelterAnnotation
                    showingAlert = true
                }
                
            }).edgesIgnoringSafeArea(.all)
            
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(self.shelterAnnotation?.title ?? ""), message: Text("Use sheltorAnnotation to do whatever needed"), dismissButton: .default(Text("Got it!")))
            }

            NavigationLink(
                destination: ReportView(),
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 300, height: 60, alignment: .center)
                            .foregroundColor(Color("AnbulanceBlue"))
                        Text("YARALI HAYVAN BİLDİR")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                }).offset(y: 300)
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Çıkış yap") {
                    print("çıkış yap")
                    try! Auth.auth().signOut()
                    UserDefaults.standard.set(false,forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    
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
