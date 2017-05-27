//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Andy Wong on 5/18/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
	
	var Photos = Photo.init(caption: "Caption", comment: "Comment", image: <#T##UIImage#>)
	
	override var preferredStatusBarStyle: UIStatusBarStyle{
		return UIStatusBarStyle.lightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

