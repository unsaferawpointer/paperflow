//
//  App.Delegate.swift
//  Paper Flow
//
//  Created by Anton Cherkasov on 18.05.2023.
//

import Cocoa

extension App {

	class Delegate: NSObject, NSApplicationDelegate {

		lazy var windowController: NSWindowController = App.WindowController()

		var window: NSWindow?

		func applicationDidFinishLaunching(_ aNotification: Notification) {
			// Insert code here to initialize your application
			let router = Router(window: windowController.window)
			router.startApplication()
		}

		func applicationWillTerminate(_ aNotification: Notification) {
			// Insert code here to tear down your application
		}

		func applicationSupportsSecureRestorableState(_ app: NSApplication) -> Bool {
			return true
		}

	}
}
