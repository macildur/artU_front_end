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
    .init(name: "MODULE 1"),
    .init(name: "MODULE 2"),
    .init(name: "MODULE 3"),
    .init(name: "MODULE 4")
]

import SwiftUI

struct SkillView: View {
    @State private var showLessonView = false
    var body: some View {
        NavigationStack {
            ZStack {
                Image("green_background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    Text("Skills")
                        .font(.largeTitle.bold())
                        .foregroundColor(Color("OffWhite"))
                        .padding()
                    ForEach(mockModules) {module in
                        CustomNavLink(destination: LessonView(module: module.name), buttonType: {Text(module.name)}, moduleName: module.name)
                    }.padding()
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
