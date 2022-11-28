//
//  ExpressionsView.swift
//  ArtU
//
//  Created by Brandon Vinh Lê on 11/21/22.
//

import SwiftUI

struct ExpressionsView: View {
    var body: some View {
        ZStack {
            BackgroundImageView()
            VStack {
                Image(systemName: "scribble")
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

struct ExpressionsView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressionsView()
    }
}
