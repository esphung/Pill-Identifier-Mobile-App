//
//  MyPillTableView.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 7/8/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit

class MyPillTableView: UITableView, CustomCellUpdater {
	
	func updateTableView() {
		// protocal defined in cell class and instantiated from vc class
		
		print("MyPillTableView invoked..updateTableView()")

		//cellForRow(at: IndexPath.Index)
		
	}// und update table
	
	override init(frame: CGRect, style: UITableView.Style) {
		super.init(frame: frame, style: .plain)
		
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
		
	}
	
}//end class definition
