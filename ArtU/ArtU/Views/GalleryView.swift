//
//  GalleryView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 11/21/22.
//

import SwiftUI

struct GalleryView: View {
    var body: some View {
        ZStack {
            BackgroundImageView()
            VStack {
                Image(systemName: "photo.fill.on.rectangle.fill")
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

struct GalleryView_Previews: PreviewProvider {
    static var previews: some View {
        GalleryView()
    }
}
