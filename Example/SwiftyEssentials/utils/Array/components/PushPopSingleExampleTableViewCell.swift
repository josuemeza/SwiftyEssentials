//
//  PushPopSingleExampleTableViewCell.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyUtils

class PushPopCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var textLabel: UILabel!
    
}

class PushPopSingleExampleTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Attributes
    
    private var elements = [String]()
    
    // MARK: - Actions
    
    @IBAction func pushAction(_ sender: UIButton?) {
        if let button = sender,  let value = button.titleLabel?.text, let iterator = Int(value.replacingOccurrences(of: "Push ", with: "")) {
            self.elements.push("\(iterator)")
            self.collectionView.reloadData()
            button.setTitle("Push \(iterator+1)", for: .normal)
        }
    }
    
    @IBAction func popAction(_ sender: UIButton?) {
        _ = self.elements.pop()
        self.collectionView.reloadData()
    }

}

extension PushPopSingleExampleTableViewCell: UICollectionViewDataSource {
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath) as! PushPopCollectionViewCell
        cell.textLabel.text = self.elements[indexPath.row]
        return cell
    }
    
}
