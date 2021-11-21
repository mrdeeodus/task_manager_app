//
//  TaskManagerTests.swift
//  TaskManagerTests
//
//  Created by Dee Odus on 21/11/2021.
//

import XCTest
@testable import TaskManager

class TaskManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	//failing test
	func testSameTaskCannotSaveTwice(){
		
		//1. create taskManager
		let taskManager = TaskManager.init()

		//2. create a task
		let task = Task.init(name: "Visit Friend", description: "See Ray on Monday")
		
		//3. add the task twice
		_ = taskManager.add(task: task)
		_ = taskManager.add(task: task)
		
		//4. get task count
		let taskCount = taskManager.taskCount
		
		//5. task count should be equal to 1
		XCTAssertEqual(taskCount, 1)
		
	}

}
