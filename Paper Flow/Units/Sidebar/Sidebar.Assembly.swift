//
//  Sidebar.Assembly.swift
//  Paper Flow
//
//  Created by Anton Cherkasov on 18.05.2023.
//

import Cocoa

extension Sidebar {

	/// Assembly of the Sidebar unit
	final class Assembly {

		/// Builds Sidebar unit
		static func build() -> NSViewController {
			return Sidebar.ViewController { _ in }
		}
	}
}
