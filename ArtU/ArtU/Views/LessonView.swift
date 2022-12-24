//
//  LessonView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/10/22.
//

let peopleSubcategories: [DropdownOption] = [
    DropdownOption(key: 1, value: "Feet / Hands", secondaryCategory: "hands-feet"),
    DropdownOption(key: 2, value: "Face", secondaryCategory: "face"),
    DropdownOption(key: 3, value: "Figure", secondaryCategory: "figure"),
]

let landscapeSubcategories: [DropdownOption] = [
    DropdownOption(key: 1, value: "Cityscape", secondaryCategory: "cityscape"),
    DropdownOption(key: 2, value: "Nature", secondaryCategory: "nature"),
]

let animalSubcategories: [DropdownOption] = [
    DropdownOption(key: 1, value: "Land", secondaryCategory: "land"),
    DropdownOption(key: 2, value: "Sky", secondaryCategory: "sky"),
    DropdownOption(key: 3, value: "Sea", secondaryCategory: "sea"),
]

let categoryIdToSubcategory = [
    1: peopleSubcategories,
    2: landscapeSubcategories,
    3: peopleSubcategories,
]

let durationOptions: [DropdownOption] = [
    DropdownOption(key: 10, value: "10 seconds", secondaryCategory: ""),
    DropdownOption(key: 30, value: "30 seconds", secondaryCategory: ""),
    DropdownOption(key: 60, value: "60 seconds", secondaryCategory: ""),
]

let roundsOptions: [DropdownOption] = [
    DropdownOption(key: 1, value: "1 round", secondaryCategory: ""),
    DropdownOption(key: 2, value: "2 rounds", secondaryCategory: ""),
    DropdownOption(key: 3, value: "3 rounds", secondaryCategory: ""),
]

import SwiftUI
import WebKit
import UIKit

struct LessonView: View {
    var primaryCategory: Category
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
                    if (primaryCategory.categoryId != 4) {
                        DropdownSelector(placeholder: "Categories", options: categoryIdToSubcategory[primaryCategory.categoryId] ?? [], onOptionSelected: {option in tag = option.secondaryCategory})
                            .padding(.horizontal)
                    }
                Spacer()
                if (primaryCategory.categoryId == 4) {
                    CustomNavLink(destination: MysteryView(roundDuration: roundDuration, tags: ["people"]), buttonType: {Text("Create!")}, name: "navigation").opacity((roundDuration == 0 || numRounds == 0) ? 0.3 : 0.6).disabled(roundDuration == 0 || numRounds == 0)
                } else {
                    CustomNavLink(destination: ImageView(roundDuration: roundDuration, primaryCategory: primaryCategory.value, secondaryCategory: tag), buttonType: {Text("Create!")}, name: "navigation").opacity((roundDuration == 0 || numRounds == 0 || tag == "") ? 0.3 : 0.6).disabled(roundDuration == 0 || numRounds == 0 || tag == "")
                }
            }
        }
    }
}
