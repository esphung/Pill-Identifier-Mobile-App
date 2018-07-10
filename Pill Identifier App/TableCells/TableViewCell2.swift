//
//  TableViewCell2.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/25/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit


class TableViewCell2: UITableViewCell {
	
	@IBOutlet weak var mainImageView: UIImageView!
	@IBOutlet weak var mainLabel: UILabel!
	var mainImage: UIImage!
	
	weak var mainButton: BoxButton!
	
	var delegate: CustomCellUpdater?
	
	func setMyButton(button: BoxButton) {
		self.mainButton = button
		
		print("Hello TableViewCell2Button")
		print(self.mainButton.myLabel!)
		delegate?.updateTableView()

	}//  end example updater delegate function
	
}// end tableviewcell

protocol CustomCellUpdater: class {
	// the name of the protocol you can put any
	func updateTableView()
	
}

