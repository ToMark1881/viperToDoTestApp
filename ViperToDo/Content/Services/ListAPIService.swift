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
    
    func getList(completed: @escaping ((Any) -> Void), failure: @escaping((Error?)) -> Void)
    
    func sendTask(date: Date, text: String, completed: @escaping (() -> Void), failure: @escaping((Error?)) -> Void)
    
}

class ListAPIService: ListAPIInterface {
    
    func sendTask(date: Date, text: String, completed: @escaping (() -> Void), failure: @escaping((Error?)) -> Void) {
        Database.database().reference().child("tasks").childByAutoId().setValue(["date": date.toString(), "text": text]) { (err, ref) in
            if let error = err { failure(error); return }
            completed()
        }
    }
    
    
    func getList(completed: @escaping ((Any) -> Void), failure: @escaping((Error?)) -> Void) {
        Database.database().reference().child("tasks").observeSingleEvent(of: .value, with: { (snap) in
            if let snapshot = snap.value {
                completed(snapshot)
            }
        }) { (err) in
            failure(err)
        }
    }
    
    
}
