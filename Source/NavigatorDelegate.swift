//
//  NavigatorDelegate.swift
//  Direct
//
//  Created by Igor Matyushkin on 11.04.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

public protocol NavigatorDelegate: class {
    
    func navigator(_ navigator: Navigator, willCreateWindowOfType type: UIWindow.Type)
    
    func navigator(_ navigator: Navigator, didCreateWindow window: UIWindow)
    
    func navigator(_ navigator: Navigator, willChangeSceneTo newScene: Scene)
    
    func navigator(_ navigator: Navigator, didChangeSceneTo newScene: Scene)
    
    func navigator(_ navigator: Navigator, willPerformTransition transition: Transition, usingNavigationController navigationController: UINavigationController)
    
    func navigator(_ navigator: Navigator, didPerformTransition transition: Transition, usingNavigationController navigationController: UINavigationController)
    
}
