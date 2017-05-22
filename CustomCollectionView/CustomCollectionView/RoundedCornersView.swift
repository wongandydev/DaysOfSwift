//
//  RoundedCornersView.swift
//  CustomCollectionView
//
//  Created by Andy Wong on 5/21/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedCornersView: UIView{
	@IBInspectable var cornerRadius: CGFloat = 0{
		didSet{
			layer.cornerRadius = cornerRadius
			layer.masksToBounds = cornerRadius > 0 //Only applies if there is a corner radius greater than 0
		}
	}
}
