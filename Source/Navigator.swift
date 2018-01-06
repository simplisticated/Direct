//
//  Navigator.swift
//  Direct
//
//  Created by Igor Matyushkin on 06.01.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

open class Navigator {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init() {
        // Initialize window
        
        self.window = self.createWindow()
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    public fileprivate(set) var window: UIWindow!
    
    public fileprivate(set) var scene: Scene?
    
    // MARK: Public object methods
    
    public func navigate(to scene: Scene) {
        // Handle scene before appearance
        
        scene.eventHandlerSet?.willAppear?(self)
        
        // Update window
        
        self.window.rootViewController = scene.rootNavigationController
        
        // Handle scene after appearance
        
        scene.eventHandlerSet?.didAppear?(self)
        
        // Save scene
        
        self.scene = scene
    }
    
    public func performTransition(_ transition: Transition) {
        guard let currentNavigationController = self.scene?.rootNavigationController else {
            return
        }
        
        switch transition {
        case .push(let viewController, let animated):
            currentNavigationController.pushViewController(viewController, animated: animated)
            break
        case .replaceTop(let replacement, let animated):
            let indexOfTopViewController = currentNavigationController.viewControllers.count - 1
            
            guard indexOfTopViewController >= 0 else {
                return
            }
            
            var newViewControllersCollection = Array(currentNavigationController.viewControllers)
            newViewControllersCollection[indexOfTopViewController] = replacement
            
            currentNavigationController.setViewControllers(newViewControllersCollection, animated: animated)
            break
        case .pop(let animated):
            currentNavigationController.popViewController(animated: animated)
            break
        case .popToRootViewController(let animated):
            currentNavigationController.popToRootViewController(animated: animated)
            break
        case .present(let viewController, let animated, let completion):
            currentNavigationController.present(viewController, animated: animated, completion: {
                completion?()
            })
            break
        case .dismiss(let animated, let completion):
            currentNavigationController.dismiss(animated: animated, completion: {
                completion?()
            })
            break
        }
    }
    
    // MARK: Private object methods
    
    fileprivate func createWindow() -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        return window
    }
    
    // MARK: Protocol implementation
    
}
