//
//  String+Conveniences.swift
//  Convenience
//
//  Created by David Thomas on 2015-11-26.
//  Copyright © 2015 David Thomas. All rights reserved.
//

import Foundation

/**
 *  Syntactic sugar for strings
 */
extension String {
    
    /// for the common use case of not bothering with a comment
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: "")
    }
    
    /// for the properly done use case of including a comment
    func localizedWithComment(comment:String) -> String {
        return NSLocalizedString(self, tableName: nil, bundle: NSBundle.mainBundle(), value: "", comment: comment)
    }
    
    /// truncate from beginning to toIndex
    func truncate(toIndex: Int) -> String {
        if self.characters.count > toIndex {
            return self.substringToIndex(self.startIndex.advancedBy(toIndex)) + "..."
        } else {
            return self
        }
    }
    
    var isEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
        return matchesRegex(regex)
    }
    
    func matchesRegex(regex: String) -> Bool {
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        let matches = test.evaluateWithObject(self)
        return matches
    }
}