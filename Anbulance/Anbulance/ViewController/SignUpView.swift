//
//  SignUpView.swift
//  Anbulance
//
//  Created by Selen Yanar on 4.04.2021.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    
    @State var ad = ""
    @State var soyad = ""
    @State var email = ""
    @State var parola = ""
    @State var reparola = ""
    @State var visible = false
    @State var revisible = false
    @State var alert = false
    @State var error = ""
    @State var willMoveToNextScreen =  true
    
    var body: some View {
        
        ZStack {
            
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
                        .autocapitalization(.none)
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
                        TextField("Parola oluştur", text: self.$parola)
                            .autocapitalization(.none)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 300, height: 50, alignment: .center)
                            .cornerRadius(8)
                        
                    } else {
                        SecureField("Parola oluştur", text: self.$parola)
                            .autocapitalization(.none)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 300, height: 50, alignment: .center)
                            .cornerRadius(8)
                        
                    }
                    
                }
                HStack {
                    Button(action: {
                        self.revisible.toggle()
                        
                    }) {
                        Image(systemName: self.revisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(Color("AnbulanceBlue"))
                    }
                    
                    if self.revisible {
                        TextField("Parolayı yeniden gir", text: self.$reparola)
                            .autocapitalization(.none)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 300, height: 50, alignment: .center)
                            .cornerRadius(8)
                        
                    } else {
                        SecureField("Parolayı yeniden gir", text: self.$reparola)
                            .autocapitalization(.none)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 300, height: 50, alignment: .center)
                            .cornerRadius(8)
                        
                    }
                }.padding(.bottom, 130.0)
                
                NavigationLink(
                    destination: MapView(),
                    label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 5)
                                .frame(width: 300, height: 50, alignment: .center)
                                .foregroundColor(Color("AnbulanceBlue"))
                                .cornerRadius(8)
                            Text("Kaydol")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.system(size: 18))
                        }
                        .simultaneousGesture(TapGesture().onEnded{
                            self.register()
                                        })
                        .padding(.bottom, 20)
                    })
                
            }
            
            if self.alert{
                
                ErrorView(alert: self.$alert, error: self.$error)
                
            }
        }
    }
    
    func register() {
        
        if self.email != "" {
            
            if self.parola == self.reparola {
                
                Auth.auth().createUser(withEmail: self.email, password: self.parola) { (ress, err) in
                    
                    if err != nil {
                        
                        self.error = err!.localizedDescription
                        self.alert.toggle()
                        
                        return
                        
                    }
                    
                    print("success")
                    
                    UserDefaults.standard.set(true, forKey: "status")
                    NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                    
                }
                
                
            } else {
                
                self.error = "Parolalar eşleşmiyor"
                self.alert.toggle()
                
            }
        } else {
            
            self.error = "Lütfen bütün alanları doldurun"
            self.alert.toggle()
            
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
