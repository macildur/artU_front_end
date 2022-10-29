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
    
    @Published var firstName_error: String?
    @Published var lastName_error: String?
    @Published var username_error: String?
    @Published var password_error: String?

    
    init() {
        signinSuccess = false
        isLoading = false
    }
    
    func resetErrors() {
        firstName_error = nil
        lastName_error = nil
        username_error = nil
        password_error = nil
    }
    
    private func isValidEmail(_ email: String) -> Bool {        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func isValidLoginUser(loginUser: LoginUser) -> Bool {
        
        username_error = loginUser.username.isEmpty
            ? "Missing email"
            : nil
        password_error = loginUser.password.isEmpty ? "Missing password" : nil
        
        return firstName_error != nil || lastName_error != nil || username_error  != nil || password_error != nil
    }
    
    func isValidRegisterUser(registerUser: RegisterUser) -> Bool {
        
        firstName_error = registerUser.firstName.isEmpty ? "Missing first name" : nil
        lastName_error = registerUser.lastName.isEmpty ? "Missing last name" : nil
        username_error = registerUser.username.isEmpty
            ? "Missing email"
            : !isValidEmail(registerUser.username)
                ?"Invalid Email"
                : nil
        password_error = registerUser.password.isEmpty ? "Missing password" : nil
        
        return firstName_error != nil || lastName_error != nil || username_error  != nil || password_error != nil
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
                DispatchQueue.main.async {
                    self.user = try? JSONDecoder().decode(User.self, from: data)
                    print(self.user ?? "NO USER")
                    if self.user != nil {
                        self.signinSuccess = true;
                    }
                    self.isLoading = false
                }
            }
        
            task.resume()
        }
    }

    func register(registerUser: RegisterUser) {
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
            DispatchQueue.main.async {
                self.user = try? JSONDecoder().decode(User.self, from: data)
                print(self.user ?? "NO USER")
                if self.user != nil {
                    self.signinSuccess = true;
                }
                self.isLoading = false
            }
        }

        task.resume()
    }
}
