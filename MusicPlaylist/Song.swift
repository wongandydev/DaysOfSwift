//
//  Song.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 8/2/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import Foundation
import RealmSwift

class Song: Object{
	dynamic var name: String = ""
	dynamic var artist: String = ""
	
	convenience init(name: String, artist: String) {
		self.init()
		self.name = name
		self.artist = artist
	}

}
