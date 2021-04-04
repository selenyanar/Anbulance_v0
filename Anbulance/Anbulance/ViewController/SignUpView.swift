//
//  SignUpView.swift
//  Anbulance
//
//  Created by Selen Yanar on 4.04.2021.
//

import SwiftUI

struct SignUpView: View {
    
    @State var ad = ""
    @State var soyad = ""
    @State var email = ""
    @State var parola = ""
    
    var body: some View {
        VStack {
            Image("AnbulanceLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding([.top, .leading, .trailing], 60.0)
                .edgesIgnoringSafeArea(.all)
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                TextField("Ad", text: $ad)
                    .frame(width: 300, height: 50, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(8)
            }.padding(.top, 10.0)
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                TextField("Soyad", text: $soyad)
                    .frame(width: 300, height: 50, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(8)
            }
            HStack {
                Image(systemName: "envelope")
                    .foregroundColor(.gray)
                TextField("Email", text: $email)
                    .frame(width: 300, height: 50, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(8)
            }
            HStack {
                Image(systemName: "key")
                    .foregroundColor(.gray)
                TextField("Parola", text: $parola)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300, height: 50, alignment: .center)
                    .cornerRadius(8)
            }.padding(.bottom, 250.0)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
