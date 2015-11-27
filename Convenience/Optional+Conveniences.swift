//
//  Optional+Conveniences.swift
//  Convenience
//
//  Created by David Thomas on 2015-11-26.
//  Copyright © 2015 David Thomas. All rights reserved.
//

import Foundation

/**
 *  Syntactic sugar for optionals
 */
extension Optional {
    
    /// alternatively, let _ = optional might be clearer you're not going to use it
    var hasValue: Bool { return self != nil }
    
    /**
     
     Provide unwrapped value with
     optionalValue.or(defaultValue)
     instead of
     optionalValue ? optionalValue! : defaultValue
     
     - parameter defaultValue: if we're not set
     
     - returns: unwrapped self or default
     */
    func or(defaultValue: Wrapped) -> Wrapped {
        switch(self) {
        case .None:
            return defaultValue
        case .Some(let value):
            return value
        }
    }
}

/**
 Or if you'd like hasValue as a function
 
 - parameter value: an optional
 
 - returns: whether it has a value
 */
public func hasValue<T>(value: T?) -> Bool {
    switch (value) {
    case .Some(_): return true
    case .None: return false
    }
}