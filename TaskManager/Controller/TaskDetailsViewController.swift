//
//  TaskDetailsViewController.swift
//  TaskManager
//
//  Created by Dee Odus on 21/11/2021.
//

import UIKit

class TaskDetailsViewController: UIViewController {

	@IBOutlet weak var taskNameLabel: UILabel!
	@IBOutlet weak var taskDescLabel: UILabel!
	
	var task: Task?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		taskNameLabel.text = task?.name
		taskDescLabel.text = task?.description
    }

}
