//
//  Playlist.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 8/2/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import Foundation
import RealmSwift

class Playlist: Object{
	dynamic var name: String = ""
	dynamic var date: String = ""

	convenience init(name: String, timestamp: String){
		self.init()
		self.name = name
		self.date = timestamp
	}
}
