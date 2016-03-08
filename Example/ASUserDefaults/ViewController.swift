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

