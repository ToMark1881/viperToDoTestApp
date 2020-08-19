//
//  NewTaskDataManager.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import Foundation

class NewTaskRemoteDataManager: BaseDataManager, NewTaskRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: NewTaskRemoteDataManagerOutputProtocol?
    
    func uploadTask(_ task: Task) {
        self.servicesContainer.listService?.sendTask(date: task.date ?? Date(), text: task.text ?? "", completed: {
            self.remoteRequestHandler?.onTaskUploaded()
        }, failure: { [weak self] (err) in
            self?.remoteRequestHandler?.onError(err)
        })
    }
    
}
