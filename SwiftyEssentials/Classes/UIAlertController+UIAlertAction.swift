//
//  UIAlertController+UIAlertAction.swift
//  beme app
//
//  Created by Josue Meza Peña on 13-09-17.
//  Copyright © 2017 Ilógica. All rights reserved.
//

import UIKit

public extension UIAlertController {
    
    /**
     **applyAccessibilityIdentifiers**
     
     Apply accesibility identifiers on UIAlertController.
     */
    func applyAccessibilityIdentifiers() {
        for action in actions
        {
            let label = action.value(forKey: "__representer")
            let view = label as? UIView
            view?.accessibilityIdentifier = action.getAcAccessibilityIdentifier()
        }
        
    }
    
}

public extension UIAlertAction{
    
    private struct AssociatedKeys {
        static var AccessabilityIdentifier = "nsh_AccesabilityIdentifier"
    }
    
    /**
     **setAccessibilityIdentifier**
     
     Set an accessibility identifier to UIAlertAction.
     
     - Parameter accessabilityIdentifier: An string to use like accessibility identifier.
     */
    func setAccessibilityIdentifier(accessabilityIdentifier: String) {
        objc_setAssociatedObject(self, &AssociatedKeys.AccessabilityIdentifier, accessabilityIdentifier, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN)
    }
    
    /**
     **getAcAccessibilityIdentifier**
     
     - Returns: The accessibility identifier of UIAlertAction.
     */
    func getAcAccessibilityIdentifier() -> String? {
        return objc_getAssociatedObject(self, &AssociatedKeys.AccessabilityIdentifier) as? String
    }
}
