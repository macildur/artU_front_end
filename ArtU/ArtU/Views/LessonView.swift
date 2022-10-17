//
//  LessonView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/10/22.
//

// Mock Data
struct Lesson: Identifiable, Hashable {
    var id = UUID()
    let name: String
}
let mockLessons: [Lesson] = [
    .init(name: "Lesson 1"),
    .init(name: "Lesson 2"),
    .init(name: "Lesson 3"),
    .init(name: "Lesson 4")
]

import SwiftUI
import WebKit
import UIKit

class ViewController: UIViewController, WKUIDelegate {
    var webView: WKWebView!
      override func viewDidLoad() {
         super.viewDidLoad()
         let myURL = URL(string:"https://www.apple.com")
         let myRequest = URLRequest(url: myURL!)
         webView.load(myRequest)
      }
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
}

struct LessonView: View {
    
    var module: String
    
    var body: some View {
        VStack {
            Text(module + " Lessons")
                .font(.largeTitle.bold())
                .foregroundColor(Color.black)
                .padding()
            List(mockLessons) { lesson in
                NavigationLink(lesson.name, value: lesson)
            }.navigationDestination(for: Lesson.self) { lesson in
                VideoView(videoID: "CX-BdDHW0Ho")
            }
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var module = "Module 1"
    
    static var previews: some View {
        LessonView(module: module)
    }
}
