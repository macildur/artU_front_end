//
//  LoaderView.swift
//  ArtU
//
//  Created by Trav Feller on 10/25/22.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        ProgressView()
            .tint(.white)
            .scaleEffect(3)
        
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
