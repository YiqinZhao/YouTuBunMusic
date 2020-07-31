//
//  ContentView.swift
//  Shared
//
//  Created by Yiqin Zhao on 7/30/20.
//

import SwiftUI
import WebKit

struct SwiftWebView: NSViewRepresentable {

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

    func updateNSView(_ view: WKWebView, context: Context) {
//        view.load(request)
    }

}

struct ContentView: View {
    var body: some View {
        GeometryReader { g in
             ScrollView {
                 SwiftWebView().frame(height: g.size.height)
             }.frame(height: g.size.height)
        }
        // .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
