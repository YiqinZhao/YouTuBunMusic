//
//  ContentView.swift
//  Shared
//
//  Created by Yiqin Zhao on 7/30/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader { g in
             ScrollView {
                YouTuBunWebView().frame(height: g.size.height)
             }.frame(height: g.size.height)
        }
        // .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
