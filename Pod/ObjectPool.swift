//
//  ObjectPool.swift
//  TWObject
//
//  Created by kimtaewan on 2016. 1. 14..
//  Copyright © 2016년 carq. All rights reserved.
//

import Foundation

public class ObjectPool<T>: NSObject {
    private var _activeList = [T]()
    private var _deactiveList = [T]()
    
    var activeList: [T] {
        return _activeList
    }
    
    var deactiveLst: [T] {
        return _deactiveList
    }
    
    public func getInstance() -> T {
        var instance: AnyObject?
        if _deactiveList.count == 0 {
            if let clz: NSObject.Type = T.self as? NSObject.Type {
                instance = clz.init()
            }
        } else {
            instance = _deactiveList.removeFirst() as? AnyObject
        }
        _activeList.append(instance as! T)
        return instance as! T
    }
    
    public func returnInstance(instance: T){
        for (idx, value)  in _activeList.enumerate() {
            if isEqual(instance, b: value) {
                _deactiveList.append(instance)
                _activeList.removeAtIndex(idx)
                return
            }
        }
    }
    
    private func isEqual(a: T , b: T) -> Bool{
        guard let aObj = a as? AnyObject,
            bObj = b as? AnyObject else { return false }
        return  aObj === bObj
    }
    
}
