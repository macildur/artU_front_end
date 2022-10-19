//
//  Lambda.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

import Foundation

class LoginAPI: ObservableObject {
    @Published var user: User?
    
    func loadData(loginUser: LoginUser) async {
        guard let encodedLoginUser = try? JSONEncoder().encode(loginUser) else {
            print("Failed to encode loginUser")
            return
        }

        guard let url = URL(string: "https://zrbkbee26a.execute-api.us-east-2.amazonaws.com/default/Login") else {
            print("URL creation error")
            return
        }

        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"

        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encodedLoginUser)
            user = try JSONDecoder().decode(User.self, from: data)
        } catch {
            print("Login failed.")
        }
        
        
    }
}
