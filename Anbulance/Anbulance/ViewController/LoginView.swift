//
//  LoginView.swift
//  Anbulance
//
//  Created by Selen Yanar on 4.04.2021.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @State var email = ""
    @State var parola = ""
    @State var visible = false
    @State var alert = false
    @State var error = ""
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    
    var body: some View {
        
        ZStack {
            
            ZStack {
                
                VStack {
                    
                    if self.status {
                        
                        MapView()
                        
                    } else {
                        
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
                            
                            HStack {
                                Button(action: {
                                    //Forgot password action
                                }) {
                                    
                                    Text("Parolamı unuttum")
                                        .fontWeight(.bold)
                                        .foregroundColor(Color("AnbulanceBlue"))
                                        .padding(.leading, 180.0)
                                    
                                }
                            }
                            
                            Button(
                                action: {
                                    self.verify()},
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
                .onAppear {
                    NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) { (_) in
                        
                        self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                        
                    }
                    
                }
            }
            
            if self.alert {
                
                ErrorView(alert: self.$alert, error: self.$error)
                
            }
        }
    }
    
    func verify() {
        
        if self.email != "" && self.parola != "" {
            
            Auth.auth().signIn(withEmail: self.email, password: self.parola) { res, err in
                
                if err != nil{
                    
                    self.error = err!.localizedDescription
                    self.alert.toggle()
                    return
                }
                
                print("Başarılı")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
            
            
        } else {
            self.error = "Lütfen bütün alanları doldurun"
            self.alert.toggle()
            
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


struct ErrorView: View {
    
    @State var color = Color.black.opacity(0.7)
    @Binding var alert : Bool
    @Binding var error: String
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                HStack {
                    Text("Hata")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(self.color)
                    
                    Spacer()
                }
                .padding(.horizontal, 25)
                
                Text(self.error)
                    .foregroundColor(self.color)
                    .padding(.top)
                    .padding(.horizontal, 25)
                
                Button(action: {
                    
                    self.alert.toggle()
                    
                }) {
                    
                    Text("İptal")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width-120)
                }
                .background(Color("AnbulanceBlue"))
                .cornerRadius(10)
                .padding(.top, 25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width-70)
            .background(Color.white)
            .cornerRadius(15)
            .border(Color("AnbulanceBlue"))
        }
    }
}

