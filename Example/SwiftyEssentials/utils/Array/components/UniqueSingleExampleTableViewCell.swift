//
//  UniqueSingleExampleTableViewCell.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyEssentials

class UniqueSingleExampleTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Attributes
    
    private var elements: [UIColor] = []
    
    // MARK: - Actions
    
    @IBAction func addColorAction(_ sender: UIButton?) {
        if let button = sender {
            self.elements.append(button.tintColor)
            self.collectionView.insertItems(at: [IndexPath(row: self.elements.count-1, section: 0)])
        }
    }
    
    @IBAction func uniqueAction(_ sender: UIButton?) {
        self.elements.unique()
        self.collectionView.reloadData()
    }

}

extension UniqueSingleExampleTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        cell.backgroundColor = self.elements[indexPath.row]
        return cell
    }
    
    
}
