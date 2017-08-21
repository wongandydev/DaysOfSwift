//
//  RealmHelpers.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 8/6/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import RealmSwift

class RealmHelpers{
	static func addPlaylist(playlist: Playlist) {
		let realm = try! Realm()
		try! realm.write() {
			print("Add playlist")
			realm.add(playlist)
		}
	}
	
	static func deletePlaylist(playlist: Playlist) {
		let realm = try! Realm()
		try! realm.write() {
			realm.delete(playlist)
		}
	}
	
	static func retrievePlaylist() -> Results<Playlist> {
		let realm = try! Realm()
		return realm.objects(Playlist.self)
	}
	
	static func addSong(song: Song) {
		let realm = try! Realm()
		try! realm.write() {
			print("Add Song")
			realm.add(song)
		}
	}
	
	static func deleteSong(song: Song) {
		let realm = try! Realm()
		try! realm.write() {
			realm.delete(song)
		}
	}
	
	static func retrieveSong() -> Results<Song> {
		let realm = try! Realm()
		return realm.objects(Song.self)
	}
}
