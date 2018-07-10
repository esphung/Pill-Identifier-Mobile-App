//
//  BoxButton.swift
//  ActionSheetPicker-3.0
//
//  Created by Eric Phung on 7/7/18.
//

import  UIKit

class BoxButton: UIButton {

	override init(frame: CGRect) {
		// set myValue before super.init is called
		let frame = frame
		super.init(frame: frame)
		
		self.setBackgroundImage(UIImage(named: placeholder), for: .normal)
		
		// set other operations after super.init, if required
		self.setTitleColor(UIColor.black, for: .normal)
		self.setTitleColor(UIColor.lightGray, for: .disabled)
		self.setTitleColor(UIColor.white, for: .highlighted)
		//self.titleLabel?.font =  UIFont.systemFont(ofSize: 16, weight: .light)
		self.titleLabel?.textColor = .lightGray
		
		self.titleLabel?.adjustsFontSizeToFitWidth = true
		self.titleLabel?.textAlignment = .center
		
		self.borderWidth = 0.0
		self.borderColor = .lightGray
		
	}// end override init
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
		
	}


}// end BOX BUTTON CLASS DEF
