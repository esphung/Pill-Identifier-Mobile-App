//
//  NorthSouthViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/18/18.
//  Copyright © 2018 Phung Technology. All rights reserved.

import UIKit.UIViewController



let footerRect = CGRect(x:0, y: 0, width: 200,height: 21)

public var placeholder = "250x250placeholder.png"

// Screen width.
var screenWidth: CGFloat {
	return UIScreen.main.bounds.width
}
// Screen height.
var screenHeight: CGFloat {
	return UIScreen.main.bounds.height
}

@available(iOS 10.0, *)
class NorthSouthViewController: UIViewController {

	// set up view layout
	var myView : UIView!

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		//view.backgroundColor = nurseScrubGreenColor
		
		
		let myView = UIView()
		
		self.view.addSubview(myView)
		
		self.myView  =  myView
		
		setUpContraints()
		
		//view.backgroundColor = nurseScrubGreenColor

	}

	func setNavigationBar(title: String) {
		let navigationBar = UINavigationBar(frame: CGRect(
			x: 0, y: screenHeight/24, width: screenWidth, height: 44))
	
		// Create a navigation item with a title
		let navigationItem = UINavigationItem()
		navigationItem.title = title
		
		// Create left and right button for navigation item
		let leftButton =  UIBarButtonItem(title: "🔙Back", style: .plain, target: self, action: #selector(backBtnTapped))
		let rightButton = UIBarButtonItem(title:  "Home", style: .plain, target: self, action: #selector(rightButtonTapped))
		
		// Create two buttons for the navigation item
		navigationItem.leftBarButtonItem = leftButton
		navigationItem.rightBarButtonItem = rightButton
		
		// Assign the navigation item to the navigation bar
		navigationBar.items = [navigationItem]
		
		// Make the navigation bar a subview of the current view controller
		self.view.addSubview(navigationBar)
	}
	
	@objc func rightButtonTapped() {
		
		displaySearchFormPage()
		
	}

	public func displaySearchFormPage() {
		let searchViewController: SearchViewController
		= storyboard?.instantiateViewController(
			withIdentifier: "searchViewController") as! SearchViewController
		
		self.present(
			searchViewController,
			animated: false,
			completion: {
		})
	}
	
	public func displayHomePage() {
		
		let searchViewController: SearchViewController
			= storyboard?.instantiateViewController(
				withIdentifier: "searchViewController") as! SearchViewController
		
		self.present(
			searchViewController,
			animated: false,
			completion: nil)
	}
	
	@objc func backBtnTapped() {
		performSegueToReturnBack()
		
	}
	
	func setUpContraints(){
		// never forget this line
		myView.translatesAutoresizingMaskIntoConstraints = false
		myView.centerXAnchor.constraint(
			equalTo: view.centerXAnchor).isActive = true
		myView.centerYAnchor.constraint(
			equalTo: view.centerYAnchor).isActive = true
		myView.widthAnchor.constraint(
			equalToConstant: screenWidth).isActive = true
		myView.heightAnchor.constraint(
			equalToConstant: screenHeight).isActive = true
	}
	
	
	func isValid(name: String) -> Bool {
		// check the name is between 4 and ... characters
		if !(4...20 ~= name.count) {
			//print(name.count)
			return false
		}
		return true
	}

	func copyrightLabel() -> UILabel {
		let label = UILabel(frame: footerRect)//rects ->globals file
		label.center = CGPoint(
			x: screenWidth * 0.5, y: screenHeight * 0.9)
		label.textAlignment = .center
		label.text = "Eric Phung 2018"
		return label
	}// end copyright

}// end class def

extension UIViewController {
	
	func performSegueToReturnBack()  {
		
		if let nav = self.navigationController {
			
			nav.popViewController(animated: true)
		} else {
			
			self.dismiss(animated: false, completion: nil)
		}
	}

}
