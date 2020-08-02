//
//  YouTuBunMusicApp.swift
//  Shared
//
//  Created by Yiqin Zhao on 7/30/20.
//

import SwiftUI
import AppKit

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    var window: NSWindow?

    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView()
        
        let screenReact = NSScreen.main?.frame
        
        window = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: screenReact!.width * 0.7, height: screenReact!.height * 0.7),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        
        window?.center()
        
        window?.titleVisibility = .hidden
        
        window?.contentView = NSHostingView(rootView: contentView)
        window?.isReleasedWhenClosed = false
        window?.makeKeyAndOrderFront(nil)
    }

    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        if !flag {
            window?.makeKeyAndOrderFront(nil)
            return true
        }
        return false
    }
}
