//
//  SkillView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

let categories: [Category] = [
    .init(categoryId: 1, name: "People"),
    .init(categoryId: 2, name: "Landscape"),
    .init(categoryId: 3, name: "Animals"),
    .init(categoryId: 4, name: "Mystery"),
]

import SwiftUI

struct SkillView: View {
    @State private var showLessonView = false
    var body: some View {
        NavigationStack {
            ZStack {
                    VStack {
                        ScrollView(showsIndicators: false) {
                            Text("Skills")
                                .font(.custom("Lora", size: 36))
                                .foregroundColor(Color.black)
                                .padding()
                                .padding(.bottom, 35)
                            ForEach(categories, id: \.self) { category in
                                CustomNavLink(destination: LessonView(category: category), buttonType: {Text(category.name)}, name: "module")
                            }
                            
                            if ((categories).count == 0) {
                                HStack {
                                    Spacer()
                                }
                            }
                        }
                    }
            }
        }.scrollDisabled(false)
    }
}

struct SkillView_Previews: PreviewProvider {
    static var previews: some View {
        SkillView()
    }
}
