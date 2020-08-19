//
//  BaseViewController.swift
//  ViperToDo
//
//  Created by Vladyslav Vdovychenko on 19.08.2020.
//  Copyright © 2020 Vladyslav Vdovychenko. All rights reserved.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func handleError(_ err: Error?, text: String? = nil) {
        print(err?.localizedDescription ?? text ?? "Some Error")
    }
    
    deinit {
        print("\(self.className) deinit!")
    }
    
}
