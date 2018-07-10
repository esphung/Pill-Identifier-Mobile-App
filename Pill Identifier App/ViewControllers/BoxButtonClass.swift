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
	var myLabel: UILabel!
	
	override init(frame: CGRect) {
		// set myValue before super.init is called

		let frame = frame
		super.init(frame: frame)
		
		/*
		setBackgroundImage(currentBackgroundImage, for: .normal)
		setBackgroundImage(currentBackgroundImage?.withHorizontallyFlippedOrientation(), for: .highlighted)//  flashes
		
		backgroundColor = UIColor(white: 1, alpha: 0.73)// good contrast to nurse greens
		setBackgroundImage(currentBackgroundImage, for: .highlighted)
		*/
		
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

		let myLabel = UILabel(frame: CGRect(x:0,y: 0,width: self.frame.width * 0.8, height: self.frame.height/4))
		
		myLabel.center = CGPoint(x: self.frame.width/2 ,y: self.frame.height/4)
		myLabel.textAlignment = .center
		myLabel.text = ""
		myLabel.textColor = .gray
		
		
		self.addSubview(myLabel)
		
		//borderWidth = 1.0
		//borderColor = .lightGray
		
		
		
		
		


	}// end override init
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
		
	}
	


}// end BOX BUTTON CLASS DEF

