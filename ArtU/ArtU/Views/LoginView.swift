//
//  LoginView.swift
//  ArtU
//
//  Created by Trav Feller on 10/19/22.
//

import SwiftUI

struct LoginView: View {
    @Binding var signinSuccess: Bool
    
    @State var username: String = ""
    @State var password: String = ""
    @State var user: User?
    
    var body: some View {
        ZStack {
            Image("mountains")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                
            VStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 90.0, height: 90.0)
                    .foregroundColor(Color.white)
                    .padding()
                
                HStack {
                    TextField("Username", text: $username)
                        .padding()
                        .background(.gray.opacity(50))
                        .cornerRadius(10.0)
                        .padding(.bottom, 20)
                        .padding(.leading, 50)
                        .padding(.trailing, 20)
                    SecureField("Password", text: $password)
                        .padding()
                        .background(.gray)
                        .cornerRadius(10.0)
                        .padding(.bottom, 20)
                        .padding(.leading, 20)
                        .padding(.trailing, 50)
                }
                
                //Login/Register buttons
                HStack {
                    Button(action: {
                        Task {
                            let loginUser = LoginUser(username: username, password: password)
                            let user = await LoginViewController().loadData(loginUser: loginUser)
                            print("GOT THE USERRRR")
                            print(user)
                        }

                        
                    }) {
                        Text("Login")
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                            .padding(.trailing, 20)
                    }
                    Button(action: {print("Register")}) {
                        Text("Register")
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10.0)
                            .padding(.leading, 20)
                    }
                }
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    @State static var signinSuccess = false

    static var previews: some View {

        LoginView(signinSuccess: $signinSuccess)
    }
}
