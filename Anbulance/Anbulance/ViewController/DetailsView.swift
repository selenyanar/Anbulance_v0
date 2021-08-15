//
//  DetailsView.swift
//  Anbulance
//
//  Created by Selen Yanar on 1.08.2021.
//

import SwiftUI


struct DetailsView: View {
    
    @State private var description: String = ""
    
    var body: some View {
        VStack{
            Rectangle()
                .fill(Color.white)
                .frame(width: 300, height: 250, alignment: .center)
                .cornerRadius(8)
            TextField("Açıklama", text: $description)
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
                .padding(.top, 40.0)
            
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
                    }
                    .padding(.top, 40.0)
                })
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView()
    }
}
