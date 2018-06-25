//
//  TestViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/19/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()

		setBackgroundImage(sender:self,filename: "background.png")
		
		var debugBtn = UIButton()
		var uploadPageBtn = UIButton()
		var displayPageBtn = UIButton()
		
		// set up debugBtn
		debugBtn =  UIButton(frame: CGRect(
			x: screenWidth/12, 
			y: screenHeight/2, 
			width: screenWidth * 0.8, 
			height: 50))
		debugBtn.layer.borderWidth = 2.0;
		debugBtn.backgroundColor = UIColor.red
		
		if isDebugOn() {
			debugBtn.setTitle("Debug On", for: .normal)
		} else {
			debugBtn.setTitle("Debug Off", for: .normal)
		}
		debugBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		debugBtn.addTarget(
			self,
			action: #selector(debugBtnTapped),
			for: .touchUpInside)
		

		// set up uploadPageBtn
		uploadPageBtn =  UIButton(frame: CGRect(
			x: screenWidth/12, 
			y: screenHeight/4, 
			width: screenWidth * 0.8, 
			height: 50))
		uploadPageBtn.layer.borderWidth = 2.0;
		uploadPageBtn.backgroundColor = UIColor.red

		uploadPageBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		uploadPageBtn.addTarget(
			self,
			action: #selector(uploadPageBtnTapped),
			for: .touchUpInside)

		uploadPageBtn.setTitle("Upload Page", for: .normal)

		// set up displayPageBtn
		displayPageBtn =  UIButton(frame: CGRect(
			x: (screenWidth/12), 
			y: (screenHeight) - (screenHeight/4), 
			width: screenWidth * 0.8, 
			height: 50))
		displayPageBtn.layer.borderWidth = 2.0;
		displayPageBtn.backgroundColor = UIColor.red

		displayPageBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		displayPageBtn.addTarget(
			self,
			action: #selector(cardDisplayPageBtnTapped),
			for: .touchUpInside)

		displayPageBtn.setTitle("Display Page", for: .normal)


		self.view.addSubview(debugBtn)
		self.view.addSubview(uploadPageBtn)
		self.view.addSubview(displayPageBtn)

		
	}// end view did load

	@objc func cardDisplayPageBtnTapped(sender: UIButton) {
		displayCardDisplayPage(Sender: sender)
	}

	@objc func uploadPageBtnTapped(sender: UIButton) {
		displayUploadPage(Sender: sender)
	}
	
	@objc func debugBtnTapped(sender: UIButton){
		if isDebugOn() {
			debug =  false
			sender.setTitle("Debug Off", for: .normal)
		}
		else {
			debug = true
			sender.setTitle("Debug On", for: .normal)
		}
	}

	func displayUploadPage(Sender: UIButton!) {
		let secondViewController:UploadFormViewController 
		= UploadFormViewController()
		self.present(
			secondViewController,
			animated: true,
			completion: nil)
	}

	func displayCardDisplayPage(Sender: UIButton!) {
		let secondViewController:CardDisplayViewController 
		= CardDisplayViewController()
		self.present(
			secondViewController,
			animated: true,
			completion: nil)
	}

}
