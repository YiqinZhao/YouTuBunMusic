//
//  YouTuBunMusicApp.swift
//  Shared
//
//  Created by Yiqin Zhao on 7/30/20.
//

import SwiftUI
import AppKit

@main
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    var mainWindow: NSWindow!
    var isFullScreen: Bool = false
    var isFullScreenClose: Bool = false

    func applicationDidFinishLaunching(_ notification: Notification) {
        let contentView = ContentView()
        
        let screenReact = NSScreen.main?.frame
        
        mainWindow = NSWindow(
            contentRect: NSRect(x: 0, y: 0, width: screenReact!.width * 0.7, height: screenReact!.height * 0.7),
            styleMask: [.titled, .closable, .miniaturizable, .resizable, .fullSizeContentView],
            backing: .buffered, defer: false)
        
        mainWindow.center()
        
        mainWindow.titleVisibility = .hidden
        
        mainWindow.contentView = NSHostingView(rootView: contentView)
        mainWindow.makeKeyAndOrderFront(nil)
        
        mainWindow.isReleasedWhenClosed = false
        mainWindow.delegate = self
        
        let button = mainWindow.standardWindowButton(.closeButton)
        button?.target = self
        button?.action = #selector(closeMe(_:))
    }

    @objc func closeMe(_ sender: NSButton) {
        if isFullScreen {
            isFullScreenClose = true
            mainWindow.toggleFullScreen(nil)
            return
        }
        NSApp.hide(nil)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
    }

    func windowDidEnterFullScreen(_ notification: Notification) {
        isFullScreen = true
    }

    func windowDidExitFullScreen(_ notification: Notification) {
        isFullScreen = false
        if isFullScreenClose {
            NSApp.hide(nil)
        }
    }
}
