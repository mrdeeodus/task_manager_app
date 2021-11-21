
//  Created by Dee Odus on 18/11/2021.
//

import UIKit

//1. why is it important to make class final
final class TasksViewController: UITableViewController {
	
	let taskManager = TaskManager.init()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.register(UINib.init(nibName: Constants.Names.xibName, bundle: nil), forCellReuseIdentifier: Constants.Names.cellIdentifer)
		
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
		
		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Names.cellIdentifer) as! TasksCell
			
		let task = taskManager.getTask(at: indexPath.row)
		cell.task = task
		
		return cell

	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		DispatchQueue.main.async {
			
			self.performSegue(withIdentifier: "taskDetails", sender: self)
		}
	}
	
	override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		
		if editingStyle == .delete{
			
			let task = taskManager.getTask(at: indexPath.row)
			taskManager.remove(task: task)
			
			tableView.deleteRows(at: [indexPath], with: .fade)
		}
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
