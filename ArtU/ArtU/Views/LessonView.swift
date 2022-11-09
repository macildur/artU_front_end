//
//  LessonView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/10/22.
//

let peopleSubcategories: [Subcategory] = [
    .init(name: "Feets and Hands", tags: ["hands", "feet"]),
    .init(name: "Face", tags: ["face"]),
    .init(name: "Figure", tags: ["figure"]),
]

let landscapeSubcategories: [Subcategory] = [
    .init(name: "Cityscape", tags: ["cityscape"]),
    .init(name: "Nature", tags: ["nature"]),
]

let animalSubcategories: [Subcategory] = [
    .init(name: "Land", tags: ["land"]),
    .init(name: "Sky", tags: ["sky"]),
    .init(name: "Sea", tags: ["sea"]),
]

let categoryIdToSubcategory = [
    1: peopleSubcategories,
    2: landscapeSubcategories,
    3: peopleSubcategories,
]

import SwiftUI
import WebKit
import UIKit

struct LessonView: View {
    
    var category: Category
    
    var body: some View {
        ZStack {
            BackgroundImageView()
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(categoryIdToSubcategory[category.categoryId] ?? [], id: \.self) { subcategory in
                        CustomNavLink(destination: ImageView(tags: ["people"]), buttonType: {Text(subcategory.name)}, name: subcategory.name)
                    }
                    
                    if ((categoryIdToSubcategory[category.categoryId] ?? []).count == 0) {
                        HStack{
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}
