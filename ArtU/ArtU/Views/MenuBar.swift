//
//  MenuBar.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 11/21/22.
//

import SwiftUI

struct MenuBarView: View {
    var body: some View {
        TabView {
            ExpressionsView()
                .tabItem() {
                    Image(systemName: "phone.fill")
                    Text("Expressions")
                }
            GalleryView()
                .tabItem() {
                    Image(systemName: "person.2.fill")
                    Text("Gallery")
                }
            SkillView()
                .tabItem() {
                    Image(systemName: "slider.horizontal.3")
                    Text("Skills")
                }
        }
    }
}

struct MenuBarView_Previews: PreviewProvider {
    static var previews: some View {
        MenuBarView()
    }
}
