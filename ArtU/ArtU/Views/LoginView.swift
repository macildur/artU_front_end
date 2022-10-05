//
//  LoginView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        ZStack {
            Image("mountains")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                
            VStack {
                Text("The Becoming Artist")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color.white)
                    .padding()
                
                Button(action: {
                    // login() function
                },
                label: {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(Color.white)
                })
            }
            .padding()
        }
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

func login() {
    
}
