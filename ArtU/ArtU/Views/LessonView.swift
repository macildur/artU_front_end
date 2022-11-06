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

struct LessonView: View {
    
    var module: String
    
    var body: some View {
        VStack {
            Text(module + " Lessons")
                .font(.largeTitle.bold())
                .foregroundColor(Color.black)
                .padding()
            ForEach(mockLessons) {lesson in
                CustomNavLink(destination: VideoView(videoID: "CX-BdDHW0Ho"), buttonType: {Text(lesson.name)}, moduleName: lesson.name)
            }
        }
    }
}

struct LessonView_Previews: PreviewProvider {
    static var module = "Module 1"
    
    static var previews: some View {
        LessonView(module: module).previewInterfaceOrientation(.landscapeLeft)
    }
}
