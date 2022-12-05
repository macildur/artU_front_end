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
    
    @State var animationAmount: Double = 0;
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
//            BackgroundImageView()
                
            VStack {
                Text("ArtU")
                    .padding()
                    .frame(height: 78)
                    .foregroundColor(Color.brown)
                    .font(.custom("Lora", size: 50))
                    .tracking(5)
                    .padding(.top, 30)
                    .padding(.bottom, 30)

                VStack {
                    HStack {
                        Text("Email")
                            .foregroundColor(.brown)
                            .font(.custom("Lora", size: 15))
                            .padding(.leading, 1)
                        Spacer()
                        Button(action: {
                            signinViewController.resetErrors()
                            isLogin = !isLogin
                        }, label: {
                            Text("New artist?")
                                .font(.custom("Lora", size: 15))
                                .foregroundColor(Color.white)
                                .frame(width: 100)
                                .background(.brown)
                                .bold()
                                .cornerRadius(10.0)
                                .shadow(color: .gray, radius: 1)
                                .padding(.bottom, 0)
                                .padding(.top, 0)
                        })
                        .padding(.bottom, 0)
                    }.frame(width: 340, height: 10)
                    
                    TextField("example@artu.com", text: $username)
                        .font(.custom("Lora", size: 17))
                        .textFieldStyle(ShortTextField())
                        .textContentType(.emailAddress)
                        .accentColor(Color("placeholderTextColor"))
                        .autocapitalization(.none)
                        .opacity(signinViewController.loginShouldShowError ? 0.5 : 1.0)
                        .animation(_: Animation.default.repeatCount(1).speed(1), value: signinViewController.loginShouldShowError)
                        .background(.red, in: RoundedRectangle(cornerRadius: 5))
                        .modifier(ShakeEffect(shakes: signinViewController.loginShouldShake ? 2 : 0))
                        .animation(_: Animation.default.repeatCount(3).speed(2), value: signinViewController.loginShouldShake)
                        .onTapGesture {
                            signinViewController.clearRedErrors()
                        }
                    
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
                            .foregroundColor(.brown)
                            .font(.custom("Lora", size: 15))
                            .padding(.leading, 2)
                        Spacer()
                    }.frame(width: 340, height: 10)
                    
                    SecureField("**********", text: $password)
                        .font(.custom("Lora", size: 17))
                        .textFieldStyle(ShortTextField())
                        .opacity(signinViewController.loginShouldShowError ? 0.5 : 1.0)
                        .animation(_: Animation.default.repeatCount(1).speed(1), value: signinViewController.loginShouldShowError)
                        .background(.red, in: RoundedRectangle(cornerRadius: 5))
                        .modifier(ShakeEffect(shakes: signinViewController.loginShouldShake ? 2 : 0))
                        .animation(_: Animation.default.repeatCount(3).speed(2), value: signinViewController.loginShouldShake)
                        .onTapGesture {
                            signinViewController.clearRedErrors()
                        }
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
                            .background(.brown)
                            .font(.custom("Lora", size: 25))
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
