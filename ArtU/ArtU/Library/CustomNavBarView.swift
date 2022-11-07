//
//  CustomNavBarView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/28/22.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let title: String
    let subtitle: String?
    
    var body: some View {
        HStack {
            if showBackButton {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackButton {
                backButton
                    .opacity(0)
            }
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(.white)
        .font(.headline)
        .background(
            //Image("green_background").containerShape(shape: circle)//.resizable().ignoresSafeArea()//.frame(width: 50, height: 50)
            Image("green_background").resizable().ignoresSafeArea()//(edges: .top)
            //Color.blue.ignoresSafeArea(edges: .top)
            //UIColor(patternImage: UIImage(named: "green_background"))
        )
    }
}

struct CustomNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            CustomNavBarView(showBackButton: true, title: "Title here", subtitle: "Subtitle goes here")
            Spacer()
        }.previewInterfaceOrientation(.landscapeLeft)
    }
}

extension CustomNavBarView {
    
    private var backButton: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "green_background")
        })
    }
    
    private var titleSection: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subtitle = subtitle {
                Text(subtitle)
            }
        }
    }
}
