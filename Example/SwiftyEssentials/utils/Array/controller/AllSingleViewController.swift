//
//  AllSingleViewController.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class AllSingleViewController: UIViewController {
    
    // MARK: - Attributes
    
    private var defaultSingleTableView: UITableView!
    
    // MARK: - View controller methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let defaultSingleTableViewController = storyboard.instantiateViewController(withIdentifier: "default_single_table_view_controller") as! DefaultSingleTableViewController
        self.defaultSingleTableView = defaultSingleTableViewController.tableView
    }

}

extension AllSingleViewController: UITableViewDataSource {
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 3
        case 1: return 1
        default: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let identifier = DefaultSingleTableViewCellIdentifier.title.rawValue
                let cell = self.defaultSingleTableView.dequeueReusableCell(withIdentifier: identifier) as! SingleTitleTableViewCell
                cell.titleLabel.text = "All"
                return cell
            case 1:
                let identifier = DefaultSingleTableViewCellIdentifier.paragrapth.rawValue
                let cell = self.defaultSingleTableView.dequeueReusableCell(withIdentifier: identifier) as! SingleParagraphTableViewCell
                cell.paragraphLabel.text = "Equals to comparation by conjunction."
                return cell
            case 2:
                let identifier = DefaultSingleTableViewCellIdentifier.code.rawValue
                let cell = self.defaultSingleTableView.dequeueReusableCell(withIdentifier: identifier) as! SingleCodeTableViewCell
                cell.codeLabel.text = "var all: Bool"
                return cell
            default: return UITableViewCell()
            }
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "example_cell") as! AllSingleExampleTableViewCell
            return cell
        default: return UITableViewCell()
        }
    }
    
}
