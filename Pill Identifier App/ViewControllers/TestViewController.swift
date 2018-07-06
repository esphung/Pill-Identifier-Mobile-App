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
		
		let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
		backgroundImage.image = UIImage(named: "background.jpg")
		self.view.insertSubview(backgroundImage, at: 0)

		var firstBtn = UIButton()
		var debugBtn: 		UIButton!
		var resultsBtn = 	UIButton()
		var displayBtn = UIButton()
		var showWikipediaBtn = UIButton()

				// set up firstBtn
		showWikipediaBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.525,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		showWikipediaBtn.layer.borderWidth = 2.0;
		showWikipediaBtn.backgroundColor = UIColor.red
		showWikipediaBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
		showWikipediaBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		showWikipediaBtn.addTarget(
			self,
			action: #selector(showWikipediaBtnTapped),
			for: .touchUpInside)
		
		showWikipediaBtn.setTitle("Show Wikipedia", for: .normal)


		// set up firstBtn
		firstBtn =  UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.225,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		firstBtn.layer.borderWidth = 2.0;
		firstBtn.backgroundColor = UIColor.red
		//firstBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
		firstBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		firstBtn.addTarget(
			self,
			action: #selector(firstBtnTapped),
			for: .touchUpInside)
		
		firstBtn.setTitle("Find Information 💊", for: .normal)

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
			y: screenHeight * 0.325,
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
			y: screenHeight * 0.425,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		debugBtn.layer.borderWidth = 2.0;
		debugBtn.backgroundColor = UIColor.red
		debugBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
		if debug == true {
			debugBtn.setTitle("Debug On", for: .normal)
		} else {
			debugBtn.setTitle("Debug Off", for: .normal)
		}
		debugBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		debugBtn.addTarget(
			self,
			action: #selector(debugButtonTapped),
			for: .touchUpInside)
		

		north.addSubview(firstBtn)
		//north.addSubview(displayBtn)
		//north.addSubview(resultsBtn)
		//north.addSubview(debugBtn)
		//north.addSubview(showWikipediaBtn)
		
		//south.removeFromSuperview(
		

		
	}// end view did load

	func displayWikipediaPage(base: URL, str: String) {
		// base url
		//let urlString = URL(string: "http://en.wikipedia.org/wiki/")
		let urlString = base
		
		// article url
		//let article      = URL(string: "adderall", relativeTo: urlString)
		let article      = URL(string: str, relativeTo: urlString)
		
		// string from article url
		let articleString = article?.absoluteString
		//ArticleString now contains: baseurl + article
		
		if let url = URL(string: articleString!) {
			if #available(iOS 10.0, *) {
				UIApplication.shared.open(url, options: [:], completionHandler: nil)
			} else {
				UIApplication.shared.openURL(url)
			}
		} else {
			print("could not open url, it was nil")
		}
	}

	@objc  func showWikipediaBtnTapped() {
		let baseUrl = URL(string: "http://en.wikipedia.org/wiki/")
		let baseName = "acetaminophen"
		
		// search wikipedia by pill's name
		displayWikipediaPage(base: baseUrl!, str: baseName)
		
	}
	
	@objc func buttonDidPress(){}

	@objc func resultsBtnTapped(Sender: UIButton) {
		displayResultsPage()
	}
	
	@objc func cardDisplayPageBtnTapped(Sender: UIButton) {
		displayCardDisplayPage()
	}

	@objc func firstBtnTapped() {
		displaySearchFormPage()
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
