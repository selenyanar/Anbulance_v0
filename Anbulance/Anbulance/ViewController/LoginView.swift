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
    @State var visible = false
    
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
                TextField("Email", text: self.$email)
                    .frame(width: 300, height: 50, alignment: .center)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(8)
            }
            HStack {
                
                Button(action: {
                    self.visible.toggle()
                    
                }) {
                    Image(systemName: self.visible ? "eye.slash.fill" : "eye.fill")
                        .foregroundColor(Color("AnbulanceBlue"))
                }
   
                if self.visible {
                    TextField("Parola", text: self.$parola)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 50, alignment: .center)
                        .cornerRadius(8)
                    
                } else {
                    SecureField("Parola", text: self.$parola)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: 300, height: 50, alignment: .center)
                        .cornerRadius(8)
                    
                }
    
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
