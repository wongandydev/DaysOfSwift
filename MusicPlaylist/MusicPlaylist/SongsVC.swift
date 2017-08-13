//
//  SongsVC.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 6/25/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class SongsVC: UITableViewController{
	
	var playlistTitle: String = ""
	var songs: [Song] = [] {
		didSet{
			tableView.reloadData()
		}
	}
	
	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 0
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
		let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath)
		
		let song = songs[indexPath.row]
		cell.textLabel?.text = song.name
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		print("playlist \(playlistTitle)")
		self.navigationItem.title =  playlistTitle
		
		songs = [Song(name: "Song name", artist: "Me")
		]
	}
	
}
