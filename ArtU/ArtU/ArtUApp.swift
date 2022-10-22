//
//  ArtUApp.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

import SwiftUI

@main
struct ArtUApp: App {
    @State var signInSuccess = false
    @State var profileSelected = false

    var body: some Scene {
        WindowGroup {
            if !signInSuccess {
                LoginView(signinSuccess: $signInSuccess)
            } else {
                if !profileSelected {
                    ProfileView(profileSelected: $profileSelected)
                } else {
                    SkillView()
                }
            }
        }
    }
}
