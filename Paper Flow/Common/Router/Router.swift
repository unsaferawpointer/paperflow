//
//  Router.swift
//  Paper Flow
//
//  Created by Anton Cherkasov on 18.05.2023.
//

import Cocoa

final class Router {

	private var window: NSWindow?

	// MARK: - Initialization

	/// Basic initialization
	///
	/// - Parameters:
	///    - window: Main window of the App
	init(window: NSWindow?) {
		self.window = window
	}
}

// MARK: - Routable
extension Router: Routable {

	func startApplication() {

		let splitViewController = NSSplitViewController()

		let sidebar = makeSidebarItem()
		let content = makeContentItem()

		splitViewController.addSplitViewItem(sidebar)
		splitViewController.addSplitViewItem(content)

		window?.contentViewController = splitViewController
		window?.makeKeyAndOrderFront(nil)
	}
}

// MARK: - Helpers
extension Router {

	func makeSidebarItem() -> NSSplitViewItem {
		let item = NSSplitViewItem(sidebarWithViewController: Sidebar.Assembly.build())
		item.minimumThickness = 200.0
		item.titlebarSeparatorStyle = .none
		return item
	}

	func makeContentItem() -> NSSplitViewItem {
		let item = NSSplitViewItem(viewController: EmptyViewController())
		item.titlebarSeparatorStyle = .line
		return item
	}
}
