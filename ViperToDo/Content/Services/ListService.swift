//
//  ListService.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import Foundation

class ListService {
    
    var api: ListAPIService?
    
    func getList(completed: @escaping (([Task]) -> Void), failure: @escaping((Error?)) -> Void) {
        self.api?.getList(completed: { (object) in
            if let list = object as? [String: Dictionary<String, AnyObject>] {
                self.parseListContent(list, completed: completed)
            }
        }, failure: failure)
    }
    
    func sendTask(date: Date, text: String, completed: @escaping (() -> Void), failure: @escaping((Error?)) -> Void) {
        self.api?.sendTask(date: date, text: text, completed: completed, failure: failure)
    }
    
    
    
    fileprivate func parseListContent(_ list: [String: Dictionary<String, AnyObject>], completed: @escaping(([Task]) -> Void)) {
        var tasks = [Task]()
        for item in list {
            let task = Task(item.value)
            tasks.append(task)
        }
        completed(tasks)
    }
}
