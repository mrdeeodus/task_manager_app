
//  Created by Dee Odus on 18/11/2021.
//

import UIKit

//1. why is it important to make class final
final class TasksViewController: UITableViewController {

	let cellIdentifer = "task_cell"
	
	let taskManager = TaskManager.init()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.dataSource = self
		tableView.delegate = self
	}

	@IBAction func addNewTask(_ sender: Any) {
		
		let success = taskManager.addRandomTask()
		if success{
			
			let task_count = taskManager.taskCount
			let index_path = IndexPath(row: task_count - 1, section: 0)
			tableView.insertRows(at: [index_path], with: .automatic)
		}

		//reloadRows function giving this error - Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason: 'attempt to delete row 0 from section 0 which only contains 0 rows before the update'
	}
	
}

extension TasksViewController{
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return taskManager.taskCount
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer) as! TaskCell
			
		let task = taskManager.getTask(at: indexPath.row)
		cell.task = task
		
		return cell

	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		DispatchQueue.main.async {
			
			self.performSegue(withIdentifier: "taskDetails", sender: self)
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		return 85
	}
	
}

extension TasksViewController{
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		
		if let taskDetailsVC = segue.destination as? TaskDetailsViewController{
			
			guard let selectedIndex = tableView.indexPathForSelectedRow else { return }
			let selectedTask = taskManager.getTask(at: selectedIndex.row)
			
			taskDetailsVC.task = selectedTask
		}
	}
	
}
