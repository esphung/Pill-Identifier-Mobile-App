//
//  NorthSouthViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/18/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit.UIViewController



class NorthSouthViewController: UIViewController {

	// set up view layout
	var myView : UIView!
	var north:  UIView!
	var south: 	UIView!
	
	var imageName: 	String!
	var image:		UIImage!
	var imageView: 	UIImageView!
	
	var northFrame: CGRect {
		return CGRect(
			x: (myView.frame.width * 0.05),
			y: (myView.frame.height * 0.1),
			width: (myView.frame.width * 0.95),
			height: ((myView.frame.height)/2.1) )
	}
	
	var southFrame: CGRect {
		return CGRect(
			x: (myView.frame.width * 0.05),
			y: (myView.frame.maxY/1.8),
			width: (north.frame.width),
			height: (north.frame.height))
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
		
		let south = UIView()
		self.view.addSubview(south)
		self.south = south
		
		let imageView = UIImageView(frame: CGRect(
			x: myListIndent,
			y: myListPadTop,
			width: north.frame.width * 0.9,
			height: north.frame.height * 0.9))
		imageView.image = image
		imageView.layer.borderWidth = myBorders
		imageView.contentMode = UIView.ContentMode.scaleAspectFill
		self.north.addSubview(imageView)

		setUpContraints()
		//setNavigationBar()
		showDebug()
		
		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeRight.direction = UISwipeGestureRecognizer.Direction.right
		self.view.addGestureRecognizer(swipeRight)
		
		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeDown.direction = UISwipeGestureRecognizer.Direction.down
		self.view.addGestureRecognizer(swipeDown)
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeUp.direction = UISwipeGestureRecognizer.Direction.up
		self.view.addGestureRecognizer(swipeUp)
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
		self.view.addGestureRecognizer(swipeLeft)

	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		north.frame = self.northFrame
		south.frame = self.southFrame
		
		
	}
	
	func setNavigationBar() {
		let navigationBar = UINavigationBar(frame: CGRect(
			x: 0, y: screenHeight/24, width: screenWidth, height: 44))
	
		// Create a navigation item with a title
		let navigationItem = UINavigationItem()
		navigationItem.title = self.restorationIdentifier!
		
		// Create left and right button for navigation item
		let leftButton =  UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(btn_clicked))
		//let rightButton = UIBarButtonItem(title: "Right", style: .plain, target: self, action: nil)
		
		// Create two buttons for the navigation item
		navigationItem.leftBarButtonItem = leftButton
		//navigationItem.rightBarButtonItem = rightButton
		
		// Assign the navigation item to the navigation bar
		navigationBar.items = [navigationItem]
		
		// Make the navigation bar a subview of the current view controller
		self.view.addSubview(navigationBar)
	}
	
	@objc func btn_clicked() {
		performSegueToReturnBack()
	}
	
	func setUpContraints(){
		
		myView.translatesAutoresizingMaskIntoConstraints = false//<- never forget this line
		
		// myView Contraints
		myView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		myView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		myView.widthAnchor.constraint(equalToConstant: screenWidth * 0.95).isActive = true
		myView.heightAnchor.constraint(equalToConstant: screenHeight *  0.9).isActive = true
		
		north.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor).isActive = true
		north.heightAnchor.constraint(equalToConstant: 200).isActive = true
		north.bottomAnchor.constraint(equalTo: south.topAnchor,constant: -10).isActive = true
		
		south.bottomAnchor.constraint(
			equalTo: bottomLayoutGuide.topAnchor,
			constant: -20).isActive = true

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

		south.backgroundColor = UIColor(white: 1, alpha: 0.5)
		south.layer.borderColor = UIColor.black.cgColor
		south.layer.borderWidth = 2.0
		//self.south.backgroundColor = .yellow
		
	}
	
	func setBorders(float: CGFloat){
		myBorders = float
	}
	
	@objc func showDebug() {
		if debug == true {
			showFrames()
			setBorders(float: 2.0)
			//self.view.backgroundColor = .white
		} else {
			setBorders(float: 0.0)
		}
	}
	
	// image view photo display
	func makeDisplayImage(image:  UIImage) -> UIImageView {
		imageView = UIImageView(frame: CGRect(
			x: myListIndent,
			y: myListPadTop,
			width: north.frame.width * 0.9,
			height: north.frame.height * 0.9))
		imageView.image = image
		//imageView.image = resizeToScreenSize(image: image)
		imageView.layer.borderWidth = myBorders
		imageView.contentMode = UIView.ContentMode.scaleAspectFit
		
		return imageView
	}
	


}

extension UIViewController {
	func performSegueToReturnBack()  {
		if let nav = self.navigationController {
			nav.popViewController(animated: true)
		} else {
			self.dismiss(animated: true, completion: nil)
		}
	}
	
	@objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
		if let swipeGesture = gesture as? UISwipeGestureRecognizer {
			switch swipeGesture.direction {
			case UISwipeGestureRecognizer.Direction.right:
				print("Swiped right")
			case UISwipeGestureRecognizer.Direction.down:
				self.dismiss(animated: true, completion: nil)
				print("Swiped down")
			case UISwipeGestureRecognizer.Direction.left:
				print("Swiped left")
			case UISwipeGestureRecognizer.Direction.up:
				print("Swiped up")
			default:
				break
			}
		}
	}
}
