//
//  WebView.swift
//  Hacker-news-SwiftUI
//
//  Created by Daniel Felipe on 28/09/23.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    //We initialize with the function a UIKit component that must be used in SwiftUI as a webView
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    // update webView with send url dynamic
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
