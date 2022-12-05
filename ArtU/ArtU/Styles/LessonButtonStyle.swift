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
            .background(Color("LightTan"))
            .font(.custom("Lora", size: 36))
            .foregroundColor(.black)
            .cornerRadius(10.0)
            .padding(.bottom, 30)
    }
}
