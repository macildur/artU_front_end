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
    .init(imgString: "aslan"),
    .init(imgString: "tiger"),
]

import SwiftUI
import WebKit
import UIKit

struct ImageView: View {
    let roundDuration: Int
    let tags: [String]
    @State private var imageIndex: Int
    @State private var progress: Double
    @State private var counter: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(roundDuration: Int, tags: [String]) {
        self.roundDuration = roundDuration
        self.tags = tags
        self._imageIndex = State(initialValue: 0)
        self._progress = State(initialValue: 1.0)
        self._counter = State(initialValue: roundDuration)
    }
    
    var body: some View {
        GeometryReader { geo in
        ZStack {
            mockImages[imageIndex].img
                .resizable()
                .ignoresSafeArea()
                .scaledToFill()
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            imageIndex += 1
                            if (imageIndex == mockImages.count) {
                                imageIndex = 0
                            }
                        }
                )
            VStack {
                HStack {
                    Spacer()
                    VStack(spacing: 15) {
                        ZStack {
                            Circle()
                                .fill(.black.opacity(0.15))
                            Circle()
                                .trim(from: 0, to: progress)
                                .stroke(Color.black, lineWidth: 4)
                                .blur(radius: 2)
                        }
                        .padding()
                        .frame(height: geo.size.width / 8)
                        .animation(.spring(), value: progress)
                        .overlay(
                            Text("\(counter)")
                                .font(.system(size: 30, weight: .heavy, design: .rounded))
                                .foregroundColor(.white)
                        )
                        .onReceive(timer) { _ in
                            progress -= Double(1.0/Double(roundDuration))
                            counter -= 1
                            if progress <= 0.0 || counter <= 0 {
                                timer.upstream.connect().cancel()
                            }
                        }
                        
                    }
                }
                Spacer()
            }
            }
        }
    }
}
