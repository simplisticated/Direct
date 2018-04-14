//
//  Scene.swift
//  Direct
//
//  Created by Igor Matyushkin on 06.01.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation

open class Scene {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    public init(
        rootController: UINavigationController,
        eventHandlerSet: EventHandlerSet? = nil
    ) {
        // Initialize root controller
        
        self.rootController = rootController
        
        // Initialize event handler set
        
        self.eventHandlerSet = eventHandlerSet
    }
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    public fileprivate(set) var rootController: UIViewController!
    
    public fileprivate(set) var eventHandlerSet: EventHandlerSet?
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
}

public extension Scene {
    
    public struct EventHandlerSet {
        
        public var willAppear: ((_ navigator: Navigator) -> Void)?
        
        public var didAppear: ((_ navigator: Navigator) -> Void)?
        
        public init() {
            self.willAppear = nil
            self.didAppear = nil
        }
        
    }
    
}

public extension Scene {
    
    public var rootNavigationController: UINavigationController? {
        get {
            return self.rootController as? UINavigationController
        }
    }
    
    public var rootTabBarController: UITabBarController? {
        get {
            return self.rootController as? UITabBarController
        }
    }
    
}
