//
//  ModuleButtonStyle.swift
//  ArtU
//
//  Created by Eliza Hales on 11/4/22.
//

import SwiftUI

struct ModuleButtonStyle: ButtonStyle {
    var moduleName: String
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            VStack {
                //configuration.label
                Text(moduleName)
                    .font(.system(size: 26, weight: .heavy))
                    .foregroundColor(Color("DarkGreen"))
                Spacer()
            }
            Spacer()
        }
            .padding()
            .foregroundColor(Color(red: 0.0, green: 100.0, blue: 1.0))
            .frame(width: 350, height: 120)
            .background(RoundedRectangle(cornerRadius: 15).fill(Color("OffWhite")))
    }
}
