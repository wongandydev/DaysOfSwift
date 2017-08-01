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
		
		users = [User(displayName: "Andy", username: "thisusername"),
		        User(displayName: "Andy", username: "thisusername"),
		        User(displayName: "Andy", username: "thisusername"),
				User(displayName: "Andy", username: "thisusername"),
				User(displayName: "Andy", username: "thisusername"),
				User(displayName: "Andy", username: "thisusername"),
				User(displayName: "Andy", username: "thisusername")
				]
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		
	}
	
	//MARK: TableView Delegate 
	override func numberOfSections(in tableView: UITableView) -> Int {
		if filiteredUsers.count > 0{
			return 1
		}
		else{
			TableViewHelper.EmptyMessage(message: "Tap Search Bar to search for friends!", viewController: self)
			return 0
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//		if searchController.isActive && searchController.searchBar.text != "" {
//			return filiteredUsers.count
//		}
//		return 0
		return users.count
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

