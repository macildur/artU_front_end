//
//  LoginView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Text("The Becoming Artist")
                .padding()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
