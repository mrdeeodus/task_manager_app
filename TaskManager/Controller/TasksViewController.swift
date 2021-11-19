
//  Created by Dee Odus on 18/11/2021.
//

import UIKit

//1. why is it important to make class final
final class TasksViewController: UITableViewController {

	let cellIdentifer = "task_cell"
	
	//3. Why shouldnt taskmanager be initialised here
	let taskManager = TaskManager.init()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//2. I'll like to know how to have a datasource that is not a self
		tableView.dataSource = self
	}

	@IBAction func addNewTask(_ sender: Any) {
		
		taskManager.addRandomTask()
//		let task_count = taskManager.taskCount
//		let index_path = IndexPath(row: task_count - 1, section: 0)
//		tableView.insertRows(at: [index_path], with: .automatic)
		
		tableView.reloadData()
	}
	
}

extension TasksViewController{
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return taskManager.taskCount
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifer, for: indexPath)
		
		let task = taskManager.getTask(at: indexPath.row)
		cell.textLabel?.text = task.name
		cell.detailTextLabel?.text = task.description
		
		return cell

	}
	
}
