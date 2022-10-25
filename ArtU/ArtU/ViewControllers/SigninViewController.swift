//
//  UserViewController.swift
//  ArtU
//
//  Created by Trav Feller on 10/25/22.
//

import Foundation
import SwiftUI

class SigninViewController: ObservableObject {
    @Published var user: User?
    @Published var signinSuccess: Bool
    @Published var isLoading: Bool
    
    init() {
        signinSuccess = false
        isLoading = false
    }
    
    func login(loginUser: LoginUser) {
        DispatchQueue.main.async {
            self.isLoading = true
            
            let body: [String: String] = ["username": loginUser.username, "password": loginUser.password]
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            
            guard let url = URL(string: "https://x2qel1wnse.execute-api.us-east-2.amazonaws.com/dev/Login") else {
                print("URL creation error")
                self.isLoading = false
                return
            }

            var request = URLRequest(url: url)
            request.setValue("\(String(describing: finalBody?.count))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = finalBody
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                        
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    self.isLoading = false
                    return
                }

                self.user = try? JSONDecoder().decode(User.self, from: data)
                print(self.user ?? "NO USER")
                if self.user != nil {
                    self.signinSuccess = true;
                }
                self.isLoading = false
            }
        
            task.resume()
        }
    }

    func register(registerUser: RegisterUser) {
        DispatchQueue.main.async {
            self.isLoading = true
            
            let body: [String: String] = ["username": registerUser.username, "password": registerUser.password, "firstname": registerUser.firstName, "lastname": registerUser.lastName]
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            
            guard let url = URL(string: "https://x2qel1wnse.execute-api.us-east-2.amazonaws.com/dev/register") else {
                print("URL creation error")
                self.isLoading = false
                return
            }

            var request = URLRequest(url: url)
            request.setValue("\(String(describing: finalBody?.count))", forHTTPHeaderField: "Content-Length")
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            request.httpBody = finalBody
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let data = data, error == nil else {
                    print(error?.localizedDescription ?? "No data")
                    self.isLoading = false
                    return
                }
                
                self.user = try? JSONDecoder().decode(User.self, from: data)
                print(self.user ?? "NO USER")
                if self.user != nil {
                    self.signinSuccess = true;
                }
                self.isLoading = false
            }

            task.resume()
        }
    }
}
