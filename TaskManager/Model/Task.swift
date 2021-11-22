
//  Created by Dee Odus on 18/11/2021.
//

import Foundation

struct Task: Equatable, Codable{
	
	let name: String
	let description: String
	var done: Bool = false
}

func==(lhs: Task, rhs: Task) -> Bool {
	
	//done is now used as part of equality check
	return lhs.name == rhs.name && lhs.description == rhs.description && lhs.done == rhs.done
}
