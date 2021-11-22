//
//  Store.swift
//  TaskManager
//
//  Created by Dee Odus on 22/11/2021.
//

import Foundation

final class Store{
	
	func saveTasks(_ tasks: [Task]){
		
		let encoder = JSONEncoder()
		
		do{
			let data = try encoder.encode(tasks)
			UserDefaults.standard.setValue(data, forKey: "tasks")
		}catch{
			print(error.localizedDescription )
		}
	}
	
	func fetchTasks() -> [Task]?{
		
		let decoder = JSONDecoder()
		
		do{
			
			if let data = UserDefaults.standard.data(forKey: "tasks"){
				
				let tasks = try decoder.decode([Task].self, from: data)
				return tasks
			}
			
			
		}catch{
			print(error.localizedDescription)
			return nil
		}
		
		return nil
	}
}
