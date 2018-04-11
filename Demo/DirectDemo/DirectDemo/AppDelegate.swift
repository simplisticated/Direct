//
//  AppDelegate.swift
//  DirectDemo
//
//  Created by Igor Matyushkin on 06.01.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import Direct

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, NavigatorDelegate {
    
    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    // MARK: Private object methods
    
    // MARK: Protocol implementation
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        let navigator = Navigator.shared
        navigator.delegate = self
        navigator.createWindow()
        navigator.setScene(.main)
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func navigator(_ navigator: Navigator, willCreateWindowOfType type: UIWindow.Type) {
        print(#function)
    }
    
    func navigator(_ navigator: Navigator, didCreateWindow window: UIWindow) {
        print(#function)
    }
    
    func navigator(_ navigator: Navigator, willChangeSceneTo newScene: Scene) {
        print(#function)
    }
    
    func navigator(_ navigator: Navigator, didChangeSceneTo newScene: Scene) {
        print(#function)
    }
    
    func navigator(_ navigator: Navigator, willPerformTransition transition: Transition) {
        print(#function)
    }
    
    func navigator(_ navigator: Navigator, didPerformTransition transition: Transition) {
        print(#function)
    }
    
}

