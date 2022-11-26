//
//  GalleryView.swift
//  ArtU
//
//  Created by Eliza Hales on 11/26/22.
//

import SwiftUI

struct TransitionIsActiveKey: EnvironmentKey {
    static let defaultValue = false
}

extension EnvironmentValues {
    var transitionIsActive: Bool {
        get { self[TransitionIsActiveKey.self] }
        set { self[TransitionIsActiveKey.self] = newValue }
    }
}

struct TransitionReader<Content: View>: View {
    var content: (Bool) -> Content
    @Environment(\.transitionIsActive) var active
    
    var body: some View {
        content(active)
    }
}

struct TransitionActive: ViewModifier {
    var active: Bool
    
    func body(content: Content) -> some View {
        content
            .environment(\.transitionIsActive, active)
    }
}

struct GalleryView: View {
    @State private var detail: Int? = nil
    @State private var slowAnimations = false
    @Namespace private var namespace
    @Namespace private var dummyNS

    var body: some View {
        VStack {
            //Toggle("Slow Animations", isOn: $slowAnimations)
            ZStack {
                photoGrid
                    .opacity(gridOpacity)
                    .animation(animation, value: gridOpacity == 0)
                detailView
            }
            .animation(animation, value: detail)
        }
    }
    
    var animation: Animation {
        .default.speed(slowAnimations ? 0.2 : 1)
    }
    
    @GestureState private var offset: CGSize = .zero
    
    var detailGesture: some Gesture {
        let tap = TapGesture().onEnded {
            detail = nil
        }
        let drag = DragGesture().updating($offset) { value, state, _ in
            state = value.translation
        }.onEnded { value in
            let diff = value.predictedEndTranslation.height-value.translation.height
            if diff > 0 {
                detail = nil
            }
        }
        
        return drag.simultaneously(with: tap)
    }
    
    var dragScale: CGFloat {
        guard offset.height > 0 else { return 1 }
        return 1 - offset.height/1000
    }
    
    var gridOpacity: CGFloat {
        guard detail != nil else { return 1 }
        return (1 - dragScale) * 1.3
    }
    
    @ViewBuilder
    var detailView: some View {
        if let d = detail {
            ZStack {
                TransitionReader { active in
                    Image("gallery_\(d)")
                        .resizable()
                        .mask {
                            Rectangle().aspectRatio(1, contentMode: active ? .fit : .fill)
                        }
                        .matchedGeometryEffect(id: d, in: active ? namespace : dummyNS, isSource: false)
                        .aspectRatio(contentMode: .fit)
                        .offset(offset)
                        .scaleEffect(active ? 1 : dragScale)
                        .animation(.default, value: offset == .zero)
                        .gesture(detailGesture)
                }
            }
                .zIndex(2)
                .id(d)
                .transition(.modifier(active: TransitionActive(active: true), identity: TransitionActive(active: false)))
        }
    }
    
    struct ExDivider: View {
        let color: Color = .black
        let width: CGFloat = 1
        var body: some View {
            Rectangle()
                .fill(color)
                .frame(height: width)
                .padding(.trailing, 20)
                .padding(.leading, 20)
                .padding(.bottom, 8)
                .padding(.top, 5)
        }
    }
    
    var photoGrid: some View {
        ScrollView {
            VStack(spacing: 0) {
                Text("GALLERY")
                    .font(.system(size: 36))
                    .padding(.top, 20)
                ExDivider()
            }
            HStack {
                VStack(spacing: 0) {
                    Text("Shop")
                    ExDivider()
                }
                VStack(spacing: 0) {
                    Text("Search")
                    ExDivider()
                }
                VStack(spacing: 0) {
                    Text("Category")
                    ExDivider()
                }
            }
            LazyVGrid(columns: [.init(.adaptive(minimum: 80, maximum: .infinity),
                                      spacing: 4)], spacing: 4) {
                ForEach(0..<28) { ix in
                    Image("gallery_\(ix)")
                        .resizable()
                        .matchedGeometryEffect(id: ix, in: namespace)
                        .aspectRatio(contentMode: .fill)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        .clipped()
                        .aspectRatio(1, contentMode: .fit)
                        .contentShape(Rectangle())
                        .onTapGesture {
                            detail = ix
                        }
                }
            }
        }
    }
}
