//
//  SkillView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

// Mock Data
struct Module: Identifiable, Hashable {
    var id = UUID()
    let name: String
}
let mockModules: [Module] = [
    .init(name: "Module 1"),
    .init(name: "Module 2"),
    .init(name: "Module 3"),
    .init(name: "Module 4")
]

import SwiftUI

struct SkillView: View {
    @State private var showLessonView = false
    var body: some View {
        NavigationStack {
            VStack {
                Text("Skills")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color.black)
                    .padding()
                List(mockModules) { module in
                    NavigationLink(module.name, value: module)
                }.navigationDestination(for: Module.self) { module in
                    LessonView(module: module.name)
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
