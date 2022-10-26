//
//  LoginView.swift
//  ArtU
//
//  Created by Trav Feller on 10/19/22.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var signinViewController: SigninViewController
    @Binding var isLogin: Bool

    @State var username: String = ""
    @State var password: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    
    var body: some View {
        ZStack {
            Image("green_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 90.0, height: 90.0)
                    .foregroundColor(Color.white)
                    .padding()
                
                Button(action: {
                    isLogin = !isLogin
                    }, label: {
                        Text("Login")
                            .frame(width: 630, height: 20, alignment: .bottomTrailing)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.bottom, 0)
                            .padding(.top, 0)
                })
                    .padding(.bottom, 0)
                
                HStack {
                    TextField("Username", text: $username)
                        .padding()
                        .background(.gray.opacity(50))
                        .cornerRadius(10.0)
                        .padding(.leading, 50)
                        .padding(.trailing, 20)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(.gray)
                        .cornerRadius(10.0)
                        .padding(.leading, 20)
                        .padding(.trailing, 50)
                }
                HStack {
                    TextField("First Name", text: $firstName)
                        .padding()
                        .background(.gray.opacity(50))
                        .cornerRadius(10.0)
                        .padding(.bottom, 20)
                        .padding(.leading, 50)
                        .padding(.trailing, 20)
                    TextField("Last Name", text: $lastName)
                        .padding()
                        .background(.gray)
                        .cornerRadius(10.0)
                        .padding(.bottom, 20)
                        .padding(.leading, 20)
                        .padding(.trailing, 50)
                }
                
                HStack {
                    Button(action: {
                        Task {
                            let registerUser = RegisterUser(username: username, password: password, firstName: firstName, lastName: lastName)
                            signinViewController.register(registerUser: registerUser)
                        }
                    }) {
                        Text("Register")
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(.green)
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                    }
                }
            }
            if signinViewController.isLoading {
                VisualEffectView()
                LoaderView()
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    @State static var isLogin = false
    @ObservedObject static var signinViewController = SigninViewController()

    static var previews: some View {
        RegisterView(signinViewController: signinViewController, isLogin: $isLogin)
    }
}
