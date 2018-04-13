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


class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

	let locationManager = CLLocationManager()
	
	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var locationButton: UIButton!

	@IBAction func locationButtonTapped(_ sender: Any) {
		centerUserLocation()
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.locationManager.requestAlwaysAuthorization()
		self.locationManager.requestWhenInUseAuthorization()

		if CLLocationManager.locationServicesEnabled() {
			locationManager.delegate = self
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			mapView.showsUserLocation = true
			locationManager.startUpdatingLocation()
			centerUserLocation()
		}
	}

	func centerUserLocation(){
		var region = MKCoordinateRegion()
		region.center = mapView.userLocation.coordinate
		
		var span = MKCoordinateSpan()
		span.latitudeDelta = 0.05
		span.longitudeDelta = 0.05
		region.span = span
		
		mapView.setRegion(region, animated: true)
	}

	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		switch status{
		case .authorizedAlways, .authorizedWhenInUse:
			centerUserLocation()
		
		case .denied, .notDetermined, .restricted:
			let alertVC = UIAlertController.init(title: "Location Authorization", message: "Please allow app to use your location for this app to function properly" , preferredStyle: .alert)
			var settingsAction: UIAlertAction = UIAlertAction(title: "Settings", style: .default, handler: { (_) -> Void in
				if let settingsURL = URL(string: UIApplicationOpenSettingsURLString) {
					UIApplication.shared.open(settingsURL)
				} else{
					print("settingsURL invalid - did not get a URL to settings app")
				}
			})

			var cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
			alertVC.addAction(settingsAction)
			alertVC.addAction(cancelAction)

			present(alertVC, animated: true, completion: nil)
		}
	}
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		locationManager.stopUpdatingLocation()
		if(error != nil){
			print("didFailWithError: \(error)")
		}
		
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		var locationArray = locations as NSArray
		var locationObj = locationArray.lastObject as! CLLocation
		var coord = locationObj.coordinate
		print(coord.latitude)
		print(coord.longitude)
	}
	
	func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
		mapView.showsUserLocation = true
		centerUserLocation()
	}
}

