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
//
//  ViewController.swift
//  ASUserDefaults
//
//  Created by asowers on 02/13/2016.
//  Copyright (c) 2016 asowers. All rights reserved.
//

import UIKit
import ASUserDefaults

class ViewController: UIViewController, ASUserDefaultsManagerDelegate {

    let userDefaultsManager = ASUserDefaultsManager.sharedManager

    override func viewDidLoad() {
        super.viewDidLoad()

        userDefaultsManager.delegate = self

        userDefaultsManager.save(100, key: "key")

        print("value is: \(userDefaultsManager.load("key"))")

        userDefaultsManager.setSuiteName("suite_1") // switching to alternative suite

        userDefaultsManager.save(1000, key: "key")

        print("value is: \(userDefaultsManager.load("key"))")

        userDefaultsManager.setSuiteName(nil) // switching back to default suite

        userDefaultsManager.save(100.50, key: "key") // this should not effect the value in suite_1

        userDefaultsManager.setSuiteName("suite_1") // witching back to suite_1

        print("final value is: \(userDefaultsManager.load("key"))") // this should print 1000

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func didSaveObject(object: AnyObject?, withName: String, inSuite: String) {
        print("did save: \(object) named: \(withName) in suite: \(inSuite)")
    }

    func didLoadObject(object: AnyObject?, withName: String, inSuite: String) {
        print("did save: \(object) named: \(withName) in suite: \(inSuite)")
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
