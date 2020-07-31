//
//  YouTuBunWebView.swift
//  YouTuBunMusic (macOS)
//
//  Created by Yiqin Zhao on 7/31/20.
//

import SwiftUI
import WebKit

struct YouTuBunWebView: NSViewRepresentable {

    let view: WKWebView = WKWebView()

    var request: URLRequest {
        get{
            let url: URL = URL(string: "https://music.youtube.com")!
            let request: URLRequest = URLRequest(url: url)
            return request
        }
    }

    func makeNSView(context: Context) -> WKWebView {
        view.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 11_0) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Safari/605.1.15"
        view.load(request)
        return view
    }

    func updateNSView(_ view: WKWebView, context: Context) { }

}
