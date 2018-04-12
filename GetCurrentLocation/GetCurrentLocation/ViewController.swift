//
//  ViewController.swift
//  GetCurrentLocation
//
//  Created by Andy Wong on 4/10/18.
//  Copyright © 2018 Andy Wong. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {

	let locationManager = CLLocationManager()
	
	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var locationButton: UIButton!

	@IBAction func locationButtonTapped(_ sender: Any) {
		locationManager.requestLocation()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.locationManager.requestAlwaysAuthorization()
		self.locationManager.requestWhenInUseAuthorization()
		
		if CLLocationManager.locationServicesEnabled() {
			locationManager.delegate = self
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			locationManager.startUpdatingLocation()
		}
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		locationManager.stopUpdatingLocation()
		if(error != nil){
			print(error)
		}
		
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		var locationArray = locations as NSArray
		var locationObj = locationArray.lastObject as! CLLocation
		var coord = locationObj.coordinate
		print(coord.latitude)
		print(coord.longitude)
	}
}

