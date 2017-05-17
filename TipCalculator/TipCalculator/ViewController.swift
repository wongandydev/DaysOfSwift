//
//  ViewController.swift
//  TipCalculator
//
//  Created by Andy Wong on 5/15/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

	@IBOutlet weak var balanceTextField: UITextField!
	@IBOutlet weak var tipLabel: UILabel!
	@IBOutlet weak var splitTextField: UITextField!
	@IBOutlet weak var tipSlider: UISlider!
	@IBOutlet weak var totalLabel: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		balanceTextField.delegate = self
		splitTextField.delegate = self
		
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func calculateTip(Sender: AnyObject){
		guard let balance = Double(balanceTextField.text!)
			else{
				balanceTextField.text = "0"
				splitTextField.text = "0"
				totalLabel.text = "0"
				return
		}
		
		let roundedBillAmount = round(100*balance)/100
		let tipAmount = roundedBillAmount * //percentages(grabbed from slider or text field? 
	}
}

