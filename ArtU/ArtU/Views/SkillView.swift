//
//  SkillView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 10/5/22.
//

let categories: [Category] = [
    .init(categoryId: 1, name: "People", value: "people"),
    .init(categoryId: 2, name: "Landscape", value: "landscape"),
    .init(categoryId: 3, name: "Animals", value: "animals"),
    .init(categoryId: 4, name: "Mystery", value: "mystery"),
]

import SwiftUI

struct SkillView: View {
    @State private var showLessonView = false
    var body: some View {
        NavigationStack {
            ZStack {
                    VStack {
                        ScrollView(showsIndicators: false) {
                            Text("SKILLS")
                                .font(.custom("Lora", size: 36))
                                .tracking(5)
                                .padding(.top, 20)
                            ForEach(categories, id: \.self) { category in
                                CustomNavLink(destination: LessonView(primaryCategory: category), buttonType: {Text(category.name)}, name: "module")
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
