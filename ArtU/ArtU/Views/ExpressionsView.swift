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
            // BackgroundImageView()
            VStack {
                Image(systemName: "scribble")
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

struct ExpressionsView_Previews: PreviewProvider {
    static var previews: some View {
        ExpressionsView()
    }
}
