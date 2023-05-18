//
//  App.WindowController.swift
//  Paper Flow
//
//  Created by Anton Cherkasov on 18.05.2023.
//

import Cocoa

extension App {

	/// Main window of the application
	final class WindowController: NSWindowController {

		lazy var toolbar: NSToolbar = {
			let view = NSToolbar(identifier: "toolbar")
			view.sizeMode = .regular
			view.displayMode = .iconOnly
			return view
		}()

		// MARK: - Initialization

		/// Initialization
		///
		/// - Parameters:
		///    - minSize: Minimal size of the window
		init(minSize: CGSize = .init(width: 640, height: 640)) {
			let window = NSWindow()
			window.minSize = minSize
			window.styleMask = [.miniaturizable,
								.closable,
								.resizable,
								.titled,
								.fullSizeContentView,
								.unifiedTitleAndToolbar]
			window.isRestorable = true
			window.center()
			window.setFrameAutosaveName("mainWindow")
			window.titleVisibility = .visible
			window.titlebarAppearsTransparent = false
			window.tabbingMode = .disallowed
			window.titlebarSeparatorStyle = .automatic
			window.toolbarStyle = .unified
			window.identifier = .init("mainWindow")
			super.init(window: window)
			window.toolbar = toolbar
		}

		@available(*, unavailable, message: "Use init()")
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}

	}
}

// MARK: - Actions
extension App.WindowController {

	@objc
	func quit(_ sender: Any?) {
		NSApp.terminate(self)
	}
}
