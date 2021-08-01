//
//  ReportView.swift
//  Anbulance
//
//  Created by Selen Yanar on 9.04.2021.
//

import SwiftUI
import CoreLocation
import FirebaseFirestore


struct ReportView: View {
    
    @ObservedObject private var locationManager = LocationManager()
    let firebaseServices = FirebaseService()
    let latitude = CLLocationManager().location?.coordinate.latitude
    let longitude = CLLocationManager().location?.coordinate.longitude
    @State var db = Firestore.firestore()

    
    @State private var description: String = ""
    @State private var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 220, alignment: .center)
                    .cornerRadius(8)
                
                // DİSPLAY THE IMAGE
                if image != nil {
                    image?
                        .resizable()
                        .scaledToFit()
                } else {
                    Image(systemName: "plus")
                        .foregroundColor(Color("AnbulanceBlue"))  
                }
                
            }
            .padding(.bottom, 50.0)
            .offset(y: -20)
            .onTapGesture {
                // Select Image
                self.showingImagePicker = true
            }
            TextField("  Detaylı açıklama gir.", text: $description)
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            Button(
                action: {
                    print("Yayınla")
                    print("\(latitude)")
                    print("\(longitude)")
                    //createPost()
                    addData()
                    firebaseServices.fetchData()
                },
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 300, height: 50, alignment: .center)
                            .foregroundColor(Color("AnbulanceBlue"))
                            .cornerRadius(8)
                        Text("Yayınla")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }.padding(.top, 40.0)
                })
            
            Button(
                action: {
                    print("İptal")},
                label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 300, height: 50, alignment: .center)
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                        Text("İptal")
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .padding()
                    }
                })
        }
        
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: self.$inputImage)
        }
        
        
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    // Create Firebase Document
    
    func addData() {
        var ref: DocumentReference? = nil
        ref = db.collection("posts").addDocument(data: [
            "description": description,
            "latitude": latitude ?? 0,
            "longitude": longitude ?? 0
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }

        
    }

    
    
    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            ReportView()
        }
    }
}
