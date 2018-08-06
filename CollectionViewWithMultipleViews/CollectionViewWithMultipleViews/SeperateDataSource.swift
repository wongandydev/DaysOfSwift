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
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if isFiltering {
            return filteredArr.count
        } else {
            return array.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! mainCollectionViewCell
        var array_title: String
        
        if isFiltering {
            array_title = filteredArr[indexPath.row]
        } else {
            array_title = array[indexPath.row]
        }
        
        cell.kTitle.text = array_title
        
        return cell
    }
}
