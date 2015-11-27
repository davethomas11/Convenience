//
//  Conveniences.swift
//  Convenience
//
//  Created by David Thomas on 2015-11-26.
//  Copyright © 2015 David Thomas. All rights reserved.
//

import Foundation
import UIKit

/**
* Quick and dirty alert message
*/
public func alert(title title:String, message:String, controller:UIViewController, okButtonText:String="Ok", style:UIAlertActionStyle=UIAlertActionStyle.Default, animated:Bool=true, onShown:(()->Void)?=nil, onOkPressed:((UIAlertAction)->Void)?=nil) {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
    alert.addAction(UIAlertAction(title: okButtonText, style: style, handler: onOkPressed))
    
    let presenter:UIViewController
    
    if (controller.navigationController != nil) {
        presenter = controller.navigationController!
    } else {
        presenter = controller
    }
    
    presenter.presentViewController(alert, animated: animated, completion: onShown)
    
    
}


/**
* Shows Activity indicator. Returns view to dismiss it.
  Example:
 
  let loader = busy(self) // while loading
 
  loader.removeFromSuperview() // when done
*/
public func busy(controller:UIViewController, overlayColorHexString:String="#70000000", activityIndicator:UIActivityIndicatorView=UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)) -> UIView {
  
    let overlay = UIView(frame: UIScreen.mainScreen().bounds)
    overlay.backgroundColor = UIColor.colorFromHex(overlayColorHexString)
    let activity = activityIndicator
    activity.startAnimating()
    activity.center = overlay.center
    overlay.addSubview(activity)
    
    controller.view.addSubview(overlay)
    
    
    return overlay
    
}


public func delay(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

public func doInBackground<T>(closure:()->T, after:(T)->Void) {
    let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
    dispatch_async(dispatch_get_global_queue(priority, 0)) {
        let result:T = closure()
        dispatch_async(dispatch_get_main_queue()) {
            after(result)
        }
    }
}






















