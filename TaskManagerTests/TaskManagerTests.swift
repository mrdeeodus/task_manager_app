//
//  TaskManagerTests.swift
//  TaskManagerTests
//
//  Created by Dee Odus on 21/11/2021.
//

import XCTest
@testable import TaskManager

class TaskManagerTests: XCTestCase {

	var taskManager: TaskManager!
	var task: Task!
	
    override func setUpWithError() throws {
		
		taskManager = TaskManager.init()
		task = Task.init(name: "Visit Friend", description: "See Ray on Monday")
    }

    override func tearDownWithError() throws {
        
		taskManager = nil
		task = nil
    }

	//failing test
	func testSameTaskCannotSaveTwice(){

		//add the task twice
		_ = taskManager.add(task: task)
		_ = taskManager.add(task: task)
		
		//get task count
		let taskCount = taskManager.taskCount
		
		//task count should be equal to 1
		XCTAssertEqual(taskCount, 1)
		
	}

}
