//
//  BaseDataManager.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import Foundation
import UIKit

class BaseDataManager {
    
    var servicesContainer: ServicesContainer!
    
    init() {
        initServices()
    }
    
    fileprivate func initServices() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            servicesContainer = appDelegate.servicesContainer
        }
    }
    
}
