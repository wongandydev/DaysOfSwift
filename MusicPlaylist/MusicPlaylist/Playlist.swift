//
//  Playlist.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 8/2/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import Foundation

struct Playlist{
	var name: String
	var date: String
	
	init(name: String, timestamp: String){
		self.name = name
		self.date = timestamp
	}
}
