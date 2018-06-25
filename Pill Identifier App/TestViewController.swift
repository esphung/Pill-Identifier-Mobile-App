//
//  TestViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/19/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit.UIViewController

//let home: TestViewController = storyboard?.instantiateViewController(withIdentifier: "home") as! TestViewController

class TestViewController: NorthSouthViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		var uploadPageBtn = UIButton()
		var debugBtn = UIButton()
		var displayPageBtn = UIButton()
		
		// set up uploadPageBtn
		uploadPageBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.1,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		uploadPageBtn.layer.borderWidth = 2.0;
		uploadPageBtn.backgroundColor = UIColor.red
		uploadPageBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
		uploadPageBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		uploadPageBtn.addTarget(
			self,
			action: #selector(uploadPageBtnTapped),
			for: .touchUpInside)
		
		uploadPageBtn.setTitle("Search Page", for: .normal)

		// set up displayPageBtn
		displayPageBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.2,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		displayPageBtn.layer.borderWidth = 2.0;
		displayPageBtn.backgroundColor = UIColor.red
		displayPageBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)

		displayPageBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		displayPageBtn.addTarget(
			self,
			action: #selector(cardDisplayPageBtnTapped),
			for: .touchUpInside)

		displayPageBtn.setTitle("Display Page", for: .normal)
		
		// set up debugBtn
		debugBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.3,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		debugBtn.layer.borderWidth = 2.0;
		debugBtn.backgroundColor = UIColor.red
		debugBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
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

		north.addSubview(uploadPageBtn)
		north.addSubview(displayPageBtn)
		north.addSubview(debugBtn)
		
	}// end view did load

	@objc func cardDisplayPageBtnTapped(Sender: UIButton) {
		displayCardDisplayPage()
	}

	@objc func uploadPageBtnTapped() {
		displayUploadFormPage()
	}
	
	func toggleDebug(sender: UIButton!) {
		if isDebugOn() {
			debug =  false
			sender.setTitle("Debug Off", for: .normal)
		}
		else {
			debug = true
			sender.setTitle("Debug On", for: .normal)
		}
	}
	
	@objc func debugBtnTapped(sender: UIButton){
		toggleDebug(sender:sender)
	}

	func displayUploadFormPage() {
		let uploadFormViewController: UploadFormViewController = storyboard?.instantiateViewController(withIdentifier: "uploadFormViewController") as! UploadFormViewController
		
		self.present(
			uploadFormViewController,
			animated: true,
			completion: {
		})
	}

	func displayCardDisplayPage() {
		let cardDisplayViewController: CardDisplayViewController = storyboard?.instantiateViewController(withIdentifier: "cardDisplayViewController") as! CardDisplayViewController
		self.present(
			cardDisplayViewController,
			animated: true,
			completion: nil)
	}

}
