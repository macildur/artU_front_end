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
                Text("Sign up")
                    .padding()
                    .font(.system(size: 50, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .frame(height: 100)
                    .padding(.top, 30)
                    .padding(.bottom, 10)

                VStack {
                    HStack {
                        VStack {
                            HStack {
                                Text("First Name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                                    .padding(.leading, 1)
                                Spacer()
                            }.frame(width: 340, height: 10)
                            
                            TextField("Gustav", text: $firstName)
                                .textFieldStyle(ShortTextField())
                                .textContentType(.givenName)
                            HStack {
                                if signinViewController.firstName_error != nil {
                                    Text(signinViewController.firstName_error!)
                                        .foregroundColor(.red)
                                        .font(.system(size: 13, weight: .medium, design: .default))
                                        .shadow(color: .black, radius: 1)
                                        .padding(.leading, 1)
                                }
                                Spacer()
                            }.frame(width: 340, height: 10)
                        }
                        VStack {
                            HStack {
                                Text("Last Name")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                                    .padding(.leading, 1)
                                Spacer()
                                Button(action: {
                                    signinViewController.resetErrors()
                                    isLogin = !isLogin
                                }, label: {
                                    Text("Current artist?")
                                        .font(.system(size: 15, weight: .heavy, design: .rounded))
                                        .foregroundColor(Color.white)
                                        .frame(width: 130)
                                        .background(.green)
                                        .bold()
                                        .cornerRadius(10.0)
                                        .shadow(color: .gray, radius: 1)
                                        .padding(.bottom, 0)
                                        .padding(.top, 0)
                                })
                                .padding(.bottom, 0)
                            }.frame(width: 340, height: 10)
                            
                            TextField("Klimt", text: $lastName)
                                .textFieldStyle(ShortTextField())
                                .textContentType(.familyName)
                            HStack {
                                if signinViewController.lastName_error != nil {
                                    Text(signinViewController.lastName_error!)
                                        .foregroundColor(.red)
                                        .font(.system(size: 13, weight: .medium, design: .default))
                                        .shadow(color: .black, radius: 1)
                                        .padding(.leading, 1)
                                }
                                Spacer()
                            }.frame(width: 340, height: 10)
                        }
                    }
                    
                    HStack {
                        VStack {
                            HStack {
                                Text("Email")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                                    .padding(.leading, 2)
                                Spacer()
                            }.frame(width: 340, height: 10)
                                .padding(.top, 5)
                            TextField("g.klimt@artu.com", text: $username)
                                .textFieldStyle(ShortTextField())
                                .textContentType(.emailAddress)
                                .accentColor(Color("placeholderTextColor"))
                            HStack {
                                if signinViewController.username_error != nil {
                                    Text(signinViewController.username_error!)
                                        .foregroundColor(.red)
                                        .font(.system(size: 13, weight: .medium, design: .default))
                                        .shadow(color: .black, radius: 1)
                                        .padding(.leading, 1)
                                }
                                Spacer()
                            }.frame(width: 340, height: 10)
                                
                        }
                        VStack {
                            HStack {
                                Text("Password")
                                    .foregroundColor(.white)
                                    .font(.system(size: 15, weight: .heavy, design: .rounded))
                                    .padding(.leading, 2)
                                Spacer()
                            }.frame(width: 340, height: 10)
                                .padding(.top, 5)
                            SecureField("*********", text: $password)
                                .textFieldStyle(ShortTextField())
                                .textContentType(.password)
                            HStack {
                                if signinViewController.password_error != nil {
                                    Text(signinViewController.password_error!)
                                        .foregroundColor(.red)
                                        .font(.system(size: 13, weight: .medium, design: .default))
                                        .shadow(color: .black, radius: 1)
                                        .padding(.leading, 1)
                                }
                                Spacer()
                            }.frame(width: 340, height: 10)
                        }
                    }
                }
                .padding(.bottom)
                HStack {
                    Button(action: {
                        Task {
                            let registerUser = RegisterUser(username: username, password: password, firstName: firstName, lastName: lastName)
                            if !signinViewController.isValidRegisterUser(registerUser: registerUser) {
                                signinViewController.register(registerUser: registerUser)
                            }
                        }
                    }) {
                        Text("Sign up!")
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(.green)
                            .font(.system(size: 25, weight: .heavy, design: .rounded))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
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

struct RegisterView_Previews: PreviewProvider {
    @State static var isLogin = false
    @ObservedObject static var signinViewController = SigninViewController()

    static var previews: some View {
        RegisterView(signinViewController: signinViewController, isLogin: $isLogin)
    }
}
