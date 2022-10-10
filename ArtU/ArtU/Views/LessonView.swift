//
//  LessonView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/10/22.
//

// Mock Data
var mockLessons = ["Lesson 1", "Lesson 2", "Lesson 3", "Lesson 4"]

import SwiftUI

struct LessonView: View {
    var module: String
    
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text(module + " lessons")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color.black)
                        .padding()
                    ForEach(mockLessons, id: \.self) { module in
                        VStack {
                            Button(action: {
                            },
                                   label: {
                                ZStack {
                                    Image(systemName: "rectangle.fill")
                                        .resizable()
                                        .frame(width: 180.0, height: 90.0)
                                        .foregroundColor(Color.black)
                                    Text(module)
                                        .foregroundColor(.white)
                                        .font(Font.title2)
                                        .fontWeight(Font.Weight.bold)
                                }
                            })
                        }
                    }
                }
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
