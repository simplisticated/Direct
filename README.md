<p align="center" >
	<img src="/Images/logo_2048_2048.png" alt="Direct" title="Direct" width="300px" height="300px">
</p>

<p align="center">
	<a href="https://swift.org">
		<img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/v/Direct.svg">
	</a>
	<a href="https://cocoapods.org">
		<img src="https://img.shields.io/cocoapods/dt/Direct.svg">
	</a>
	<a href="https://tldrlegal.com/license/mit-license">
		<img src="https://img.shields.io/badge/License-MIT-blue.svg?style=flat">
	</a>
</p>

# Direct

Simplifies transitions between screens in iOS app.

## How To Get Started

- Copy content of `Source` folder to your project.

or

- Use `Direct` cocoapod

## Requirements

* iOS 9 and later
* Xcode 9 and later
* Swift 4

## Usage

### Preparations

Create `Navigator` subclass:

```swift
class MyNavigator : Navigator {

    static var shared = {
        return MyNavigator()
    }()

}
```

Create extension for `Scene` class:

```swift
extension Scene {
    
    static var main: Scene {
        let navigationController = UINavigationController()
        navigationController.viewControllers = [
            MainViewController(nibName: "MainViewController", bundle: nil)
        ]
        return Scene(rootNavigationController: navigationController)
    }
    
}
```

Change `AppDelegate.swift`:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    DemoNavigator.shared
        .createWindow()
        .setScene(scene: .main)
        
    self.window = DemoNavigator.shared.window
    
    return true
}
```

### Scenes

Scene describes a foundation of navigation stack including root controller. Here's an example:

```swift
let navigationController = UINavigationController()

navigationController.viewControllers = [
    MyViewController(nibName: "MyViewController", bundle: nil)
]

let scene = Scene(rootNavigationController: navigationController)
```

It's highly recommended to create extension for `Scene` class and provide static variables describing new scenes like we did in [Preparations](#preparations) section.

Switching between scenes is simple:

```swift
MyNavigator.shared.setScene(newScene)
```

### Manage navigation stack

Push view controller:

```swift
let someViewController = SomeViewController(nibName: "SomeViewController", bundle: nil)
MyNavigator.shared.performTransition(.push(viewController: someViewController, animated: true))
```

Pop:

```swift
MyNavigator.shared.performTransition(.pop(animated: true))
```

Pop to root view controller:

```swift
MyNavigator.shared.performTransition(.popToRootViewController(animated: true))
```

Present:

```swift
MyNavigator.shared.performTransition(.present(viewController: someViewController, animated: true, completion: {
}))
```

Dismiss:

```swift
MyNavigator.shared.performTransition(.dismiss(animated: true, completion: {
}))
```

Access to current navigation controller:

```swift
let currentNavigationController = MyNavigator.shared.scene?.rootNavigationController
```

## License

`Direct` is available under the MIT license. See the [LICENSE](./LICENSE) file for more info.
