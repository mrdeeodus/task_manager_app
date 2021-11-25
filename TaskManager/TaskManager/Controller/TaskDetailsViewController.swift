//
//  TaskDetailsViewController.swift
//  TaskManager
//
//  Created by Dee Odus on 21/11/2021.
//

import UIKit

final class TaskDetailsViewController: UIViewController {

	@IBOutlet weak private var taskNameLabel: UILabel!
	@IBOutlet weak private var taskDescLabel: UILabel!
	
	var task: Task?
	
	override func viewDidLoad() {
        super.viewDidLoad()

		taskNameLabel.text = task?.name
		taskDescLabel.text = task?.description
    }
	
	static func setUp(with task: Task) -> TaskDetailsViewController? {
		
		let storyboard = UIStoryboard.init(name: StoryboardName.TaskDetails, bundle: Bundle.main)
		guard let taskViewController = storyboard.instantiateViewController(identifier: TaskDetailsViewController.identifier) as? TaskDetailsViewController else { return nil }
		taskViewController.task = task

		return taskViewController
	}
	
	@IBAction func deleteTask(_ sender: Any) {
		
		let alertVC = UIAlertController.init(title: "Delete?", message: "Do you want to delete this task?", preferredStyle: .alert)
		let deleteAction = UIAlertAction.init(title: "Delete", style: .destructive) { _ in
			
			guard let task = self.task else { return }
			NotificationCenter.default.post(name: .taskDeleted, object: nil, userInfo: ["task": task])
			
			self.dismiss(animated: true, completion: nil)
			
		}
		let cancelAction = UIAlertAction.init(title: "Cancel", style: .cancel, handler: nil)
		
		alertVC.addAction(deleteAction)
		alertVC.addAction(cancelAction)
		
		present(alertVC, animated: true, completion: nil)
	}

}
