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
	@IBOutlet weak var tipSliderResultLabel: UILabel!
	
	@IBAction func tipSliderMoved(_ sender: Any) {
		let value = tipSlider.value
		
		tipSliderResultLabel.text = String(format: "%.2f", value) + "%"
		calculateTip()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		balanceTextField.delegate = self
		splitTextField.delegate = self
		//tapGestureRecognizer
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true) 
	}
	func calculateTip(){
		guard let balance = Double(balanceTextField.text!)
			else{
				balanceTextField.text = "$0.00"
				splitTextField.text = "0"
				totalLabel.text = "$0.00"
				return
		}
		
		let roundedBillAmount = round(100*balance)/100
		let tipAmount = roundedBillAmount * Double(tipSlider.value)/100//percentages(grabbed from slider or text field?
		let roundedTipAmount = round(100*tipAmount)/100
		let total = roundedBillAmount + tipAmount
		tipLabel.text = "$" + String(format: "%.2f", roundedTipAmount)
		totalLabel.text = "$" + String(format: "%.2f", total)
		
		print(roundedBillAmount)
		print(tipAmount)
	}
}

