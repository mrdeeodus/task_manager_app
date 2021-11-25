
//  Created by Dee Odus on 18/11/2021.
//

import UIKit

final class TasksViewController: UITableViewController {
	
	let taskManager = TaskManager.shared
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(UINib.init(nibName: TasksCell.identifier, bundle: nil), forCellReuseIdentifier: TasksCell.identifier)
		
		tableView.dataSource = self
		tableView.delegate = self
		
		
		//Using extension = .taskDeleted
		//Using constant = Notification.Name(NotificationName.TaskDeleted)
		NotificationCenter.default.addObserver(self, selector: #selector(self.receivedNotification(notification:)), name: .taskDeleted, object: nil)
	}

	@objc func receivedNotification(notification: Notification) {
		
		guard let data = notification.userInfo else { return }
		guard let task = data["task"] as? Task else { return }
		guard let index = taskManager.getIndexOf(task: task) else { return }
		
		if taskManager.remove(task: task){

			let indexPath = IndexPath(row: index, section: 0)
			tableView.deleteRows(at: [indexPath], with: .automatic)
			
		}

	}
	
	@IBAction func addNewTask(_ sender: Any) {
		
		let success = taskManager.addRandomTask()
		if success{
			
			let task_count = taskManager.taskCount
			let index_path = IndexPath(row: task_count - 1, section: 0)
			tableView.insertRows(at: [index_path], with: .automatic)
		}
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
}

extension TasksViewController{
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return taskManager.taskCount
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: TasksCell.identifier) as! TasksCell

		cell.setUp(with: taskManager.getTask(at: indexPath.row))
		
		return cell

	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		guard let taskVC = TaskDetailsViewController.setUp(with: taskManager.getTask(at: indexPath.row)) else { return }
		
		present(taskVC, animated: true, completion: nil)

	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == .delete{
			
			let task = taskManager.getTask(at: indexPath.row)
			let remove = taskManager.remove(task: task)
			if remove{
				
				tableView.deleteRows(at: [indexPath], with: .fade)
			}
			
		}
	}
	
}
