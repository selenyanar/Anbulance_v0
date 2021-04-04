//
//  LoginView.swift
//  Anbulance
//
//  Created by Selen Yanar on 4.04.2021.
//

import SwiftUI

struct LoginView: View {
    
    @State var email = ""
    @State var parola = ""
    
    var body: some View {
        
        VStack {
            Image("AnbulanceLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(80.0)
                .edgesIgnoringSafeArea(.all)
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
            }
            
            Button(
                action: {
                    print("Giriş yap")},
                label: {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 300, height: 50, alignment: .center)
                        .foregroundColor(Color("AnbulanceBlue"))
                        .cornerRadius(8)
                        .padding(.top, 100.0)
                })
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
