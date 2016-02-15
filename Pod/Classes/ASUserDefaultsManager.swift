//
//  ASUserDefaultsManager.swift
//  Pods
//
//  Created by Andrew Sowers on 2/15/16.
//
//

import Foundation

public protocol ASUserDefaultsManagerDelegate {
    func didSaveObject(object: AnyObject?, withName: String)
    func didLoadObject(object: AnyObject?, withName: String)
}


public class ASUserDefaultsManager : NSObject {
    
    static public let sharedManager = ASUserDefaultsManager()
    
    let standardUserDefaults = NSUserDefaults.standardUserDefaults()
    
    public var delegate: ASUserDefaultsManagerDelegate?
    
    // save will do its best to infer the type you'd like to save. Just remember, you should probably know the type you'd like to save/load
    public func save(value: AnyObject?, key: String) {
        self.standardUserDefaults.setObject(value, forKey: key)
        self.delegate?.didSaveObject(value, withName: key)
    }
    
    public func load(key: String) -> AnyObject? {
        let object = self.standardUserDefaults.objectForKey(key)
        self.delegate?.didLoadObject(object, withName: key)
        return object
    }
}