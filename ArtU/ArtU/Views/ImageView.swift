//
//  ImageView.swift
//  ArtU
//
//  Created by Eliza Hales on 11/7/22.
//

 //Mock Data



struct ImageObject: Identifiable, Hashable {
    var id = UUID()
    let imgString: String
    
    var img : Image {
        Image(imgString)
    }
}
let mockImages: [ImageObject] = [
    .init(imgString: "green_background"),
    .init(imgString: "green_background"),
    .init(imgString: "green_background"),
]

import SwiftUI
import WebKit
import UIKit

struct ImageView: View {
    let tags: [String]
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(mockImages) {image in
                    image.img
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                }
            }
        }
    }
}
