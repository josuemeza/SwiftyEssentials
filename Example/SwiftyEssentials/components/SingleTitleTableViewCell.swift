//
//  SingleTitleTableViewCell.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 24-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class SingleTitleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
