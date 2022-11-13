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
        UINavigationBar.applyCustomAppearance()
    }

    var body: some Scene {
        WindowGroup {
            if !signinViewController.signinSuccess {
                //CameraView()
                //ImageView(tags: ["tag1"])
                SigninView(signinViewController: signinViewController)
            } else {
                SkillView()
            }
        }
    }
}

fileprivate extension UINavigationBar {
    
    static func applyCustomAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
