//
//  ViewController.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 6/25/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

	var playlists: [playlist] = []{
		didSet{
			tableView.reloadData()
		}
	}
	
	
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return playlists.count
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

