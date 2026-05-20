//
//  amilateApp.swift
//  amilate
//
//  Created by Iacopo Ghilardi on 13/03/26.
//

import SwiftUI

@main
struct AmilateApp: App {
    
    @State private var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                ContentView()
            } else {
                NavigationStack {
                    LandingView()
                }
            }
        }
    }
}
