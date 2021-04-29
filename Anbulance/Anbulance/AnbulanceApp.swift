//
//  AnbulanceApp.swift
//  Anbulance
//
//  Created by Selen Yanar on 4.04.2021.
//

import SwiftUI
import Firebase

@main
struct AnbulanceApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LaunchView()
        }
    }
}
