//
//  TaskCell.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import UIKit

class TaskCell: BaseTableViewCell {
    
    @IBOutlet weak var taskTextLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func set(for object: Any) {
        if let post = object as? Task {
            taskTextLabel.text = post.text
            dateLabel.text = post.date?.toString(withFormat: "dd/MM/yy, HH:mm")
        }
    }
    
}
