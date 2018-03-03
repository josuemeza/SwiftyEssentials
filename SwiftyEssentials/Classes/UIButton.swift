//
//  UIButton.swift
//
//  Created by Josue Meza Peña on 22-06-17.
//  Copyright © 2017 Josue Meza Peña. All rights reserved.
//

import UIKit

extension UIButton {
    
    /**
        **enabled**
     
        Set enabled or disabled to button apply different opacity. Default: 0.5 to disabled.
     */
    func enabled(_ enabled: Bool, opacity: CGFloat = 0.5) {
        self.isEnabled = enabled
        self.backgroundColor = self.backgroundColor!.withAlphaComponent(enabled ? 1.0 : opacity)
    }
    
}
