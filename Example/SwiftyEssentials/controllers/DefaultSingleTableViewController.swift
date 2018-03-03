//
//  DefaultSingleTableViewController.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

enum DefaultSingleTableViewCellIdentifier: String {
    case title = "title_cell"
    case paragrapth = "paragraph_cell"
    case code = "code_cell"
}

class DefaultSingleTableViewController: UITableViewController {
    
    // MARK: - View controller

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
