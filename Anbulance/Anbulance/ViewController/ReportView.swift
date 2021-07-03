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
    var latitude = LocationManager().latitude
    var longitude = LocationManager().longitude
    var ref: DocumentReference? = nil
    
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
            TextView()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                .offset(y: -50)
            Button(
                action: {
                    print("Yayınla")
                    print("\(latitude)")
                    createPost()
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
                    }
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
    
    func createPost() {
        guard let lat = latitude,
              let lon = longitude else {
            return
        }
        
        let post = Post(latitude: lat,
                        longitude: lon,
                        description: "deneme")
        
        firebaseServices.addNewEntry(post: post, completion: { result in
            switch result {
            case .success():
                print("konum oluşturuldu")
            case .failure(_):
                print("konum oluşturulamadı")
            }
        })
    }
    
    
    
    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            ReportView()
        }
    }
}
