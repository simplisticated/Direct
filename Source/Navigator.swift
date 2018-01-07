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
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    public fileprivate(set) var window: UIWindow?
    
    fileprivate var _scene: Scene?
    
    public var scene: Scene? {
        get {
            return self._scene
        }
        set {
            // Assertions
            
            assert(self.window != nil, "Window should be created before switching to scene")
            assert(newValue != nil, "Scene should not be nil")
            
            // Save scene
            
            self._scene = newValue
            
            // Handle scene before appearance
            
            newValue!.eventHandlerSet?.willAppear?(self)
            
            // Update window
            
            self.window!.rootViewController = newValue!.rootNavigationController
            
            // Handle scene after appearance
            
            newValue!.eventHandlerSet?.didAppear?(self)
        }
    }
    
    // MARK: Public object methods
    
    public func createWindow<Window : UIWindow>(ofType type: Window.Type) {
        self.window = Window(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = .white
        self.window!.makeKeyAndVisible()
    }
    
    public func createWindow() {
        self.createWindow(ofType: UIWindow.self)
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
    
    // MARK: Protocol implementation
    
}
