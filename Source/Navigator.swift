//
//  Navigator.swift
//  Direct
//
//  Created by Igor Matyushkin on 06.01.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit

public class Navigator {
    
    // MARK: Class variables & properties
    
    public static var shared = {
        return Navigator()
    }()
    
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
    
    public fileprivate(set) var scene: Scene?
    
    // MARK: Public object methods
    
    @discardableResult
    public func createWindow<Window : UIWindow>(ofType type: Window.Type) -> Self {
        // Initialize window
        
        self.window = Window(frame: UIScreen.main.bounds)
        self.window!.backgroundColor = .white
        self.window!.makeKeyAndVisible()
        
        // Return current navigator instance to support call chains
        
        return self
    }
    
    @discardableResult
    public func createWindow() -> Self {
        // Create window with default `UIWindow` type
        
        self.createWindow(ofType: UIWindow.self)
        
        // Return current navigator instance to support call chains
        
        return self
    }
    
    @discardableResult
    public func setScene(_ scene: Scene) -> Self {
        // Assertions
        
        assert(self.window != nil, "Window should be created before switching to scene")
        
        // Save scene
        
        self.scene = scene
        
        // Handle scene before appearance
        
        scene.eventHandlerSet?.willAppear?(self)
        
        // Update window
        
        self.window!.rootViewController = scene.rootNavigationController
        
        // Handle scene after appearance
        
        scene.eventHandlerSet?.didAppear?(self)
        
        // Return current navigator instance to support call chains
        
        return self
    }
    
    @discardableResult
    public func performTransition(_ transition: Transition) -> Self {
        // Obtain current navigation controller
        
        guard let currentNavigationController = self.scene?.rootNavigationController else {
            return self
        }
        
        // Handle transition
        
        switch transition {
        case .push(let viewController, let animated):
            currentNavigationController.pushViewController(viewController, animated: animated)
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
        case .replaceTop(let replacement, let animated):
            let indexOfTopViewController = currentNavigationController.viewControllers.count - 1
            
            guard indexOfTopViewController >= 0 else {
                return self
            }
            
            var newViewControllersCollection = Array(currentNavigationController.viewControllers)
            newViewControllersCollection[indexOfTopViewController] = replacement
            
            currentNavigationController.setViewControllers(newViewControllersCollection, animated: animated)
            break
        }
        
        // Return current navigator instance to support call chains
        
        return self
    }
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}
