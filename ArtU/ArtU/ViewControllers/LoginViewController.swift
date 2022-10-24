//
//  Lambda.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

import Foundation

class LoginViewController: ObservableObject {
    @Published var user: User?
    
    func loadData(loginUser: LoginUser) async {
        print("loginUser")
        print(loginUser)
        let body: [String: String] = ["username": loginUser.username, "password": loginUser.password]
        let finalBody = try? JSONSerialization.data(withJSONObject: body)
        
        guard let url = URL(string: "https://x2qel1wnse.execute-api.us-east-2.amazonaws.com/dev/Login") else {
            print("URL creation error")
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
                return
            }

            self.user = try? JSONDecoder().decode(User.self, from: data)
            print(self.user ?? "NO USER")
        }
                
        task.resume()
    }
}
