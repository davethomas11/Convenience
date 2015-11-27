//
//  UIView+Conveniences.swift
//  Convenience
//
//  Created by David Thomas on 2015-11-26.
//  Copyright © 2015 David Thomas. All rights reserved.
//

import Foundation

extension UIView {
    
    func hide(duration:NSTimeInterval=0.4, startAlpha:CGFloat=1, targetAlpha:CGFloat=0, callback:(()->Void)?=nil) {
        
        if (!hidden) {
            self.alpha = startAlpha
            
            UIView.animateWithDuration(duration, animations: {
                self.alpha = targetAlpha
                }, completion: { (completed) in
                    self.hidden = true
                    if callback != nil {
                        callback!()
                    }
            })
            
            
        }
        
    }
    
    func show(duration:NSTimeInterval=0.4, startAlpha:CGFloat=0, targetAlpha:CGFloat=1, callback:(()->Void)?=nil) {
        
        if (hidden) {
            self.alpha = startAlpha
            self.hidden = false
            
            UIView.animateWithDuration(duration, animations: {
                self.alpha = targetAlpha
                }, completion: { (completed) in
                    
                    if callback != nil {
                        callback!()
                    }
            })
        }
        
    }
    
    func toggle(duration:NSTimeInterval=0.4, callback:(()->Void)?=nil) {
        if (hidden) {
            show(duration, callback:callback)
            
        } else {
            hide(duration, callback:callback)
            
        }
    }
    
    func setHiddenAnimated(hide:Bool, duration:NSTimeInterval=0.4, callback:(()->Void)?=nil) {
        
        if (hide) {
            self.hide(duration, callback:callback)
            
        } else {
            show(duration, callback:callback)
            
        }
    }
}