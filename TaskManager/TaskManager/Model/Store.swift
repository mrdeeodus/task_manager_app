//
//  Store.swift
//  TaskManager
//
//  Created by Dee Odus on 22/11/2021.
//

import Foundation

enum StoreError: Error{
	
	case fetchTaskFailed(String)
	case saveTaskFailed(String)
}

final class Store{
	
	static let shared = Store()
	let userdefault = UserDefaults.standard
	let decoder = JSONDecoder()
	let encoder = JSONEncoder()
	
	func saveTasks(_ tasks: [Task]) throws {

		do{
			let data = try encoder.encode(tasks)
			userdefault.setValue(data, forKey: UserDefaultKeys.Tasks)
		}catch{
			
			print(error.localizedDescription )
			throw StoreError.saveTaskFailed("Failed to save tasks")
		}
	}
	
	func fetchTasks() throws -> [Task] {
		
		do{
			
			if let data = userdefault.data(forKey: UserDefaultKeys.Tasks){
				
				let tasks = try decoder.decode([Task].self, from: data)
				return tasks
			}
			
			
		}catch{
			print(error.localizedDescription)
			throw StoreError.fetchTaskFailed("Failed to fetch the tasks")
			
		}
		
		return []
	}
}
