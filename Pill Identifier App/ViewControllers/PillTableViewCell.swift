//
//  PillDataTableViewCell.swift
//  ActionSheetPicker-3.0
//
//  Created by Eric Phung on 7/9/18.
//

import UIKit

class PillTableViewCell: UITableViewCell {
	
	var mainImageView: UIImageView!
	var mainLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)



        // Configure the view for the selected state
    }

}


class CellOne: PillTableViewCell {
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier) // the common code is executed in this super call
		// code unique to CellOne goes here
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
