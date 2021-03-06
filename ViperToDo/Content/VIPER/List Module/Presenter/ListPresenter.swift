//
//  ListPresenter.swift
//  ViperToDo
//
//  Created Vladyslav Vdovychenko on 18.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ListPresenter: BasePresenter, ListPresenterProtocol {
    
    weak var view: ListViewProtocol?
    var interactor: ListInteractorInputProtocol?
    var wireframe: ListWireframeProtocol?
    
    func viewDidLoad() {
        interactor?.retrieveTaskList()
    }
    
    func showNewTask() {
        guard let view = view else { return }
        wireframe?.presentNewTaskScreen(from: view)
    }

}

extension ListPresenter: ListInteractorOutputProtocol {
    
    func didReceiveTasks(_ tasks: [Task]) {
        view?.showTasks(with: tasks)
    }
    
    func onError(_ error: Error?) {
        view?.showError(error)
    }
    
}

extension ListPresenter: NewTaskDelegate {
    func didUploadTask() {
        interactor?.retrieveTaskList()
    }
    
}
