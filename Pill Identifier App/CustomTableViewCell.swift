//
//  CustomTableViewCell.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/17/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//



import UIKit

class CustomTableViewCell: UITableViewCell {


	@IBOutlet weak var pillLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
	@IBOutlet weak var pillImage: UIImageView!
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
