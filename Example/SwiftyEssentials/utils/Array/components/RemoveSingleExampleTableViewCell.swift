//
//  RemoveSingleExampleTableViewCell.swift
//  SwiftyUtils_Example
//
//  Created by Josue Meza Peña on 25-02-18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import SwiftyUtils

class RemoveSingleExampleTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    @IBOutlet weak var selectorCollectionView: UICollectionView!
    
    // MARK: - Attributes
    
    private var list: [UIColor] = [.red, .yellow, .green, .blue]
    private var selector: [UIColor] = [.black, .brown, .purple]

}

extension RemoveSingleExampleTableViewCell: UICollectionViewDataSource {
    
    // MARK: - Collection view data source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case self.listCollectionView: return self.list.count
        case self.selectorCollectionView: return self.selector.count
        default: return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "item", for: indexPath)
        switch collectionView {
        case self.listCollectionView: cell.backgroundColor = self.list[indexPath.row]
        case self.selectorCollectionView: cell.backgroundColor = self.selector[indexPath.row]
        default: ()
        }
        return cell
    }
    
}

extension RemoveSingleExampleTableViewCell: UICollectionViewDelegate {
    
    // MARK: - Collection view delegate

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case self.listCollectionView:
            let listColor = self.list[indexPath.row]
            self.selector.append(listColor)
            self.selectorCollectionView.insertItems(at: [IndexPath(row: self.selector.count-1, section: 0)])
            self.list.remove(listColor)
            collectionView.deleteItems(at: [indexPath])
        case self.selectorCollectionView:
            let listColor = self.selector[indexPath.row]
            self.list.append(listColor)
            self.listCollectionView.insertItems(at: [IndexPath(row: self.list.count-1, section: 0)])
            self.selector.remove(listColor)
            collectionView.deleteItems(at: [indexPath])
        default: ()
        }
    }
    
}
