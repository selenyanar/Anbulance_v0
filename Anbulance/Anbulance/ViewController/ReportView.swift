//
//  ReportView.swift
//  Anbulance
//
//  Created by Selen Yanar on 9.04.2021.
//

import SwiftUI

struct ReportView: View {
    
    
    var body: some View {
        VStack {
            TextView()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(width: 300, height: 200, alignment: .center)
                .cornerRadius(8)
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.blue, lineWidth: 1))
            ZStack {
                Button(
                    action: {
                        print("Yayınla")},
                    label: {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 300, height: 50, alignment: .center)
                            .foregroundColor(Color("AnbulanceBlue"))
                            .cornerRadius(8)
                            .offset(y:100)
                    })
                Text("Yayınla")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .offset(y:100)
            }
        }
    }
    
    struct ReportView_Previews: PreviewProvider {
        static var previews: some View {
            ReportView()
        }
    }
}
