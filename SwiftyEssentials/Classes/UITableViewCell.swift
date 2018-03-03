//
//  UITableViewCell.swift
//  beme app
//
//  Created by Josue Meza Peña on 04-01-18.
//  Copyright © 2018 Ilógica. All rights reserved.
//

import UIKit

extension UITableViewCell {
    
    /// Table view of this cell
    var tableView: UITableView? {
        get {
            var view = self.superview
            while (view != nil) && !(view! is UITableView) {
                view = view?.superview
            }
            return view as! UITableView?
        }
    }
    
    // Index path of this cell on table view
    var indexPath: IndexPath? {
        get {
            guard let tableView = self.tableView else { return nil }
            return tableView.indexPath(for: self)
        }
    }
    
}
