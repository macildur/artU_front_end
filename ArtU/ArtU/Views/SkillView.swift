//
//  SkillView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

// Mock Data
var mockModules = ["Module 1", "Module 2", "Module 3", "Module 4"]

import SwiftUI

struct SkillView: View {
    @State private var showLessonView = false
    var body: some View {
        ZStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    Text("Skills")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color.black)
                        .padding()
                    ForEach(mockModules, id: \.self) { module in
                        NavigationView {
                        VStack {
                            NavigationLink(destination: LessonView(module: module), isActive: $showLessonView) { EmptyView() }
                            
                            Button(action: {
                                showLessonView = true
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
}

struct SkillView_Previews: PreviewProvider {
    static var previews: some View {
        SkillView()
    }
}
