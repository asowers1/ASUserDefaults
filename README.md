# ASUserDefaults

[![CI Status](http://img.shields.io/travis/asowers1/ASUserDefaults.svg?style=flat)](https://travis-ci.org/asowers1/ASUserDefaults)
[![Version](https://img.shields.io/cocoapods/v/ASUserDefaults.svg?style=flat)](http://cocoapods.org/pods/ASUserDefaults)
[![License](https://img.shields.io/cocoapods/l/ASUserDefaults.svg?style=flat)](http://cocoapods.org/pods/ASUserDefaults)
[![Platform](https://img.shields.io/cocoapods/p/ASUserDefaults.svg?style=flat)](http://cocoapods.org/pods/ASUserDefaults)

## Description

ASUserDefaults is an NSUserDefaults wrapper written for Swift 2.0.
You may be asking yourself the following question: "why does NSUserDefaults need a wrapper?"
While NSUserDefaults is already a simple to use API, I found myself still occasionally needing to look up the documentation for it.
What ASUserDefaults aims to do is simplify your NSUserDefaults flow by simply calling a `Save` and `Load` method on the ASUserDefaults shared manager (singleton) class.
Beyond this simplification, ASUserDefaults offers a delegate that notifys delegators of when an object is being saved/loaded and its key.
The ASUserDefaults pod project includes an example project and tests.
Feel free to offer a PR or comment on whether you think this project is useful or not.

Enjoy!

## Example

```Swift
import UIKit
import ASUserDefaults

class ViewController: UIViewController, ASUserDefaultsManagerDelegate {
    
    let userDefaultsManager = ASUserDefaultsManager.sharedManager

    override func viewDidLoad() {
        super.viewDidLoad()
        userDefaultsManager.delegate = self
        
        userDefaultsManager.save(100, key: "aValue")
        
        print("value is: \(userDefaultsManager.load("aValue"))")
        
        userDefaultsManager.save(1000, key: "aValue")
        
        print("value is: \(userDefaultsManager.load("aValue"))")
        
        userDefaultsManager.save(100.50, key: "aValue")
        
        print("final value is: \(userDefaultsManager.load("aValue"))")
    
    }

    func didSaveObject(object: AnyObject?, withName: String) {
        print("did save: \(object) named: \(withName)")
    }
    
    func didLoadObject(object: AnyObject?, withName: String) {
        print("did load: \(object) named: \(withName)")
    }

}
```

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

ASUserDefaults is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ASUserDefaults"
```

## Author

asowers1, asow123@gmail.com

## License

ASUserDefaults is available under the MIT license. See the LICENSE file for more info.
