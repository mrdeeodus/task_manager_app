//
//  Extensions.swift
//  TaskManager
//
//  Created by Dee Odus on 25/11/2021.
//

import Foundation
import UIKit

extension UITableViewCell {
	
	static var identifier: String {
		return String(describing: self)
	}
}

extension UIViewController {
	
	static var identifier: String {
		return String(describing: self)
	}
}

extension Notification.Name {
	static let taskDeleted = Notification.Name("taskDeleted")
}
