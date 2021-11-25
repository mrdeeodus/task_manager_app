
//  Created by Dee Odus on 18/11/2021.
//

import Foundation

final class TaskManager{
	
	static let shared = TaskManager()
	private var tasks: [Task]
	private let store = Store.shared
	
	init() {
		
		do{
			self.tasks = try store.fetchTasks()
		}
		catch{
			self.tasks = []
		}
	}
	
	var taskCount: Int{
		
		return tasks.count
	}
	
	func getIndexOf(task: Task) -> Int?{
		
		
		return tasks.firstIndex(of: task)
	}
	
	//return a boolean for successful/failed add
	func add(task: Task) -> Bool{
		
		guard !tasks.contains(task) else { return false }
		
		tasks.append(task)
		do {
			try store.saveTasks(tasks)
			return true
		}
		catch StoreError.saveTaskFailed(let errorMessage){
			
			print(errorMessage)
		}
		catch{
			print(error)
		}
		
		return false
		
	}
	
	func remove(task: Task) -> Bool{
		
		if let index = getIndexOf(task: task){
			
			tasks.remove(at: index)
			
			do{
				try store.saveTasks(tasks)
				return true
				
			}catch StoreError.saveTaskFailed(let errorMessage){
				
				print(errorMessage)
				
			}catch{
				print(error)
			}
			
			
		}
		
		return false
		
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
