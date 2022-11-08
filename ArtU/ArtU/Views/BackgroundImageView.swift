//
//  BackgroundView.swift
//  ArtU
//
//  Created by Eliza Hales on 11/7/22.
//

import SwiftUI

struct BackgroundImageView: View {
    var body: some View {
        Image("green_background")
            .resizable()
            .ignoresSafeArea()
        //.scaledToFill()
    }
}
