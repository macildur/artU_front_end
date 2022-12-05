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
            // BackgroundImageView()
                
            VStack {
                Text("ArtU")
                    .padding()
                    .frame(height: 78)
                    .foregroundColor(Color.brown)
                    .font(.custom("Lora", size: 36))
                    .tracking(5)
                    .padding(.top, 30)
                    .padding(.bottom, 20)

                VStack {
                    HStack {
                        Text("First Name")
                            .foregroundColor(.brown)
                            .font(.custom("Lora", size: 15))
                            .padding(.leading, 1)
                        Spacer()
                        Button(action: {
                            signinViewController.resetErrors()
                            isLogin = !isLogin
                        }, label: {
                            Text("Current artist?")
                                .font(.custom("Lora", size: 15))
                                .foregroundColor(Color.white)
                                .frame(width: 130)
                                .background(.brown)
                                .bold()
                                .cornerRadius(10.0)
                                .shadow(color: .gray, radius: 1)
                                .padding(.bottom, 0)
                                .padding(.top, 0)
                        })
                        .padding(.bottom, 0)
                    }.frame(width: 340, height: 10)
                    
                    TextField("First Name", text: $firstName)
                        .font(.custom("Lora", size: 17))
                        .textFieldStyle(ShortTextField())
                        .textContentType(.givenName)
                        .autocapitalization(.none)
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
                            .foregroundColor(.brown)
                            .font(.custom("Lora", size: 15))
                            .padding(.leading, 1)
                        Spacer()
                    }.frame(width: 340, height: 10)
                    
                    TextField("Last Name", text: $lastName)
                        .font(.custom("Lora", size: 17))
                        .textFieldStyle(ShortTextField())
                        .textContentType(.familyName)
                        .autocapitalization(.none)
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
                VStack {
                    HStack {
                        Text("Email")
                            .foregroundColor(.brown)
                            .font(.custom("Lora", size: 15))
                            .padding(.leading, 2)
                        Spacer()
                    }.frame(width: 340, height: 10)
                        .padding(.top, 5)
                    TextField("example@artu.com", text: $username)
                        .font(.custom("Lora", size: 17))
                        .textFieldStyle(ShortTextField())
                        .textContentType(.emailAddress)
                        .accentColor(Color("placeholderTextColor"))
                        .autocapitalization(.none)
                        .opacity(signinViewController.registerShouldShowError ? 0.5 : 1.0)
                        .animation(_: Animation.default.repeatCount(1).speed(1), value: signinViewController.registerShouldShowError)
                        .background(.red, in: RoundedRectangle(cornerRadius: 5))
                        .modifier(ShakeEffect(shakes: signinViewController.registerShouldShake ? 2 : 0))
                        .animation(_: Animation.default.repeatCount(3).speed(2), value: signinViewController.registerShouldShake)
                        .onTapGesture {
                            signinViewController.clearRedErrors()
                        }
                    
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
                            .foregroundColor(.brown)
                            .font(.custom("Lora", size: 15))
                            .padding(.leading, 2)
                        Spacer()
                    }.frame(width: 340, height: 10)
                        .padding(.top, 5)
                    SecureField("*********", text: $password)
                        .font(.custom("Lora", size: 17))
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
                        Text("Register!")
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(.brown)
                            .font(.custom("Lora", size: 25))
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                            .padding(.bottom, 30)
                            .opacity((username.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty) ? 0.6 : 1.0)
                    }.disabled(username.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty)
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
