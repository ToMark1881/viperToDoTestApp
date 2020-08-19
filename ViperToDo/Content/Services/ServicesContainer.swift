//
//  ServicesContainer.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import Foundation

class ServicesContainer {
    
    var listService: ListAPIInterface?
    
    init() {
        self.listService = ListAPIService()
    }
    
}
