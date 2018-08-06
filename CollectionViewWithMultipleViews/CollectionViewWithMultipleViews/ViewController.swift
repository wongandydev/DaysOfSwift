//
//  ViewController.swift
//  CollectionViewWithMultipleViews
//
//  Created by Andy Wong on 8/5/18.
//  Copyright © 2018 Andy Wong. All rights reserved.
//

import UIKit

class mainCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var kTitle: UILabel!
}

class ViewController: UIViewController {

    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    var randomStuff:[String] = ["Something", "asda", "dasd", "asda", "asdasd", "asDASd", "asdasd", "asDASd", "asdasd", "asDASd"]
    let searchController: UISearchController = UISearchController(searchResultsController: nil)
    let seperateDataSource: SeperateDataSource = SeperateDataSource()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        mainCollectionView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
        mainCollectionView.backgroundColor = .blue
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupSearchBar()
        
        self.navigationItem.searchController = searchController

        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
    }
    
    func setupSearchBar(){
        //MARK: Search Bar Stuff
        searchController.searchBar.placeholder = "Search..."
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.delegate = self
        definesPresentationContext = true
        
        if #available(iOS 11.0, *) {
            self.navigationItem.searchController = searchController
        } else {
            // Fallback on earlier versions
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomStuff.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! mainCollectionViewCell
        cell.backgroundColor = .red
        cell.kTitle.frame = cell.frame
        
        cell.kTitle.text = randomStuff[indexPath.row]
        
        return cell
    }
}

extension ViewController: UISearchControllerDelegate {
    
}

extension ViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        mainCollectionView.dataSource = self
    }
}

extension ViewController: UISearchResultsUpdating {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        mainCollectionView.dataSource = seperateDataSource
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            seperateDataSource.isFiltering = false
            mainCollectionView.reloadData()
        } else {
            seperateDataSource.isFiltering = true
            mainCollectionView.reloadData()
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        seperateDataSource.filter(searchTerm: searchController.searchBar.text!, collectionView: mainCollectionView)
        return
    }
}

