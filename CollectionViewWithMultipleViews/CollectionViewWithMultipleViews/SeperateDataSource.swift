//
//  SeperateDataSource.swift
//  CollectionViewWithMultipleViews
//
//  Created by Andy Wong on 8/5/18.
//  Copyright © 2018 Andy Wong. All rights reserved.
//

import UIKit

class SeperateDataSource: NSObject{
    var array: [String] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "o"]

    var filteredArr: [String] = []

    var selectedArray: [String] = []
    
    var isFiltering: Bool = false
    
    func filter(searchTerm: String, collectionView: UICollectionView) {
        filteredArr = array.filter( { (array_elements: String) -> Bool in
            return array_elements.lowercased().contains(searchTerm.lowercased())
        })
    
        collectionView.reloadData()
    }

}

extension SeperateDataSource: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            if isFiltering {
                return filteredArr.count
            } else {
                return array.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedCell", for: indexPath) as! mainCollectionViewCell
        
            let cvc = UICollectionView(frame: CGRect(origin: cell.bounds.origin, size: cell.bounds.size), collectionViewLayout: UICollectionViewLayout())
            cvc.backgroundColor = .orange
            cell.addSubview(cvc)
        
            return cell

        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! mainCollectionViewCell
            var array_title: String

            if isFiltering {
                array_title = filteredArr[indexPath.row]
            } else {
                array_title = array[indexPath.row]
            }

            cell.kTitle.text = array_title
            cell.backgroundColor = .red

            return cell
        }
    }
}
