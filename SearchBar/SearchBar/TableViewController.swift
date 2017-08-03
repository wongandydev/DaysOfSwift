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
	
	var users: [User] = [] {
		didSet{
			tableView.reloadData()
		}
	}
	
	var filiteredUsers = [User]()
	
	//MARK: Override
	override func viewDidLoad() {
		super.viewDidLoad()
		
		users = [
				User(displayName: "TEZLA", username: "unique"),
		        User(displayName: "Mercedeiez", username: "niqw"),
		        User(displayName: "Hyunda", username: "andy"),
				User(displayName: "Toyote", username: "h@ck_er"),
				User(displayName: "Audi", username: "huh?-_-"),
				User(displayName: "ASHTON", username: "--___--"),
				User(displayName: "SPAG BUGATTI", username: "#@(*$)@#*$")
				]
	
		searchController.searchResultsUpdater = self
		searchController.dimsBackgroundDuringPresentation = false
		definesPresentationContext = true
		tableView.tableHeaderView = searchController.searchBar
		
	}
	
	//MARK: TableView Delegate 
	override func numberOfSections(in tableView: UITableView) -> Int {
		if searchController.isActive && searchController.searchBar.text != "" { //This is run so the app actively searches to see if the user is search to see if we should show message.
			if filiteredUsers.count > 0{
				self.tableView.backgroundView = nil
				return 1
			}
			else{
				TableViewHelper.EmptyMessage(message: "Friend not found!", viewController: self)
				return 0
			}
		}
		else{ //This runs when the app starts since the search bar isn't active.
			if filiteredUsers.count > 0{
				return 1
			}
			else{
				TableViewHelper.EmptyMessage(message: "Tap Search Bar \n to search for your friends!", viewController: self)
				return 0
			}
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		if searchController.isActive && searchController.searchBar.text != "" {
			return filiteredUsers.count
		}
		else{
			return 0
		}
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
		let user: User
		
		if searchController.isActive && searchController.searchBar.text != "" {
			user = filiteredUsers[indexPath.row]
			
			cell.textLabel?.text = user.displayName
			cell.detailTextLabel?.text = user.username
		}
		return cell
	}
}


extension UITableViewController
{
	class TableViewHelper {
		
		class func EmptyMessage(message:String, viewController:UITableViewController) {
			let messageLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: viewController.view.bounds.size.width, height: viewController.view.bounds.size.height))
			messageLabel.text = message
			messageLabel.textColor = UIColor.black
			messageLabel.numberOfLines = 0;
			messageLabel.textAlignment = .center;
			messageLabel.font = UIFont(name: "Helvetica", size: 17)
			messageLabel.sizeToFit()
			
			viewController.tableView.backgroundView = messageLabel;
			viewController.tableView.separatorStyle = .none;
		}
	}
}

extension TableViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		filterContentForSearchText(searchText: searchController.searchBar.text!)
	}
	
	func filterContentForSearchText(searchText: String, scope: String = "All") {
		filiteredUsers = users.filter { user in
			return user.displayName.lowercased().contains(searchText.lowercased());
		}
		tableView.reloadData()
	}
}


