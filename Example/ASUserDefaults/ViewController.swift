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
        
        userDefaultsManager.save(100, key: "aValue")
        
        print("value is: \(userDefaultsManager.load("aValue"))")
        
        userDefaultsManager.save(1000, key: "aValue")
        
        print("value is: \(userDefaultsManager.load("aValue"))")
        
        userDefaultsManager.save(100.50, key: "aValue")
        
        print("final value is: \(userDefaultsManager.load("aValue"))")
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didSaveObject(object: AnyObject?, withName: String) {
        print("did save: \(object) named: \(withName)")
    }
    
    func didLoadObject(object: AnyObject?, withName: String) {
        print("did load: \(object) named: \(withName)")
    }

}

