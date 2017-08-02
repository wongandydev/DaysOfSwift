//
//  AppDelegate.swift
//  SearchBar
//
//  Created by Andy Wong on 7/26/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	var window: UIWindow?


	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
		
		UISearchBar.appearance().barTintColor = UIColor.lightblue()
		UISearchBar.appearance().tintColor = UIColor.white
		UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).tintColor = UIColor.lightblue()

		return true
	}
}

extension UIColor{
	static func lightblue() -> UIColor{
		return UIColor(red: 30.0/255.0, green: 165.0/255.0, blue: 255.0/255.0, alpha: 1.0)
	}
}

