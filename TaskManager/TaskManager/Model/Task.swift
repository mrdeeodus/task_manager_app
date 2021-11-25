
//  Created by Dee Odus on 18/11/2021.
//

import Foundation

struct Task: Equatable, Codable{
	
	let name: String
	let description: String
	var done: Bool = false
}
