//
//  ArtUApp.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

import SwiftUI

@main
struct ArtUApp: App {
    @ObservedObject var signinViewController: SigninViewController

    init() {
        signinViewController = SigninViewController()
    }

    var body: some Scene {
        WindowGroup {
            if !signinViewController.signinSuccess {
                SigninView(signinViewController: signinViewController)
            } else {
                SkillView()
            }
        }
    }
}
