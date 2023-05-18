//
//  Sidebar.ViewController.swift
//  Paper Flow
//
//  Created by Anton Cherkasov on 18.05.2023.
//

import Cocoa

extension Sidebar {

	/// View-controller of the Sidebar unit
	final class ViewController: NSViewController {

		// MARK: - UI-Properties

		var scrollview: NSScrollView = {
			let view = NSScrollView()
			view.borderType = .noBorder
			view.hasHorizontalScroller = false
			view.autohidesScrollers = true
			view.hasVerticalScroller = false
			view.drawsBackground = false
			return view
		}()

		var table: NSOutlineView = {
			let view = NSOutlineView()
			view.style = .sourceList
			view.rowSizeStyle = .default
			view.allowsMultipleSelection = false
			view.usesAutomaticRowHeights = false
			view.usesAlternatingRowBackgroundColors = false
			view.intercellSpacing = .init(width: 0, height: 8)
			return view
		}()

		// MARK: - Initialization

		/// Basic initialization
		///
		/// - Parameters:
		///    - configure: Configuration closure. Setup unit here.
		init(_ configure: (Sidebar.ViewController) -> Void) {
			super.init(nibName: nil, bundle: nil)
			configure(self)
			configureUserInterface()
			configureConstraints()
		}

		@available(*, unavailable, message: "Use init()")
		required init?(coder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}

	}
}

// MARK: - Life-cycle
extension Sidebar.ViewController {

	override func loadView() {
		self.view = NSView()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}

// MARK: - Helpers
private extension Sidebar.ViewController {

	func configureUserInterface() {
		table.addTableColumn(NSTableColumn("main"))
		table.headerView = nil
	}

	func configureConstraints() {
		scrollview.documentView = table

		view.addSubview(scrollview)
		scrollview.translatesAutoresizingMaskIntoConstraints = false

		NSLayoutConstraint.activate(
			[
				scrollview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
				scrollview.bottomAnchor.constraint(equalTo: view.bottomAnchor),
				scrollview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
				scrollview.trailingAnchor.constraint(equalTo: view.trailingAnchor)
			]
		)
	}
}
