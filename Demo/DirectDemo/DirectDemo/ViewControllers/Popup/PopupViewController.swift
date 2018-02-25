//
//  PopupViewController.swift
//  DirectDemo
//
//  Created by Igor Matyushkin on 06.01.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import UIKit
import Direct

class PopupViewController: UIViewController {

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
        
        self.navigationItem.title = "Popup"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Private object methods
    
    // MARK: Actions
    
    @IBAction func backButtonDidTap(_ sender: Any) {
        Navigator.shared.performTransition(.pop(animated: true))
    }
    
    // MARK: Protocol implementation
    
}
