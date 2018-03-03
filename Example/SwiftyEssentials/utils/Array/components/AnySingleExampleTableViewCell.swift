//
//  ArraySingleExampleTableViewCell.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyEssentials

class AnySingleExampleTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var centerSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    
    // MARK: - Actions
    
    @IBAction func switchAction(_ sender: UISwitch?) {
        if [self.leftSwitch.isOn, self.centerSwitch.isOn, self.rightSwitch.isOn].any {
            self.resultLabel.text = "Any switch is selected"
        } else {
            self.resultLabel.text = "All switch is off"
        }
    }

}
