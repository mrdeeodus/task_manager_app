
//  Created by Dee Odus on 18/11/2021.
//

import Foundation

final class TaskManager{
	
	private var tasks: [Task]
	private let store = Store()
	
	init(tasks: [Task]) {
		
		self.tasks = tasks
	}
	
	var taskCount: Int{
		
		return tasks.count
	}
	
	func getIndexOf(task: Task) -> Int?{
		
		
		return tasks.firstIndex(of: task)
	}
	
	//return a boolean for successful/failed add
	func add(task: Task) -> Bool{
		
		if !tasks.contains(task){
			
			tasks.append(task)
			store.saveTasks(tasks)
			
			return true
		}
		
		return false
		
	}
	
	func remove(task: Task){
		
		if let index = getIndexOf(task: task){
			
			tasks.remove(at: index)
		}
		
	}
	
	func getTask(at index: Int) -> Task{
		
		return tasks[index]
	}
	
	func markTaskAsDone(_ task: Task){
		
		if let index = getIndexOf(task: task){
			
			var task = tasks[index]
			task.done = true
		}
		
	}
}

extension TaskManager{
	
	 func addRandomTask() -> Bool{
		
		let namesArray = ["Go to Doctor", "Date night", "Kids basketball", "Take kids to grandparents", "Visit friend"]
		
		let descArray = ["Doctors appointment for general checkup", "Take wife to the cinema", "Watch Layla play basketball and book ticket", "Leave at 6am to avoid traffic", "Overdue appointment to meet Ray's new baby"]
		
		//this is super cool, never heard of this function
		guard let random_name = namesArray.randomElement() else { return false }
		
		//Original bug was to use randomElement on descArray, desc and name must match
		guard let name_index = namesArray.firstIndex(of: random_name) else { return false }
		let random_desc = descArray[name_index]
		
		let task = Task.init(name: random_name, description: random_desc)

		return add(task: task)
		
	}
}
