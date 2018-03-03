//
//  JoinedSingleArrayTableViewCell.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyEssentials

class JoinedSingleExampleTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var firstTextField: UITextField!
    @IBOutlet weak var secondTextField: UITextField!
    @IBOutlet weak var separatorTextField: UITextField!
    @IBOutlet weak var resultTextField: UITextField!
    
    // MARK: - Actions
    
    @IBAction func joinAction(_ sender: UIButton?) {
        if let firstText = self.firstTextField.attributedText,
            let secondText = self.secondTextField.attributedText,
            let separator = self.separatorTextField.attributedText {
            self.resultTextField.attributedText = [firstText, secondText].joined(separator: separator)
        } else {
            self.resultTextField.attributedText = NSAttributedString(string: "")
        }
    }

}
