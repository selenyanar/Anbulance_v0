//
//  TextFieldModel.swift
//  Anbulance
//
//  Created by Selen Yanar on 9.04.2021.
//

import Foundation
import UIKit
import SwiftUI


struct TextView: UIViewRepresentable {
    
    func makeUIView(context: Context) -> UITextView {
        
        let textView = UITextView()
        
        textView.autocapitalizationType = .sentences
        textView.isUserInteractionEnabled = true
        
        return UITextView()
    }
    
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        // Update the view
    }
}
