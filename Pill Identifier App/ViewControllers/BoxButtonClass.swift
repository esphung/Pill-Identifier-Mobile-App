//
//  BoxButton.swift
//  ActionSheetPicker-3.0
//
//  Created by Eric Phung on 7/7/18.
//

import  UIKit.UIViewController

class BoxButton: UIButton {
	
	var myImageView: UIImageView!
	var myImage: UIImage!
	
	override init(frame: CGRect) {
		// set myValue before super.init is called

		let frame = frame
		
		super.init(frame: frame)
		
		
		
	
		setBackgroundImage(currentBackgroundImage, for: .normal)
		
		setBackgroundImage(currentBackgroundImage?.withHorizontallyFlippedOrientation(), for: .highlighted)//  flashes
		
		backgroundColor = UIColor(white: 1, alpha: 0.6)// good contrast to nurse greens
		
		setBackgroundImage(currentBackgroundImage, for: .highlighted)
		
		let myImageView = UIImageView()
		//myImageView.backgroundColor = UIColor.blue
		myImageView.translatesAutoresizingMaskIntoConstraints = false
		
		self.addSubview(myImageView)
		
		myImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		myImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		myImageView.widthAnchor.constraint(equalToConstant: frame.width).isActive = true
		myImageView.heightAnchor.constraint(equalToConstant: frame.height).isActive = true
		//myImageView.layer.borderColor = UIColor.black.cgColor
		//myImageView.layer.borderWidth = 2.0
		

		
		// set other operations after super.init, if required
		setTitleColor(UIColor.black, for: .normal)
		setTitleColor(UIColor.lightGray, for: .disabled)
		setTitleColor(UIColor.white, for: .highlighted)
		self.titleLabel?.font =  UIFont.systemFont(
			ofSize: 24, weight: .light)
		
		titleLabel?.textColor = .lightGray
		//titleLabel?.adjustsFontSizeToFitWidth = true
		titleLabel?.textAlignment = .center
		
		borderWidth = 0.0
		borderColor = .lightGray
		
		
		
		
		


	}// end override init
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
		
	}
	


}// end BOX BUTTON CLASS DEF

