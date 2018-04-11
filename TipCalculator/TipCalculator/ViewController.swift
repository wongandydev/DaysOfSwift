//
//  ViewController.swift
//  TipCalculator
//
//  Created by Andy Wong on 5/15/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

	var tipAmount: Float = 0
	
	@IBOutlet weak var balanceTextField: UITextField!
	@IBOutlet weak var tipLabel: UILabel!
	@IBOutlet weak var splitTextField: UITextField!
	@IBOutlet weak var tipSlider: UISlider!
	@IBOutlet weak var totalLabel: UILabel!
	@IBOutlet weak var tipSliderResultLabel: UILabel!
	@IBOutlet weak var splitTotalBill: UILabel!
	
	@IBOutlet weak var tipPercentSegmentControl: UISegmentedControl!
	@IBAction func tipSliderMoved(_ sender: Any) {
		tipAmount = round(tipSlider.value)
		
		tipSliderResultLabel.text = String(format: "%.2f", tipAmount) + "%"
		calculateTip()
	}

	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		balanceTextField.delegate = self
		splitTextField.delegate = self
		balanceTextField.text = ""
		splitTextField.text = ""
		totalLabel.text = "$0.00"
		
		self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for:UIBarMetrics.default)
		self.navigationController?.navigationBar.shadowImage = UIImage()
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		view.endEditing(true)
		//TODO: I can either have a five segment control to depict each service so good is like 17% and do that or custom with slider. But I find slinder to be annoying
		calculateTip()
	}
	
	func calculateTip(){
		guard let balance = Double(balanceTextField.text!)
			else{
				balanceTextField.text = ""
				splitTextField.text = ""
				totalLabel.text = "$0.00"
				return
		}
	
		let roundedBillAmount = round(100*balance)/100
		let tipAmount = roundedBillAmount * Double(self.tipAmount)/100//percentages(grabbed from slider or text field?
		let roundedTipAmount = round(100*tipAmount)/100
		let total = roundedBillAmount + tipAmount
		tipLabel.text = "$" + String(format: "%.2f", roundedTipAmount)
		totalLabel.text = "$" + String(format: "%.2f", total)
		
		guard let splitNumber = Double(splitTextField.text!)
			else{
				splitTextField.text = ""
				splitTotalBill.text = "$" + String(format: "%.2f", total) + "/me"
				return
		}
		
		let splitTotal = total/splitNumber
		if(splitNumber == 1){
			splitTotalBill.text = "$" + String(format: "%.2f", total) + " for me, myself and I!"
		}
		else{
			splitTotalBill.text = String(format:"%.2f", splitTotal) + "/per person"
		}
		
		print(splitTotal)
		print(roundedBillAmount)
		print(tipAmount)
	}
	
}

