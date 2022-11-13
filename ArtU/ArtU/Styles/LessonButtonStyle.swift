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
            .frame(width: 250, height: 50)
            .background(.green)
            .font(.system(size: 25, weight: .heavy, design: .rounded))
            .foregroundColor(.white)
            .cornerRadius(10.0)
            .padding(.bottom, 30)
    }
}
