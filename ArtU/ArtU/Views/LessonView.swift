//
//  LessonView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/10/22.
//

let peopleSubcategories: [DropdownOption] = [
    DropdownOption(key: 1, value: "Feet / Hands", tags: ["hands", "feet"]),
    DropdownOption(key: 2, value: "Face", tags: ["face"]),
    DropdownOption(key: 3, value: "Figure", tags: ["figure"]),
]

let landscapeSubcategories: [DropdownOption] = [
    DropdownOption(key: 1, value: "Cityscape", tags: ["cityscape"]),
    DropdownOption(key: 2, value: "Nature", tags: ["nature"]),
]

let animalSubcategories: [DropdownOption] = [
    DropdownOption(key: 1, value: "Land", tags: ["land"]),
    DropdownOption(key: 2, value: "Sky", tags: ["sky"]),
    DropdownOption(key: 3, value: "Sea", tags: ["sea"]),
]

let categoryIdToSubcategory = [
    1: peopleSubcategories,
    2: landscapeSubcategories,
    3: peopleSubcategories,
]

let durationOptions: [DropdownOption] = [
    DropdownOption(key: 10, value: "10 seconds", tags: []),
    DropdownOption(key: 30, value: "30 seconds", tags: []),
    DropdownOption(key: 60, value: "60 seconds", tags: []),
]

let roundsOptions: [DropdownOption] = [
    DropdownOption(key: 1, value: "1 round", tags: []),
    DropdownOption(key: 2, value: "2 rounds", tags: []),
    DropdownOption(key: 3, value: "3 rounds", tags: []),
]

import SwiftUI
import WebKit
import UIKit

struct LessonView: View {
    var category: Category
    @State var roundDuration: Int = 0
    @State var numRounds: Int = 0
    @State var tag: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("Preferences")
                    .font(.custom("Lora", size: 36))
                    .foregroundColor(Color.black)
                    .padding(.top, 30)
                    .padding(.bottom, 75)

                    DropdownSelector(placeholder: "Round Duration", options: durationOptions, onOptionSelected: {option in roundDuration = option.key})
                        .padding(.horizontal)
                        .zIndex(2)
                        .padding(.bottom, 30)
                    DropdownSelector(placeholder: "Number of Rounds", options: roundsOptions, onOptionSelected: {option in numRounds = option.key})
                        .padding(.horizontal)
                        .zIndex(1)
                        .padding(.bottom, 30)
                    if (category.categoryId != 4) {
                        DropdownSelector(placeholder: "Categories", options: categoryIdToSubcategory[category.categoryId] ?? [], onOptionSelected: {option in tag = option.value})
                            .padding(.horizontal)
                    }
                Spacer()
                if (category.categoryId == 4) {
                    CustomNavLink(destination: MysteryView(roundDuration: roundDuration, tags: ["people"]), buttonType: {Text("Create!")}, name: "navigation").opacity((roundDuration == 0 || numRounds == 0) ? 0.3 : 0.6).disabled(roundDuration == 0 || numRounds == 0)
                } else {
                    CustomNavLink(destination: ImageView(roundDuration: roundDuration, tags: ["people"]), buttonType: {Text("Create!")}, name: "navigation").opacity((roundDuration == 0 || numRounds == 0 || tag == "") ? 0.3 : 0.6).disabled(roundDuration == 0 || numRounds == 0 || tag == "")
                }
            }
        }
    }
}
