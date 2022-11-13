//
//  LessonView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/10/22.
//

//let peopleSubcategories: [Subcategory] = [
//    .init(name: "Feets and Hands", tags: ["hands", "feet"]),
//    .init(name: "Face", tags: ["face"]),
//    .init(name: "Figure", tags: ["figure"]),
//]
//
//let landscapeSubcategories: [Subcategory] = [
//    .init(name: "Cityscape", tags: ["cityscape"]),
//    .init(name: "Nature", tags: ["nature"]),
//]
//
//let animalSubcategories: [Subcategory] = [
//    .init(name: "Land", tags: ["land"]),
//    .init(name: "Sky", tags: ["sky"]),
//    .init(name: "Sea", tags: ["sea"]),
//]

let peopleSubcategories: [DropdownOption] = [
    DropdownOption(key: "1", value: "Feet / Hands"),
    DropdownOption(key: "2", value: "Face"),
    DropdownOption(key: "3", value: "Figure"),
]

let landscapeSubcategories: [DropdownOption] = [
    DropdownOption(key: "1", value: "Cityscape"),
    DropdownOption(key: "2", value: "Nature"),
]

let animalSubcategories: [DropdownOption] = [
    DropdownOption(key: "1", value: "Land"),
    DropdownOption(key: "2", value: "Sky"),
    DropdownOption(key: "3", value: "Sea"),
]

let categoryIdToSubcategory = [
    1: peopleSubcategories,
    2: landscapeSubcategories,
    3: peopleSubcategories,
]

let durationOptions: [DropdownOption] = [
    DropdownOption(key: "ten_seconds", value: "10 seconds"),
    DropdownOption(key: "thirty_seconds", value: "30 seconds"),
    DropdownOption(key: "sixty_seconds", value: "60 seconds"),
]

let roundsOptions: [DropdownOption] = [
    DropdownOption(key: "one", value: "1 round"),
    DropdownOption(key: "two", value: "2 rounds"),
    DropdownOption(key: "three", value: "3 rounds"),
    DropdownOption(key: "four", value: "4 rounds"),
    DropdownOption(key: "five", value: "5 rounds"),
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
                Text("Preferences")
                    .font(.largeTitle.bold())
                    .foregroundColor(Color.white)
                    .padding()

                HStack {
                    DropdownSelector(placeholder: "Round Duration", options: durationOptions)
                        .padding(.horizontal)
                    DropdownSelector(placeholder: "Number of Rounds", options: roundsOptions)
                        .padding(.horizontal)
                    if (category.categoryId != 4) {
                        DropdownSelector(placeholder: "Categories", options: categoryIdToSubcategory[category.categoryId] ?? [])
                    }
                }
                Spacer()
                CustomNavLink(destination: ImageView(tags: ["people"]), buttonType: {Text("Create!")}, name: "navigation")
            }
        }
    }
        }
