//
//  YouTuBunMusicApp.swift
//  Shared
//
//  Created by Yiqin Zhao on 7/30/20.
//

import SwiftUI
import AppKit

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    var mainWindow: NSWindow!
    var isFullScreen: Bool = false
    var isFullScreenClose: Bool = false

    func applicationDidFinishLaunching(_ notification: Notification) {
        mainWindow = NSApplication.shared.windows[0]
        
        mainWindow.titleVisibility = .hidden
        
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

@main
struct YouTuBunMusicApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
