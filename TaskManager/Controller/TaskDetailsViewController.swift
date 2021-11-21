//
//  TaskDetailsViewController.swift
//  TaskManager
//
//  Created by Dee Odus on 21/11/2021.
//

import UIKit

final class TaskDetailsViewController: UIViewController {

	@IBOutlet weak var taskNameLabel: UILabel!
	@IBOutlet weak var taskDescLabel: UILabel!
	
	var task: Task?
	var taskManager: TaskManager?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		taskNameLabel.text = task?.name
		taskDescLabel.text = task?.description
    }
	
	@IBAction func deleteTask(_ sender: Any) {
		
		let alertVC = UIAlertController.init(title: "Delete?", message: "Do you want to delete this task?", preferredStyle: .alert)
		let deleteAction = UIAlertAction.init(title: "Delete", style: .destructive) { _ in
			
			self.performDelete()
		}
		let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
		
		alertVC.addAction(deleteAction)
		alertVC.addAction(cancelAction)
		
		present(alertVC, animated: true, completion: nil)
	}
	
	func performDelete(){
		
		if let task = task, let taskManager = taskManager, let navController = self.presentingViewController as? UINavigationController, let tasksVC = navController.topViewController as? TasksViewController{
			
			taskManager.remove(task: task)
			tasksVC.tableView.reloadData()
			dismiss(animated: true, completion: nil)
			
		}
	}

}
