//
//  ViewController.swift
//  TapCounterProject
//
//  Created by Andy Wong on 5/27/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	var counter = 0
	var timer: Timer?
	
	@IBOutlet weak var counterLabel: UILabel!
	
	@IBAction func tapButtonPressed(_ sender: Any) {
		counter += 1
		counterLabel.text = String(counter)
	}
	
	@IBAction func resetButtonPressed(_ sender: Any) {
		counter = 0
		counterLabel.text = String(counter)
	}
	
	@IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
		if sender.state == .began{
			 timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(ViewController.addCounter), userInfo: nil, repeats: true)
		}
		else if sender.state == .ended {
			timer?.invalidate()
			timer = nil
		}
	}
	
	func addCounter(){
		counter+=1
		counterLabel.text = String(counter)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		counterLabel.text = "0"
		
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

}

