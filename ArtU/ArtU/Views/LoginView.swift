//
//  LoginView.swift
//  ArtU
//
//  Created by Trav Feller on 10/19/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var signinViewController: SigninViewController
    @Binding var isLogin: Bool

    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            Image("green_background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                
            VStack {
                Text("The Artist")
                    .font(.system(size: 50, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
                    .padding(.top, 50)
                    .padding(.bottom, 0)

                Text("Login")
                    .padding()
                    .font(.system(size: 50, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .frame(height: 78)
                    .padding(.top, 0)
                    .padding(.bottom, 10)

                VStack {
                    HStack {
                        Text("Email")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .heavy, design: .rounded))
                            .padding(.leading, 1)
                        Spacer()
                        Button(action: {
                            isLogin = !isLogin
                        }, label: {
                            Text("Sign up!")
                                .font(.system(size: 15, weight: .heavy, design: .rounded))
                                .foregroundColor(Color.white)
                                .shadow(color: .black, radius: 1)
                                .bold()
                                .padding(.bottom, 0)
                                .padding(.top, 0)
                        })
                        .padding(.bottom, 0)
                    }.frame(width: 340, height: 10)
                    
                    TextField("Email", text: $username)
                        .textFieldStyle(ShortTextField())
                    
                    HStack {
                        Text("Password")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .heavy, design: .rounded))
                            .padding(.leading, 2)
                        Spacer()
                    }.frame(width: 340, height: 10)
                        .padding(.top, 5)
                    SecureField("Password", text: $password)
                        .textFieldStyle(ShortTextField())
                }
                .padding(.bottom)
                HStack {
                    Button(action: {
                        Task {
                            let loginUser = LoginUser(username: username, password: password)
                            signinViewController.login(loginUser: loginUser)
                        }
                    }) {
                        Text("Login")
                            .padding()
                            .frame(width: 250, height: 30)
                            .font(.system(size: 30, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .padding(.bottom, 30)
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

struct LoginView_Previews: PreviewProvider {
    @State static var isLogin = false
    @ObservedObject static var signinViewController = SigninViewController()

    static var previews: some View {
        LoginView(signinViewController: signinViewController, isLogin: $isLogin)
    }
}
