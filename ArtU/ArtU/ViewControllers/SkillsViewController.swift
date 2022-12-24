import Foundation
import SwiftUI

class SkillsViewController: ObservableObject {
    @Published var isLoading: Bool
    @Published var images: SkillsResponse?
    @Published var image: Image
    
    init() {
        isLoading = false
        image = Image("art_u_launch_screen")
    }
    
    func getImages(primaryCategory: String, secondaryCategory: String) {
        DispatchQueue.main.async {
            self.isLoading = true
            
            let body: [String: String] = ["primary_category": primaryCategory, "secondary_category": secondaryCategory]
            let finalBody = try? JSONSerialization.data(withJSONObject: body)
            
            guard let url = URL(string: "https://x2qel1wnse.execute-api.us-east-2.amazonaws.com/dev/Skills") else {
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
                    self.images = try? JSONDecoder().decode(SkillsResponse.self, from: data)
                    
                    if (self.images?.images != nil) {
                        let upperBound = (self.images != nil) ? self.images?.images.count : 0
                        let randomInt = Int.random(in: 0..<(upperBound!))
                        let urlString = self.images?.images[randomInt]
                        DispatchQueue.global().async {
                            let data = try? Data(contentsOf: (URL(string: urlString ?? "https://skill-images-artu.s3.us-east-2.amazonaws.com/people_faces_female/alexandru-zdrobau-BGz8vO3pK8k-unsplash.jpg"))!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
                            DispatchQueue.main.async {
                                self.image = Image(uiImage: UIImage(data: data!)!)
                                self.isLoading = false
                            }
                        }
                    }


                }
            }
            
            task.resume()
        }
    }
}
