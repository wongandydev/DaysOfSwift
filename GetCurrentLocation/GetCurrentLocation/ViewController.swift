//
//  ViewController.swift
//  GetCurrentLocation
//
//  Created by Andy Wong on 4/10/18.
//  Copyright © 2018 Andy Wong. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

	@IBOutlet weak var mapView: MKMapView!
	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var locationButton: UIButton!

	@IBAction func locationButtonTapped(_ sender: Any) {
		
	}
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}


}

