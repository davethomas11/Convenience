//
//  UImageView+Conveniences.swift
//  Convenience
//
//  Created by David Thomas on 2015-11-26.
//  Copyright © 2015 David Thomas. All rights reserved.
//

import Foundation

extension UIImageView {
    
    func startAnimatingWithCallback(callback:() -> Void) {
        self.startAnimating()
        
        let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
            while(self.isAnimating()) { usleep(10000); }
            dispatch_async(dispatch_get_main_queue()) {
                callback()
            }
        }
        
        
    }
}