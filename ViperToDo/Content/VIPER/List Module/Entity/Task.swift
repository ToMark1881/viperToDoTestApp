//
//  Task.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import Foundation


class Task: NSObject {
    
    var date: Date?
    var text: String?
    
    init(_ dict: Dictionary<String, AnyObject>) {
        if let dateString = dict["date"] as? String, let date = dateString.toDate(withFormat: kAppDateFormat) {
            self.date = date
        } else { self.date = nil }
        self.text = dict["text"] as? String
        super.init()
    }
    
    convenience init(text: String, date: Date) {
        self.init(["text": text, "date": date.toString()] as Dictionary<String, AnyObject>)
    }
    
}
