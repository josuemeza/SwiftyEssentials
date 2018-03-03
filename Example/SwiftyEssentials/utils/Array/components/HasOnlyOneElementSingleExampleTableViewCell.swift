//
//  HasOnlyOneElementSingleExampleTableViewCell.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyUtils

class HasOnlyOneElementSingleExampleTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var removeButton: UIButton!
    
    // MARK: - Attributes
    
    private let colors: [UIColor] = [.red, .green, .purple]
    private var elements: [UIColor] = []
    
    // MARK: - Actions
    
    @IBAction func addElement(_ sender: UIButton?) {
        self.elements.append(self.colors[Int(arc4random_uniform(UInt32(self.colors.count)))])
        self.collectionView.insertItems(at: [IndexPath(row: self.elements.count-1, section: 0)])
        self.removeButton.isEnabled = true
        self.resultLabel.text = "Has\(self.elements.hasOnlyOneElement ? " ": " not ")only one element"
    }
    
    @IBAction func removeElement(_ sender: UIButton?) {
        self.elements.removeLast()
        self.collectionView.deleteItems(at: [IndexPath(row: self.elements.count, section: 0)])
        self.removeButton.isEnabled = !self.elements.isEmpty
        self.resultLabel.text = "Has\(self.elements.hasOnlyOneElement ? " ": " not ")only one element"
    }

}

extension HasOnlyOneElementSingleExampleTableViewCell: UICollectionViewDataSource {
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.elements.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        cell.backgroundColor = self.elements[indexPath.row]
        return cell
    }
    
}
