//
//  MainViewController.swift
//  DirectDemo
//
//  Created by Igor Matyushkin on 06.01.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import Direct

class MainViewController: UIViewController {

    // MARK: Class variables & properties
    
    // MARK: Public class methods
    
    // MARK: Private class methods
    
    // MARK: Initializers
    
    // MARK: Deinitializer
    
    deinit {
    }
    
    // MARK: Outlets
    
    // MARK: Object variables & properties
    
    // MARK: Public object methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup navigation bar
        
        self.navigationItem.title = "Main"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
    @IBAction func openButtonDidTap(_ sender: Any) {
        let popupViewController = PopupViewController(nibName: "PopupViewController", bundle: nil)
        DemoNavigator.shared.performTransition(.push(viewController: popupViewController, animated: true))
    }
    
    // MARK: Protocol implementation
    
}
