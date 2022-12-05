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
            // BackgroundImageView()
            VStack {
                Image(systemName: "gear")
                    .foregroundColor(Color.brown)
                    .font(.system(size: 100.0))
                Text("COMING SOON!")
                    .foregroundColor(Color.brown)
                    .font(.custom("Lora", size: 36))
                    .tracking(5)
                    .padding(.top, 20)
            }
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

