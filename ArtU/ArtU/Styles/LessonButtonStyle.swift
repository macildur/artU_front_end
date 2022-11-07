//
//  LessonButtonStyle.swift
//  ArtU
//
//  Created by Eliza Hales on 11/4/22.
//

import SwiftUI

struct LessonButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(Color(red: 0, green: 0, blue: 0.5))
            .foregroundColor(.white)
            .clipShape(Capsule())
    }
}
