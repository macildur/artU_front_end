//
//  MenuView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 11/21/22.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            ExpressionsView()
                .tabItem() {
                    Image(systemName: "scribble")
                    Text("Expressions")
                }
            GalleryView()
                .tabItem() {
                    Image(systemName: "photo.on.rectangle")
                    Text("Gallery")
                }
            SkillView()
                .tabItem() {
                    Image(systemName: "pencil.and.outline")
                    Text("Skills")
                }
            SettingsView()
                .tabItem() {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
        .accentColor(Color.white)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
