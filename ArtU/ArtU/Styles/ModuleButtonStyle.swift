//
//  ModuleButtonStyle.swift
//  ArtU
//
//  Created by Eliza Hales on 11/4/22.
//

import SwiftUI

struct ModuleButtonStyle: ButtonStyle {    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            VStack {
                HStack {
                    configuration.label
                        .font(.custom("Lora", size: 32))
                        .foregroundColor(Color.brown)
                    Spacer()
                }
                Spacer()
            }
            .padding()
            .foregroundColor(Color(red: 0.0, green: 100.0, blue: 1.0))
            .frame(width: 350, height: 90)
            .background(RoundedRectangle(cornerRadius: 2).fill(Color("LightTan")).opacity(0.3))
        }.padding(.bottom, 25)
    }
}
