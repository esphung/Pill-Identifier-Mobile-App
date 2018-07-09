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

class NorthSouthViewController: UIViewController {

	// set up view layout
	var myView : UIView!
	var north:  UIView!

	var imageName: 	String!
	var image:		UIImage!
	var imageView: 	UIImageView!

	var msgLbl:		String!
	
	var northFrame: CGRect {
		return CGRect(
			x: (myView.frame.width * 0.05),
			y: (myView.frame.height * 0.1),
			width: (myView.frame.width * 0.95),
			height: ((myView.frame.height) - (myView.frame.height) * 0.05))
	}
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		// Do any additional setup after loading the view.

		let myView = UIView()
		self.view.addSubview(myView)
		self.myView  =  myView
		
		let north = UIView()
		self.view.addSubview(north)
		self.north = north
		
		imageName = "250x250placeholder.jpg"
		image = UIImage(named: imageName)

		let imageView = UIImageView()


		north.addSubview(imageView)

		setUpContraints()

		

	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		north.frame = self.northFrame
		
	}
	
	func setNavigationBar(title: String) {
		let navigationBar = UINavigationBar(frame: CGRect(
			x: 0, y: screenHeight/24, width: screenWidth, height: 44))
	
		// Create a navigation item with a title
		let navigationItem = UINavigationItem()
		navigationItem.title = title
		
		// Create left and right button for navigation item
		let leftButton =  UIBarButtonItem(title: "🔙Back", style: .plain, target: self, action: #selector(backBtnTapped))
		let rightButton = UIBarButtonItem(title:  "Search💊", style: .plain, target: self, action: #selector(rightButtonTapped))
		
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
		self.view.removeFromSuperview()
		
	}
	
	func displaySearchFormPage() {
		let searchViewController: SearchViewController
		= storyboard?.instantiateViewController(
			withIdentifier: "searchViewController") as! SearchViewController
		
		self.present(
			searchViewController,
			animated: false,
			completion: {
		})
	}

	func displayHomePage() {
		let testViewController: UIViewController
			= (storyboard?.instantiateViewController(
				withIdentifier: "testViewController"))!
		
		self.present(
			testViewController,
			animated: false,
			completion: {
		})
	}
	
	@objc func backBtnTapped() {
		performSegueToReturnBack()
	}
	
	func setUpContraints(){

		// never forget this line
		myView.translatesAutoresizingMaskIntoConstraints = false
		
		// setting contraints
		myView.centerXAnchor.constraint(
			equalTo: view.centerXAnchor).isActive = true
		myView.centerYAnchor.constraint(
			equalTo: view.centerYAnchor).isActive = true
		myView.widthAnchor.constraint(
			equalToConstant: screenWidth * 0.95).isActive = true
		myView.heightAnchor.constraint(
			equalToConstant: screenHeight *  0.9).isActive = true
	}
	
	func showFrames() {
		// show debug view canvases
		//myView.backgroundColor = UIColor(white: 0.25, alpha: 0.5)
		myView.backgroundColor = UIColor.blue
		myView.layer.borderColor = UIColor.black.cgColor
		myView.layer.borderWidth = 2.0
		
		north.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		north.layer.borderColor = UIColor.black.cgColor
		north.layer.borderWidth = 2.0
		//north.backgroundColor = .green
		

	}
	
	func hideFrames() {
		// show debug view canvases
		//myView.backgroundColor = UIColor(white: 0.25, alpha: 0.5)
		myView.backgroundColor = UIColor.clear
		//myView.layer.borderColor = UIColor.black.cgColor
		myView.layer.borderWidth = 0.0
		
		north.backgroundColor = UIColor.clear
		//north.layer.borderColor = UIColor.black.cgColor
		north.layer.borderWidth = 0.0
		//north.backgroundColor = .green
		
	}


	// image view photo display
	func makeDisplayImage(image:  UIImage) -> UIImageView {
		imageView = UIImageView(frame: CGRect(
			x: 20,
			y: 0,
			width: screenWidth * 0.8,
			height: (screenHeight/2) - 6))
		imageView.image = image
		imageView.contentMode = UIView.ContentMode.scaleAspectFit
		
		return imageView
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
