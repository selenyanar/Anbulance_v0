//
//  ContentView.swift
//  Anbulance
//
//  Created by Selen Yanar on 4.04.2021.
//

import SwiftUI
import Firebase

struct LaunchView: View {
    
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    @State var alert = false
    @State var error = ""
    
    var body: some View {
        
        ZStack {
            NavigationView {
                
                VStack {
                    
                    if self.status {
                        
                        ReportView()
                        
                    } else {
                           
                        VStack {
                            Image("AnbulanceLogo")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(.horizontal, 50.0)
                                .edgesIgnoringSafeArea(.all)
                            Text("Anbulance")
                                .fontWeight(.heavy)
                                .foregroundColor(Color("AnbulanceBlue"))
                                .font(.system(size: 40))
                                .padding(.bottom, 100.0)
                            NavigationLink(
                                destination: LoginView(),
                                label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 250, height: 50, alignment: .center)
                                            .foregroundColor(.gray)
                                            .padding()
                                        Text("Giriş yap")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                    }
                                })
                            NavigationLink(
                                destination: SignUpView(),
                                label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 5)
                                            .frame(width: 250, height: 50, alignment: .center)
                                            .foregroundColor(Color("AnbulanceBlue"))
                                        Text("Kaydol")
                                            .foregroundColor(.white)
                                            .font(.system(size: 20))
                                            .fontWeight(.bold)
                                    }
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
        }
        
        if self.alert {
            
            ErrorView(alert: self.$alert, error: self.$error)
            
        }
    }
}


struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
            .preferredColorScheme(.light)
    }
}
