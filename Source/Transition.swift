//
//  Transition.swift
//  Direct
//
//  Created by Igor Matyushkin on 06.01.2018.
//  Copyright © 2018 Igor Matyushkin. All rights reserved.
//

import Foundation
import UIKit

public enum Transition {
    case push(viewController: UIViewController, animated: Bool)
    case replaceTop(replacement: UIViewController, animated: Bool)
    case pop(animated: Bool)
    case popToRootViewController(animated: Bool)
    case present(viewController: UIViewController, animated: Bool, completion: (() -> Void)?)
    case dismiss(animated: Bool, completion: (() -> Void)?)
}
