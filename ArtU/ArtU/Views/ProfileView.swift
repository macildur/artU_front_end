//
//  LoginView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

//Mock Data
var mockUsers = ["Trav", "Vinh"]

import SwiftUI

struct ProfileView: View {
    @Binding var signinSuccess: Bool
    
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
                
                HStack {
                    ForEach(mockUsers, id: \.self) { user in
                        VStack {
                            Button(action: {
                                signinSuccess = true
                            },
                                   label: {
                                Image(systemName: "person.circle.fill")
                                    .resizable()
                                    .frame(width: 90.0, height: 90.0)
                                    .foregroundColor(Color.white)
                            })
                            Text(user)
                                .foregroundColor(.white)
                                .font(Font.title2)
                                .fontWeight(Font.Weight.bold)
                        }.padding()
                    }
                    //For the new User
                    VStack {
                        Button(action: {
                            // login() function
                        },
                               label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 90.0, height: 90.0)
                                .foregroundColor(Color.white)
                        })
                        Text("other")
                            .foregroundColor(.white)
                            .font(Font.title2)
                            .fontWeight(Font.Weight.bold)
                    }.padding()
                }
            }
            .padding()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    @State static var signinSuccess = false

    static var previews: some View {
        ProfileView(signinSuccess: $signinSuccess)
    }
}

func login() {
    
}
