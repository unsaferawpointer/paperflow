//
//  NSTableColumn + Extentions.swift
//  Paper Flow
//
//  Created by Anton Cherkasov on 18.05.2023.
//

import Cocoa

extension NSTableColumn {

	convenience init(_ identifier: String, title: String = "") {
		self.init(identifier: .init(rawValue: identifier))
		self.title = title
	}
}
