//
//  Helpers.swift
//  MusicPlaylist
//
//  Created by Andy Wong on 8/2/17.
//  Copyright © 2017 Andy Wong. All rights reserved.
//

import UIKit


extension UITableViewController{
	class TableViewHelper {
		class func EmptyMessage(message: String, viewController: UITableViewController) {
			let messageLabel = UILabel(frame: CGRect.init(x: 0, y: 0, width: viewController.view.bounds.size.width, height: viewController.view.bounds.size.height))
			
			messageLabel.text = message
			messageLabel.textColor = UIColor.black
			messageLabel.numberOfLines = 0;
			messageLabel.textAlignment = .center;
			messageLabel.font = UIFont(name: "Helvetica Neue", size: 17)
			messageLabel.sizeToFit()
				
			viewController.tableView.backgroundView = messageLabel;
			viewController.tableView.separatorStyle = .none;
		}
	}
}
