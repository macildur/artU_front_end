//
//  ModuleButtonStyle.swift
//  ArtU
//
//  Created by Eliza Hales on 11/4/22.
//

import SwiftUI

struct ModuleButtonStyle: ButtonStyle {
    var name: String
    
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            HStack {
                VStack {
                    Text(name)
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
        }.padding(.bottom, 30)
    }
}
