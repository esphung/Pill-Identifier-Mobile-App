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
	var south: UIView!
	
	var imageName: 	String!
	var image:		UIImage!
	var imageView: 	UIImageView!
	
	var northFrame: CGRect {
		return CGRect(
			x: (myView.frame.width * 0.05),
			y: (myView.frame.height * 0.1),
			width: (myView.frame.width * 0.95),
			height: ((myView.frame.height) - (myView.frame.height) * 0.05 ) )
	}
	
	var southFrame: CGRect {
		return CGRect(
			x: (myView.frame.width * 0.05),
			y: (myView.frame.height * 0.1)/2,
			width: (myView.frame.width * 0.95),
			height: ((myView.frame.height)/2.2) )
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
		//self.view.addSubview(south)
		self.south = south
		
		/*
		let imageView = UIImageView(frame: CGRect(
			x: 0,
			y: 0,
			width: north.frame.width * 0.9,
			height: north.frame.height * 0.9))
		*/
		
		imageName = "250x250placeholder.jpg"
		image = UIImage(named: imageName)

		let imageView = UIImageView()
		//imageView.layer.borderWidth = myBorders
		//imageView.contentMode = UIView.ContentMode.scaleAspectFill

		north.addSubview(imageView)

		setUpContraints()
		//showDebug()

		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeRight.direction = UISwipeGestureRecognizer.Direction.right
		//self.view.addGestureRecognizer(swipeRight)
		
		/*
		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeDown.direction = UISwipeGestureRecognizer.Direction.down
		//self.view.addGestureRecognizer(swipeDown)
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeUp.direction = UISwipeGestureRecognizer.Direction.up
		//self.view.addGestureRecognizer(swipeUp)
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
		//self.view.addGestureRecognizer(swipeLeft)
		*/

	}
	
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		north.frame = self.northFrame
		south.frame = self.southFrame
		
	}
	
	

	func setNavigationBar(title: String) {
		let navigationBar = UINavigationBar(frame: CGRect(
			x: 0, y: screenHeight/24, width: screenWidth, height: 44))
	
		// Create a navigation item with a title
		let navigationItem = UINavigationItem()
		navigationItem.title = title
		
		// Create left and right button for navigation item
		let leftButton =  UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(backBtnTapped))
		let rightButton = UIBarButtonItem(title:  "💊", style: .plain, target: self, action: #selector(rightButtonTapped))
		
		// Create two buttons for the navigation item
		navigationItem.leftBarButtonItem = leftButton
		navigationItem.rightBarButtonItem = rightButton
		
		// Assign the navigation item to the navigation bar
		navigationBar.items = [navigationItem]
		
		// Make the navigation bar a subview of the current view controller
		self.view.addSubview(navigationBar)
	}
	
	@objc func debugButtonTapped(sender: UIButton) {
		toggleDebug()
		print("Debug Button Tapped")
	}
	
	@objc func rightButtonTapped() {
		displayUploadFormPage()
		self.view.removeFromSuperview()
		
	}
	
	func displayUploadFormPage() {
		let uploadFormViewController: UploadFormViewController = storyboard?.instantiateViewController(withIdentifier: "uploadFormViewController") as! UploadFormViewController
		
		self.present(
			uploadFormViewController,
			animated: true,
			completion: {
		})
	}
	
	@objc func backBtnTapped() {
		performSegueToReturnBack()
		print("Back Button Tapped")
	}
	
	func setUpContraints(){
		
		myView.translatesAutoresizingMaskIntoConstraints = false//<- never forget this line
		
		// myView Contraints
		myView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		myView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		myView.widthAnchor.constraint(equalToConstant: screenWidth * 0.95).isActive = true
		myView.heightAnchor.constraint(equalToConstant: screenHeight *  0.9).isActive = true

	}

	func toggleDebug() {
		if debug {
			debug =  false
			hideDebug()
		}
		else {
			debug = true
			showDebug()
			//sender.setTitle("Debug On", for: .normal)
		}
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
		
		/*
		south.backgroundColor = UIColor(white: 1, alpha: 0.5)
		south.layer.borderColor = UIColor.black.cgColor
		south.layer.borderWidth = 2.0
		south.backgroundColor = .yellow
		*/
		
		myBorders = 2.0
		
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
		
		myBorders = 0.0
		

		
	}
	
	func setBorders(float: CGFloat){
		myBorders = float
	}
	
	func hideDebug(){
		hideFrames()
	}
	
	@objc func showDebug() {
			showFrames()
	}
	
	// image view photo display
	func makeDisplayImage(image:  UIImage) -> UIImageView {
		imageView = UIImageView(frame: CGRect(
			x: myListIndent,
			y: 0,
			width: screenWidth * 0.8,
			height: screenHeight/2))
		imageView.image = image
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
				self.dismiss(animated: true, completion: nil)
				print("Swiped right")
			case UISwipeGestureRecognizer.Direction.down:
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
