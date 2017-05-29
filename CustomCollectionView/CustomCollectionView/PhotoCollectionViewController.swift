//
//  ViewController.swift
//  CustomCollectionView
//
//  Created by Andy Wong on 5/18/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class PhotoCollectionViewController: UICollectionViewController {
	
	var photos = Photo.init(caption: "Caption", comment: "Comment", image: UIImage)
	
	override var preferredStatusBarStyle: UIStatusBarStyle{
		return UIStatusBarStyle.lightContent
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
		if let patternImage = UIImage(named: "pattern"){
			view.backgroundColor = UIColor(patternImage: patternImage)
		}
		
		collectionView?.backgroundColor = UIColor.clear
		collectionView?.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
		
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

extension PhotoCollectionViewController {
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 10 //Manual for now this photo.swift is complete
	}
	
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! photoCell
		//cell.photo = photos.image
		return cell
	}
}

