//
//  BoxButton.swift
//  ActionSheetPicker-3.0
//
//  Created by Eric Phung on 7/7/18.
//

import  UIKit

class BoxButton: UIButton {
	
	func someFunc() {
		//fatalError("Must Override")
		self.setBackgroundImage(UIImage(named: placeholder), for: .normal)
	}
	
	override init(frame: CGRect) {
		// set myValue before super.init is called
		let frame = frame
		super.init(frame: frame)
		
		someFunc()
		
		// set other operations after super.init, if required
		self.setTitleColor(UIColor.black, for: .normal)
		self.setTitleColor(UIColor.lightGray, for: .disabled)
		self.setTitleColor(UIColor.white, for: .highlighted)
		self.titleLabel?.font =  UIFont.systemFont(ofSize: 24, weight: .light)
		self.titleLabel?.textColor = .lightGray
		
		self.borderWidth = 1.0
		self.borderColor = .lightGray
		
		self.addTarget(
			self,
			action: #selector(boxBtnTapped),
			for: .touchUpInside)
		
		self.borderWidth = 1.0
		self.borderColor = .lightGray
		
		self.sizeThatFits(CGSize(width: 300, height: 300))
		self.titleLabel?.adjustsFontSizeToFitWidth = true
		self.titleLabel?.textAlignment = .center
		
		
	}// end override init
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// BUTTON HANDLER
	@objc func boxBtnTapped(sender: BoxButton){
	}

}// end BOX BUTTON CLASS DEF

// class for pill images as tiles  (7-15)
class TileButton: BoxButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.setImage(UIImage(named: placeholder), for: .normal)
		
		self.setTitleColor(UIColor.black, for: .normal)
		self.setTitleColor(UIColor.lightGray, for: .disabled)
		self.setTitleColor(UIColor.white, for: .highlighted)
		
		self.backgroundColor = UIColor(white: 0.5, alpha: 0.2)// kinda greyish color

		
		self.addTarget(
			self,
			action: #selector(tileBtnTapped),
			for: .touchUpInside)
		
	}// end frame super init
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	@objc func tileBtnTapped(sender: TileButton){
		if self.currentBackgroundImage == nil {
			self.setBackgroundImage(UIImage(named: placeholder), for: .normal)
		} else {
			self.setBackgroundImage(nil, for: .normal)
		}
	}
	
	override func someFunc() {
		
	}
	
}// end Tile Button class def
