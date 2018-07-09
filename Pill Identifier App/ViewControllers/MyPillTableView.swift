//
//  MyPillTableView.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 7/8/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit

class MyPillTableView: UITableView {
	
	var mainImageView: UIImageView!
	var mainLabel: UILabel!
	
	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: .plain)
		print("HEY!")
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
