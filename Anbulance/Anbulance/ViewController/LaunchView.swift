//
//  ContentView.swift
//  Anbulance
//
//  Created by Selen Yanar on 4.04.2021.
//

import SwiftUI

struct LaunchView: View {
    
    var body: some View {
        VStack {
            Image("AnbulanceLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 50.0)
                .edgesIgnoringSafeArea(.all)
            Text("Anbulance")
                .fontWeight(.heavy)
                .foregroundColor(Color("AnbulanceBlue"))
                .font(.system(size: 35))
                .padding(.bottom, 100.0)
            Button(
                action: {
                    print("Giriş yap ekranına git")},
                label: {
                        RoundedRectangle(cornerRadius: 5)
                        .frame(width: 250, height: 50, alignment: .center)
                        .foregroundColor(.gray)
                        .padding()
                    })
            Button(
                action: {
                    print("Kaydol ekranına git")},
                label: {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 250, height: 50, alignment: .center)
                        .foregroundColor(Color("AnbulanceBlue"))
                    })
                
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
