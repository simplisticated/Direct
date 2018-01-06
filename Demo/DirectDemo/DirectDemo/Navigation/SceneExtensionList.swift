//
//  SceneExtensionList.swift
//  DirectDemo
//
//  Created by Igor Matyushkin on 06.01.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation
import Direct

extension Scene {
    
    static var main: Scene {
        let navigationController = UINavigationController()
        navigationController.viewControllers = [
            MainViewController(nibName: "MainViewController", bundle: nil)
        ]
        return Scene(rootNavigationController: navigationController)
    }
    
}
