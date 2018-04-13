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
		showAddressOnLabel(label: locationLabel)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.locationManager.requestWhenInUseAuthorization()
		
		if CLLocationManager.locationServicesEnabled() {
			locationManager.delegate = self
			locationManager.desiredAccuracy = kCLLocationAccuracyBest
			mapView.showsUserLocation = true
			locationManager.startUpdatingLocation()
		}
		
		centerUserLocation()
		showAddressOnLabel(label: locationLabel)
	}
	
	func showAddressOnLabel(label: UILabel){
		coordinatesToAddress() { (location) in
			if let address = location?.thoroughfare,
				let streetNumber = location?.subThoroughfare,
				let city = location?.locality,
				let state = location?.administrativeArea,
				let zipCode = location?.postalCode,
				let country = location?.country{
				label.text = "\(streetNumber) \(address), \(city), \(state) \(zipCode), \(country)"
			} else {
				print("no address")
				label.text = "Address not available"
			}
		}
	}
	
	func coordinatesToAddress(completionHandler: @escaping (CLPlacemark?) -> Void) {
		if let lastLocation = locationManager.location{
			let geocoder = CLGeocoder()
			
			geocoder.reverseGeocodeLocation(lastLocation, completionHandler: {(address, error) in
				if error != nil {
					print("error gettings address")
					completionHandler(nil)
				} else {
					let firstAddress = address?[0]
					completionHandler(firstAddress)
				}
			})
		} else{
			print("no location")
			completionHandler(nil)
		}
	}

	func centerUserLocation(){
		var region = MKCoordinateRegion()

		if locationManager.location?.coordinate != nil{ //Too allow the app to function coorectly when using simulator since it doesn't get a locaiton.
			region.center = (locationManager.location?.coordinate)!
		} else {
			region.center = mapView.userLocation.coordinate
		}

		var span = MKCoordinateSpan()
		span.latitudeDelta = 0.01
		span.longitudeDelta = 0.01
		region.span = span
		
		mapView.setRegion(region, animated: true)
	}

	func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
		switch status {
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

