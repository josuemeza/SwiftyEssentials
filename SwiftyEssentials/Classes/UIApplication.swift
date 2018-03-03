//
//  UIApplication.swift
//  beme app
//
//  Created by Josue Meza Peña on 30-01-18.
//  Copyright © 2018 Ilógica. All rights reserved.
//

import UIKit

public extension UIApplication {
    
    /**
     **topViewController**
     
     Return the top view controller fron parameter base.
     
     - Parameter base: Base UIViewController to search.
     - Returns: Base UIViewController.
     */
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
    
}
