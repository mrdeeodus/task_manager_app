//
//  TasksCell.swift
//  TaskManager
//
//  Created by Dee Odus on 21/11/2021.
//

import UIKit

final class TasksCell: UITableViewCell {

	@IBOutlet weak private var taskNameLabel: UILabel!
	@IBOutlet weak private var taskDescLabel: UILabel!
	
	func setUp(with task: Task){
		
		taskNameLabel?.text = task.name
		taskDescLabel?.text = task.description
	}
	
}
