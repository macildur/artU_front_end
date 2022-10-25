//
//  SigninView.swift
//  ArtU
//
//  Created by Trav Feller on 10/24/22.
//

import SwiftUI

struct SigninView: View {
    @ObservedObject var signinViewController: SigninViewController
    @State var isLogin = true

    var body: some View {
        if (isLogin) {
            LoginView(signinViewController: signinViewController, isLogin: $isLogin)
        } else {
            RegisterView(signinViewController: signinViewController, isLogin: $isLogin)
        }
    }
}

struct SigninView_Previews: PreviewProvider {
    @State static var signinSuccess = false
    @State static var signinViewController = SigninViewController()
    
    static var previews: some View {
        SigninView(signinViewController: signinViewController)
    }
}
