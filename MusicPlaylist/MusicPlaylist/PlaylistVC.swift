//
//  ViewController.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 6/25/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class PlaylistVC: UITableViewController {
	//MARK: -Properties
	var playlists: [Playlist] = []{
		didSet{
			tableView.reloadData()
		}
	}
	
	//MARK: -IBOutlets
	@IBOutlet var playlistTableView: UITableView! {
		didSet{
			playlistTableView.delegate = self
			playlistTableView.dataSource = self
		}
	}
	//MARK: -Views
	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.separatorStyle = .singleLine
		tableView.separatorColor = UIColor.black
	}
	
	@IBAction func addPlaylistButtonTapped(_ sender: Any) {
		let alertController = UIAlertController(title: "Create Playlist", message: "Enter Playlist Title", preferredStyle: .alert)
		
		alertController.addTextField(configurationHandler: {(textField) -> Void in
			textField.placeholder = "Title";
			textField.textAlignment = .left
		})
		
		alertController.addAction(UIAlertAction(title: "Add", style: .default , handler: {
			alert -> Void in
			
			let title = alertController.textFields?[0] as! UITextField
			
			if title.text != ""{
				self.playlists.append(Playlist(name: title.text!, timestamp: "No Time"))
				self.tableView.reloadData()
			}
			else{
				showErrorAlert(viewController: self, title: "Add Error", message: "No title entered. \n Please Try Again.")
			}
			
		}))
		alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		
		present(alertController, animated: true, completion: nil)
	}
	
	//MARK: -TableViewDelegates
	override func numberOfSections(in tableView: UITableView) -> Int {
		if playlists.count > 0 {
			print("came here")
			self.tableView.backgroundView = nil
			return 1
		}
		else{
			TableViewHelper.EmptyMessage(message: "No Playlists", viewController: self)
			return 0
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return playlists.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
		let playlist: Playlist
		
		playlist = playlists[indexPath.row]
		
		cell.textLabel?.text = playlist.name
		cell.detailTextLabel?.text = playlist.date
		
		return cell
	}

}

