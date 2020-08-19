//
//  ListRemoteDataManager.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import Foundation

class ListRemoteDataManager: BaseDataManager, ListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: ListRemoteDataManagerOutputProtocol?
    
    func retrieveTaskList() {
        self.servicesContainer.listService?.getList(completed: { [weak self] (tasks) in
            self?.remoteRequestHandler?.onTaskRetrieved(tasks)
            }, failure: { [weak self] (error) in
                self?.remoteRequestHandler?.onError(error)
        })
    }
    
}
