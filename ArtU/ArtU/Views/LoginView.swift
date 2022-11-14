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
            BackgroundImageView()
                
            VStack {
                Text("ArtU")
                    .padding()
                    .font(.system(size: 50, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .frame(height: 78)
                    .padding(.top, 30)
                    .padding(.bottom, 10)

                VStack {
                    HStack {
                        Text("Email")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .heavy, design: .rounded))
                            .padding(.leading, 1)
                        Spacer()
                        Button(action: {
                            signinViewController.resetErrors()
                            isLogin = !isLogin
                        }, label: {
                            Text("New artist?")
                                .font(.system(size: 15, weight: .heavy, design: .rounded))
                                .foregroundColor(Color.white)
                                .frame(width: 100)
                                .background(.green)
                                .bold()
                                .cornerRadius(10.0)
                                .shadow(color: .gray, radius: 1)
                                .padding(.bottom, 0)
                                .padding(.top, 0)
                        })
                        .padding(.bottom, 0)
                    }.frame(width: 340, height: 10)
                    
                    TextField("example@artu.com", text: $username)
                        .textFieldStyle(ShortTextField())
                        .textContentType(.emailAddress)
                        .accentColor(Color("placeholderTextColor"))
                        .autocapitalization(.none)
                    
                    HStack {
                        if signinViewController.username_error != nil {
                            Text(signinViewController.username_error!)
                                .foregroundColor(.red)
                                .font(.system(size: 13, weight: .heavy, design: .default))
                                .shadow(color: .black, radius: 1)
                                .padding(.leading, 1)
                        }
                        Spacer()
                    }.frame(width: 340, height: 10)
                    
                    HStack {
                        Text("Password")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .heavy, design: .rounded))
                            .padding(.leading, 2)
                        Spacer()
                    }.frame(width: 340, height: 10)
                    
                    SecureField("**********", text: $password)
                        .textFieldStyle(ShortTextField())
                    
                    HStack {
                        if signinViewController.password_error != nil {
                            Text(signinViewController.password_error!)
                                .foregroundColor(.red)
                                .font(.system(size: 13, weight: .heavy, design: .default))
                                .shadow(color: .black, radius: 1)
                                .padding(.leading, 1)
                        }
                        Spacer()
                    }.frame(width: 340, height: 10)
                }
                .padding(.bottom)
                HStack {
                    Button(action: {
                        Task {
                            let loginUser = LoginUser(username: username, password: password)
                            if !signinViewController.isValidLoginUser(loginUser: loginUser) {
                                signinViewController.login(loginUser: loginUser)
                            }
                        }
                    }) {
                        Text("Login!")
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(.green)
                            .font(.system(size: 25, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                            .padding(.bottom, 30)
                            .opacity((username.isEmpty || password.isEmpty) ? 0.6 : 1.0)
                    }.disabled(username.isEmpty || password.isEmpty)
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
