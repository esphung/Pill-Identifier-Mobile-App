//
//  TestViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/19/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit.UIViewController

class TestViewController: NorthSouthViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		//setBackgroundImage(sender: self, filename: "background.png")
		

		var firstBtn = UIButton()
		var debugBtn: 		UIButton!
		var resultsBtn = 	UIButton()
		var displayBtn = UIButton()

		// set up firstBtn
		firstBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.025,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		firstBtn.layer.borderWidth = 2.0;
		firstBtn.backgroundColor = UIColor.red
		firstBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
		firstBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		firstBtn.addTarget(
			self,
			action: #selector(firstBtnTapped),
			for: .touchUpInside)
		
		firstBtn.setTitle("Upload Page", for: .normal)

		// set up displayBtn
		displayBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.125,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		displayBtn.layer.borderWidth = 2.0;
		displayBtn.backgroundColor = UIColor.red
		displayBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)

		displayBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		displayBtn.addTarget(
			self,
			action: #selector(cardDisplayPageBtnTapped),
			for: .touchUpInside)

		displayBtn.setTitle("Display Page", for: .normal)
		
		// set up resultsBtn
		resultsBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.225,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		resultsBtn.layer.borderWidth = 2.0;
		resultsBtn.backgroundColor = UIColor.red
		resultsBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		resultsBtn.setTitle("Results Page", for: .normal)
		
		resultsBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		resultsBtn.addTarget(
			self,
			action: #selector(resultsBtnTapped),
			for: .touchUpInside)
		
		// set up debugBtn
		debugBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		debugBtn.layer.borderWidth = 2.0;
		//debugBtn.backgroundColor = UIColor.red
		//debugBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
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
		

		north.addSubview(firstBtn)
		north.addSubview(displayBtn)
		north.addSubview(resultsBtn)
		north.addSubview(debugBtn)
		
		//south.removeFromSuperview(
		
		
	}// end view did load
	
	@objc func buttonDidPress(){}

	@objc func resultsBtnTapped(Sender: UIButton) {
		displayResultsPage()
	}
	
	@objc func cardDisplayPageBtnTapped(Sender: UIButton) {
		displayCardDisplayPage()
	}

	@objc func firstBtnTapped() {
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
	
	func displayResultsPage() {
		let resultsTableViewController: ResultsTableViewController = storyboard?.instantiateViewController(withIdentifier: "resultsTableViewController") as! ResultsTableViewController
		self.present(
			resultsTableViewController,
			animated: true,
			completion: nil)
	}
	
	

}
