//
//  SettingsView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 11/28/22.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            BackgroundImageView()
            VStack {
                Image(systemName: "gear")
                    .foregroundColor(Color.white)
                    .font(.system(size: 100.0))
                Text("Coming Soon!")
                    .foregroundColor(Color.white)
                    .font(.system(size: 50, weight: .heavy, design: .rounded))
                    .padding()
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

