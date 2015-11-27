//
//  Number+Conveniences.swift
//  Convenience
//
//  Created by David Thomas on 2015-11-27.
//  Copyright © 2015 David Thomas. All rights reserved.
//

import Foundation

protocol NumericType {
    func +(lhs: Self, rhs: Self) -> Self
    func -(lhs: Self, rhs: Self) -> Self
    func *(lhs: Self, rhs: Self) -> Self
    func /(lhs: Self, rhs: Self) -> Self
    func %(lhs: Self, rhs: Self) -> Self
    
    func <(lhs: Self, rhs: Self) -> Bool
    func >(lhs: Self, rhs: Self) -> Bool
    func <=(lhs: Self, rhs: Self) -> Bool
    func >=(lhs: Self, rhs: Self) -> Bool
    func ==(lhs: Self, rhs: Self) -> Bool
    
    init(_ v: Int)
}

extension Double : NumericType { }
extension Float  : NumericType { }
extension Int    : NumericType { }
extension Int8   : NumericType { }
extension Int16  : NumericType { }
extension Int32  : NumericType { }
extension Int64  : NumericType { }
extension UInt   : NumericType { }
extension UInt8  : NumericType { }
extension UInt16 : NumericType { }
extension UInt32 : NumericType { }
extension UInt64 : NumericType { }

extension NumericType {
    
    func withSuffix() -> String {
        
        var absSelf = self;
        if (self < Self(0)) {
            absSelf = self * Self(-1);
        }
        
        var mod = absSelf % Self(100);
        
        if (mod == Self(11) ||
            mod == Self(12) ||
            mod == Self(13)) {
                
                return "\(self)th"
                
        } else {
            
            mod = absSelf % Self(10);
            
            if (mod == Self(1)) {
                
                return "\(self)st"
                
            } else if (mod == Self(2)) {
                
                return "\(self)nd"
                
            } else if (mod == Self(3)) {
                
                return "\(self)rd"
            }
        }
        
        return "\(self)th"
    }
    
    func abreviate(decimalPlaces:Int=2) -> String {
        var num = self
        
        if (num < Self(1000)) {
            return String(num)
        }
        
        func abreviate(number:Self, denom:Self, abrvo:String) -> String {
            
            var floatingPoint:Float = 0
            
            if let integer = number as? IntegerLiteralType,
                let denominator = denom as? IntegerLiteralType {
                    
                    floatingPoint = Float(integer) / Float(denominator)
                    
            } else if let floatation = number as? FloatLiteralType,
                let denominator = denom as? FloatLiteralType {
                    
                    floatingPoint = Float(floatation) / Float(denominator)
            }
            
            let multiplier = powf(10, Float(decimalPlaces))
            let roundDown = floorf(floatingPoint * multiplier) / multiplier
            
            let resultStr = NSString(format: "%.\(decimalPlaces)f", roundDown)
            
            return resultStr.stringByAppendingString(abrvo)
        }
        
        var abrvos:[String] = ["K","M","B","T","Q"]
        var step = Self(1000)
        
        var abreviated:String?
        
        for (var i = 0; i < abrvos.count; i++) {
            
            if (num > step) {
                abreviated = abreviate(num, denom: step, abrvo: abrvos[i])
            }
            
            step = step * Self(1000)
        }
        
        if let returnValue = abreviated {
            return returnValue
        } else {
            return abreviate(num, denom: step, abrvo: "QQ")
        }
    }
}