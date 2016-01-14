//
//  SharedIntance.swift
//  TWObject
//
//  Created by kimtaewan on 2016. 1. 14..
//  Copyright © 2016년 carq. All rights reserved.
//

import Foundation

public class SharedIntance {
    private var _dic = [String: AnyObject]()
    
    public func getInstance<T>(target: T) -> AnyObject {
        var instance: AnyObject!
        
        if let clz: NSObject.Type = target.self as? NSObject.Type {
            let key = clz.description().lowercaseString
            if _dic[key] == nil {
                instance = clz.init()
                _dic[key] = instance
            } else {
                instance = _dic[key]
            }
        }
        return instance
    }
    
    public func resetAll(){
        _dic.removeAll()
    }
}