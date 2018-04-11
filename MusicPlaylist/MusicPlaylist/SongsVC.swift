//
//  SongsVC.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 6/25/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit
import RealmSwift

class SongsVC: UITableViewController{
	
	var playlistTitle: String = ""
	var songs: Results<Song>! {
		didSet{
			tableView.reloadData()
		}
	}
	
	@IBAction func addSongButtonTapped(_ sender: Any) {
		let alertController = UIAlertController(title: "Add Song", message: "Enter Song name, and artist", preferredStyle: .alert)
		
		alertController.addTextField(configurationHandler: {(textField) -> Void in
			textField.placeholder = "Song Name";
			textField.textAlignment = .left
		})
		
		alertController.addTextField(configurationHandler: {(textField) -> Void in
			textField.placeholder = "Artist";
			textField.textAlignment = .left
		})
		
		alertController.addAction(UIAlertAction(title: "Add Song", style: .default , handler: { alert -> Void in
			let songName = alertController.textFields?[0] as! UITextField
			let artist = alertController.textFields?[1] as! UITextField
			
			RealmHelpers.addSong(song: Song(name: songName.text!, artist: artist.text!))
			
		}))
		
		alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler: nil))
		
		self.present(alertController, animated: true, completion: nil)
	}

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return songs.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
		
		let song = songs[indexPath.row]
		
		cell.textLabel?.text = song.name
		cell.detailTextLabel?.text = song.artist
		
		return cell
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//RealmHelpers.addSong(song: Song(name: "Title", artist: "Hello"))
		
		print("playlist \(playlistTitle)")
		self.navigationItem.title =  playlistTitle
		
		songs = RealmHelpers.retrieveSong()
	}
	
}
