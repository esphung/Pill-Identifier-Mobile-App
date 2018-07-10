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
	let mainImage: UIImage! = nil
	@IBOutlet weak var mainLabel: UILabel!
	
	var delegate: CustomCellUpdater?
	
	func yourFunctionWhichDoesNotHaveASender () {
		print("Hello TableViewCell2! Delegate Update..")
		delegate?.updateTableView()

	}//  end example updater delegate function
	
}// end tableviewcell

protocol CustomCellUpdater: class {
	// the name of the protocol you can put any
	func updateTableView()
	
}

