//
//  ASUserDefaultsManager.swift
//  Pods
//
//  Created by Andrew Sowers on 2/15/16.
//
//

import Foundation

public protocol ASUserDefaultsManagerDelegate {
    func didSaveObject(object: AnyObject?, withName: String, inSuite: String)
    func didLoadObject(object: AnyObject?, withName: String, inSuite: String)
}


public class ASUserDefaultsManager : NSObject {
    
    var suiteZone: String? = nil // the default suite is nil, and this will result in NSUserDefaults using the standardUserDefaults suite
    
    static public let sharedManager = ASUserDefaultsManager()

    public var delegate: ASUserDefaultsManagerDelegate?
    
    // save will do its best to infer the type you'd like to save. Just remember, you should probably know the type you'd like to save/load
    public func save(value: AnyObject?, key: String) {
        var suite = "stardardUserDefaults"
        if let _ = self.suiteZone {
            NSUserDefaults(suiteName: suiteZone)?.setObject(value, forKey: key)
            suite = self.suiteZone!
        } else {
            NSUserDefaults.standardUserDefaults().setObject(value, forKey: key)
            
        }
        self.delegate?.didSaveObject(value, withName: key, inSuite: suite)
        
    }
    
    public func load(key: String) -> AnyObject? {
        var object: AnyObject?
        var suite = "standardUserDefaults"
        if let _ = self.suiteZone {
            object = NSUserDefaults(suiteName: suiteZone)?.objectForKey(key)
            suite = self.suiteZone!
        } else {
            object = NSUserDefaults.standardUserDefaults().objectForKey(key)
        }
        self.delegate?.didLoadObject(object, withName: key, inSuite: suite)
        return object
    }
    
    public func setSuiteName(suiteName: String?) {
        self.suiteZone = suiteName
    }
}