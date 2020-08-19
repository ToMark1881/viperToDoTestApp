//
//  ListService.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import Foundation
import Firebase


protocol ListAPIInterface: class {
    
    func getList(completed: @escaping (([Task]) -> Void), failure: @escaping((Error?)) -> Void)
    
    func sendTask(date: Date, text: String, completed: @escaping (() -> Void), failure: @escaping((Error?)) -> Void)
    
}

class ListAPIService: ListAPIInterface {
    
    func sendTask(date: Date, text: String, completed: @escaping (() -> Void), failure: @escaping((Error?)) -> Void) {
        Database.database().reference().child("tasks").childByAutoId().setValue(["date": date.toString(), "text": text]) { (err, ref) in
            if let error = err { failure(error); return }
            completed()
        }
    }
    
    
    func getList(completed: @escaping (([Task]) -> Void), failure: @escaping((Error?)) -> Void) {
        Database.database().reference().child("tasks").observeSingleEvent(of: .value) { (snap) in
            if let list = snap.value as? [String: Dictionary<String, AnyObject>] {
                self.parseList(list, completed: completed)
            }
        }
    }
    
    fileprivate func parseList(_ list: [String: Dictionary<String, AnyObject>], completed: @escaping(([Task]) -> Void)) {
        var tasks = [Task]()
        for item in list {
            let task = Task(item.value)
            tasks.append(task)
        }
        completed(tasks)
    }
    
    
}
