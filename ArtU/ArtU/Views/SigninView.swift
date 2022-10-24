//
//  SigninView.swift
//  ArtU
//
//  Created by Trav Feller on 10/24/22.
//

import SwiftUI

struct SigninView: View {
    @ObservedObject var loginViewController: LoginViewController
    @Binding var signinSuccess: Bool

    var body: some View {
        if (loginViewController.user == nil) {
            LoginView(loginViewController: loginViewController, signinSuccess: $signinSuccess)
        } else {
            ProfileView(signinSuccess: $signinSuccess)
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    @State static var signinSuccess = false
    @State static var loginViewController = LoginViewController()
    
    static var previews: some View {
        SigninView(loginViewController: loginViewController, signinSuccess: $signinSuccess)
    }
}
