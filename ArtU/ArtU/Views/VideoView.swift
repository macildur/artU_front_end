//
//  VideoView.swift
//  ArtU
//
//  Created by Eliza Hales on 10/17/22.
//

import SwiftUI
import WebKit

struct VideoView: UIViewRepresentable {
    let videoID: String
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)") else {return}
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: youtubeURL))
    }

}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView(videoID: "CX-BdDHW0Ho")
    }
}
