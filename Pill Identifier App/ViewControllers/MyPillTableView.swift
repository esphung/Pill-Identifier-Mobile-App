//
//  MyPillTableView.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 7/8/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit

class MyPillTableView: UITableView {
	
	var mainLabel: UILabel!
	var customRowHeight: Double!
	
	override init(frame: CGRect, style: UITableView.Style) {
		
		super.init(frame: frame, style: .plain)

		let customRowHeight = (screenWidth/screenHeight) * self.frame.height
		print("Current Row Height: ", customRowHeight)
		self.rowHeight = customRowHeight
		self.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
		
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
