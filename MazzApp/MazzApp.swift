//
//  MazzAppApp.swift
//  MazzApp
//
//  Created by Agnes Triselia Yudia on 23/07/25.
//

import SwiftUI

@main
struct MazzApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                TabBarView()
            } else {
                SignInView()
            }
        }
    }
}
