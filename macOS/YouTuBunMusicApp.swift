//
//  YouTuBunMusicApp.swift
//  Shared
//
//  Created by Yiqin Zhao on 7/30/20.
//

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {
    
    var mainWindow: NSWindow!
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        mainWindow = NSApplication.shared.windows[0]
        mainWindow.titleVisibility = .hidden
        
//        let customToolbar = NSToolbar()
//        customToolbar.showsBaselineSeparator = false
//        mainWindow.titlebarAppearsTransparent = true
//        mainWindow.titleVisibility = .hidden
//        mainWindow.toolbar = customToolbar
//        mainWindow.styleMask.insert(.fullSizeContentView)
//        mainWindow.contentView?.wantsLayer = true
        
        mainWindow.isReleasedWhenClosed = false
        let button = mainWindow.standardWindowButton(.closeButton)
        button?.target = self
        button?.action = #selector(closeMe(_:))
    }
    
    @objc func closeMe(_ sender: NSButton) {
        NSApp.hide(self)
    }
    
//    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {x
//        if !flag {
//            mainWindow.makeKeyAndOrderFront(nil)
//        }
//        return true
//    }
    
    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        return false
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
