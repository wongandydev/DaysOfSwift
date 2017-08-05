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
	var playlists: [Playlist] = []{ //what does this do somepletly?
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
		// Do any additional setup after loading the view, typically from a nib.
	}
	@IBAction func addPlaylistButtonTapped(_ sender: Any) {
		let alertController = UIAlertController(title: "Create Playlist", message: "Enter Playlist Title", preferredStyle: .alert)
		
		alertController.addTextField(configurationHandler: nil)
		
		alertController.addAction(UIAlertAction(title: "Add", style: .default , handler: {
			alert -> Void in
		}))
		alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		
		present(alertController, animated: true, completion: nil)
	}
	
	//MARK: -TableViewDelegates
	override func numberOfSections(in tableView: UITableView) -> Int {
		if playlists.count > 0 {
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
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath)
		let playlist: Playlist
		
		playlist = playlists[indexPath.row]
		
		cell.textLabel?.text = playlist.name
		cell.detailTextLabel?.text = playlist.date
	}

}

