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
		
		return cell
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		RealmHelpers.addSong(song: Song(name: "Title", artist: "Hello"))
		
		print("playlist \(playlistTitle)")
		self.navigationItem.title =  playlistTitle
		
		songs = RealmHelpers.retrieveSong()
	}
	
}
