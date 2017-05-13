//
//  ViewController.swift
//  TapCounter
//
//  Created by Andy Wong on 5/13/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	var number:Int = 0

	@IBOutlet weak var counterLabel: UILabel!
	
	@IBAction func tapButtonPressed(_ sender: Any) {
		number += 1
		counterLabel.text = String(number)
	}
	
	@IBAction func resetButtonPressed(_ sender: Any) {
		number=0
		counterLabel.text = String(number)
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		counterLabel.text = String(number)
	}

	override func viewDidAppear(_ animated: Bool) {
		//self.navigationController?.navigationBar.barTintColor = UIColor.white
		let img = UIImage()
		navigationController?.navigationBar.setBackgroundImage(img, for: UIBarMetrics.default)
		navigationController?.navigationBar.shadowImage = img
	}
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

