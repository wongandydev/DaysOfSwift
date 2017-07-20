//
//  ViewController.swift
//  ScrollableTextfield
//
//  Created by Andy Wong on 7/19/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var confirmPasswordTextField: UITextField!
	@IBOutlet weak var phoneNumberTextField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		handleDelegates()
		
		registerForKeyboardNotifications()
		
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
		deregisterForKeyboardNotifications()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func handleDelegates(){
		self.nameTextField.delegate = self
		self.emailTextField.delegate = self
		self.passwordTextField.delegate = self
		self.confirmPasswordTextField.delegate = self
		self.phoneNumberTextField.delegate = self
	}
	
	func registerForKeyboardNotifications(){
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
		
		print("notification set")
	}
	
	func deregisterForKeyboardNotifications(){
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
		
		print("remove notification")
	}
	
	func keyboardWillShown(notification: Notification) {
		print("show keyboard called")
		self.scrollView.isScrollEnabled = true
		
		var userinfo = notification.userInfo!
		let keyboardSize = (userinfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
		let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, (keyboardSize?.height)!, 0.0)
		
		self.scrollView.contentInset = contentInsets
		self.scrollView.scrollIndicatorInsets = contentInsets
		
		var aRect: CGRect = self.view.frame
		aRect.size.height -= keyboardSize!.height
		if let activeField = self.activeField {
			if (!aRect.contains(activeField.frame.origin)) {
				print("PASSED BY HERE")
				self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
			}
		}
	}
	
	func keyboardWillHide(notification: NSNotification) {
		print("hide keybaord called")
		let contentInset:UIEdgeInsets = UIEdgeInsets.zero
		self.scrollView.contentInset = contentInset
		self.scrollView.scrollIndicatorInsets = contentInset
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		print("text field start editing")
		print(textField)
		print("before: \(activeField)")
		self.activeField = textField
		print("after: \(activeField)")
	}
	
	func textFieldDidEndEditing(_ textField: UITextField) {
		self.activeField = nil
	}
}

