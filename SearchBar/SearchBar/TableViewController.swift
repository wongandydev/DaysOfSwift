//
//  ViewController.swift
//  SearchBar
//
//  Created by Andy Wong on 7/26/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
	
	//MARK: Struct
	struct User{
		var displayName: String
		var username: String
		
		init(displayName: String, username: String){
			self.displayName = displayName
			self.username = username
		}
	}
	//MARK: Properties
	let searchController = UISearchController(searchResultsController: nil)
	
	var user: [User] = [User] {
		didSet{
			tableView.reloadData()
		}
	}
	
	var filiteredUsers = [User]()
	
	//MARK: Override
	override func viewDidLoad() {
		super.viewDidLoad()
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	//MARK: TableView Delegate 
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if searchController.isActive && searchController.searchBar.text != "" {
			return filiteredUsers.count
		}
		return 0
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let user: Users
		if searchController.isActive && searchController.searchBar.text != "" {
			user = filteredUser[indexPath.row]
			
			cell.textLabel?.text = candy.name
			cell.detailTextLabel?.text = candy.username
		}
		
		return cell
	}



}

