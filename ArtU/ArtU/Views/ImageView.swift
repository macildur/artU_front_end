//
//  ImageView.swift
//  ArtU
//
//  Created by Eliza Hales on 11/7/22.
//

 //Mock Data

import SwiftUI
import WebKit
import UIKit

struct ImageView: View {
    @ObservedObject var skillsViewController: SkillsViewController
    let roundDuration: Int
    let primaryCategory: String
    let secondaryCategory: String
    @State private var imageIndex: Int
    @State private var progress: Double
    @State private var counter: Int
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(roundDuration: Int, primaryCategory: String, secondaryCategory: String) {
        self.roundDuration = roundDuration
        self.primaryCategory = primaryCategory
        self.secondaryCategory = secondaryCategory
        self.skillsViewController = SkillsViewController()
        self._imageIndex = State(initialValue: 0)
        self._progress = State(initialValue: 1.0)
        self._counter = State(initialValue: roundDuration)
        self.retrieveImages()
    }
    
    func retrieveImages() {
        skillsViewController.getImages(primaryCategory: primaryCategory, secondaryCategory: secondaryCategory)
    }
    
    var body: some View {
        if (!skillsViewController.isLoading) {
            GeometryReader { geo in
                ZStack {
                    skillsViewController.image
                        .resizable()
                        .ignoresSafeArea()
                        .scaledToFit()
                        .gesture(
                            TapGesture()
                                .onEnded { _ in
                                    if (counter == 0) {
                                        imageIndex += 1
                                        if (imageIndex == mockImages.count) {
                                            imageIndex = 0
                                        }
                                        progress = 1.0
                                        counter = roundDuration
                                        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                                    }
                                }
                        )
                    VStack {
                        HStack {
                            Spacer()
                            VStack(spacing: 15) {
                                ZStack {
                                    Circle()
                                        .fill(.white)
                                        //.fill(.black.opacity(0.15))
                                    Circle()
                                        .trim(from: 0, to: progress)
                                        .stroke(Color.white, lineWidth: 10)
                                        //.blur(radius: 2)
                                }
                                .padding()
                                .frame(height: geo.size.width / 8)
                                .animation(.spring(), value: progress)
                                .overlay(
                                    Text("\(counter)")
                                        .font(.system(size: 30, weight: .heavy, design: .rounded))
                                        .foregroundColor(.black)
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
        } else {
            VisualEffectView()
            LoaderView()
        }
    }
}
