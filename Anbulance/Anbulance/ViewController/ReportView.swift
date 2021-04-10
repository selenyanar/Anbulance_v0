//
//  ReportView.swift
//  Anbulance
//
//  Created by Selen Yanar on 9.04.2021.
//

import SwiftUI

struct ReportView: View {
    @State private var image: Image?
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(width: 300, height: 220, alignment: .center)
                    .cornerRadius(8)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                
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
            }
            TextView()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                .offset(y: -50)
            ZStack {
                Button(
                    action: {
                        print("Yayınla")},
                    label: {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 300, height: 50, alignment: .center)
                            .foregroundColor(Color("AnbulanceBlue"))
                            .cornerRadius(8)
                    })
                Text("Yayınla")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
            }
            ZStack {
                Button(
                    action: {
                        print("İptal")},
                    label: {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 300, height: 50, alignment: .center)
                            .foregroundColor(.gray)
                            .cornerRadius(8)
                    })
                Text("İptal")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .padding()
            }
        }
    }
    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            ReportView()
        }
    }
}
