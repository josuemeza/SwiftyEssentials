//
//  UIView.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import UIKit

extension UIView {
    
    /**
        **roundOut**
     
        Add corner radious to this view.
     
        - Parameter radious: Radious value to apply.
     */
    func roundOut(radious: Float) {
        self.layer.cornerRadius = CGFloat(radious)
        self.clipsToBounds = true
    }
    
    /**
        **border**
     
        Set border with color to this view.
     
        - Parameters:
            - color: Border color.
            - width: Border width.
     */
    func border(_ color: UIColor, width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
    /**
         **shadow**
     
         Set shadow with the parameter conditions.
     
         - Parameters:
             - color: Shadow color.
             - opacity: Shadow opacity.
             - offset: Shadow offset from element.
             - radious: Shadow radious.
     */
    func shadow(color: UIColor, opacity: Float, offset: CGSize, radious: CGFloat) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowOffset = offset
        self.layer.shadowRadius = radious
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    }
    
    /**
         **clone**
     
         Clone this object descendant of UIView.
     */
    func clone<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
    
    /**
         **gradient**
     
         Apply color gradient to UIView
     
         - Parameters:
             - colours: Array with colours to apply on gradient.
             - locations: Percentage location of color apparition.
     */
    func gradient(colours: [UIColor], horizontal: Bool = false, locations: [NSNumber]? = nil) -> CAGradientLayer {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        if horizontal {
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        }
        self.layer.insertSublayer(gradient, at: 0)
        return gradient
    }
    
}

