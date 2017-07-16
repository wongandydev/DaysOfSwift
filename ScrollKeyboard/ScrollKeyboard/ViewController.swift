//
//  ViewController.swift
//  ScrollKeyboard
//
//  Created by Andy Wong on 7/10/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var textField: UITextField!
	@IBOutlet weak var textField2: UITextField!
	
	var activeTextField: UITextField?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShown(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
		NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
	}

	func keyboardWillShown(notification: Notification) {
		self.scrollView.isScrollEnabled = true
		
		var userinfo = notification.userInfo!
		let keyboardSize = (userinfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
		let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, (keyboardSize?.height)!, 0.0)
		
		self.scrollView.contentInset = contentInsets
		self.scrollView.scrollIndicatorInsets = contentInsets
		
		var aRect: CGRect = self.view.frame
		aRect.size.height -= (keyboardSize?.height)!
		if let activeField = self.activeTextField {
			if(!aRect.contains(activeField.frame.origin)) {
				self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
			}
		}
	}

	func keyboardWillHide(notification: Notification) {
		
	}
}

