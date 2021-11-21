//
//  TasksCell.swift
//  TaskManager
//
//  Created by Dee Odus on 21/11/2021.
//

import UIKit

final class TasksCell: UITableViewCell {

	@IBOutlet weak var taskNameLabel: UILabel!
	@IBOutlet weak var taskDescLabel: UILabel!
	
	var task: Task!{
		
		didSet{
			
			taskNameLabel?.text = task.name
			taskDescLabel?.text = task.description
		}
	}
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
