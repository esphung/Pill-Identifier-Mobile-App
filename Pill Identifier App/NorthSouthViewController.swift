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
			height: ((myView.frame.height)/2.2) )
	}
	
	var southFrame: CGRect {
		return CGRect(
			x: (myView.frame.width * 0.05),
			y: (myView.frame.maxY/1.8),
			width: (northFrame.width),
			height: (myView.frame.height)/2.2)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		let myView = UIView()
		myView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(myView)
		self.myView  =  myView
		
		let north = UIView()
		north.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(north)
		self.north = north
		
		let south = UIView()
		south.translatesAutoresizingMaskIntoConstraints = false
		self.view.addSubview(south)
		self.south = south
		
		setViewContraints()
		setNavigationBar()
		showDebug()

	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		south.frame = self.southFrame
		north.frame = self.northFrame
		
	}
	
	func setNavigationBar() {
		let navigationBar = UINavigationBar(frame: CGRect(
			x: 0, y: screenHeight/24, width: screenWidth, height: myDefaultTextFieldHeight))
	
		// Create a navigation item with a title
		let navigationItem = UINavigationItem()
		navigationItem.title = self.restorationIdentifier!
		
		// Create left and right button for navigation item
		let leftButton =  UIBarButtonItem(title: "Back", style:   .plain, target: self, action: #selector(btn_clicked))
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
	
	func setViewContraints(){
		
		// myView Contraints
		myView.centerXAnchor.constraint(
			equalTo: view.centerXAnchor).isActive = true
		myView.centerYAnchor.constraint(
			equalTo: view.centerYAnchor).isActive = true
		myView.widthAnchor.constraint(
			equalToConstant: screenWidth * 0.95).isActive = true
		myView.heightAnchor.constraint(
			equalToConstant: screenHeight *  0.9).isActive = true
		
		// north constraints to myView
		north.centerXAnchor.constraint(
			equalTo: myView.centerXAnchor).isActive = true
		north.centerYAnchor.constraint(
			equalTo: myView.centerYAnchor).isActive = true

		north.widthAnchor.constraint(
			equalToConstant: myView.frame.width * 0.95).isActive = true
		north.heightAnchor.constraint(
			equalToConstant: myView.frame.height *  0.95).isActive = true

		
		// south constraints to myView
		south.centerXAnchor.constraint(
			equalTo: myView.centerXAnchor).isActive = true
		south.centerYAnchor.constraint(
			equalTo: myView.centerYAnchor).isActive = true

		south.widthAnchor.constraint(
			equalToConstant: myView.frame.width * 0.95).isActive = true
		south.heightAnchor.constraint(
			equalToConstant: myView.frame.height *  0.95).isActive = true

		
		
	}
	
	func showFrames() {
		// show debug view canvases
		myView.backgroundColor = UIColor.blue
		myView.layer.borderColor = UIColor.black.cgColor
		myView.layer.borderWidth = 2.0
		
		south.backgroundColor = UIColor(white: 1, alpha: 0.5)
		south.layer.borderColor = UIColor.black.cgColor
		south.layer.borderWidth = 2.0
		//self.south.backgroundColor = .yellow
		
		north.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		north.layer.borderColor = UIColor.black.cgColor
		north.layer.borderWidth = 2.0
		//north.backgroundColor = .green
		
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
		//imageView.image = image
		imageView.image = resizeToScreenSize(image: image)
		imageView.layer.borderWidth = myBorders
		imageView.contentMode = UIView.ContentMode.scaleAspectFill
		
		return imageView
	}
	
	func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
		
		let scale = newWidth / image.size.width
		let newHeight = image.size.height * scale
		
		UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
		
		image.draw(in: CGRect(x: 0, y: 0,width: newWidth, height: newHeight))
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return newImage!
	}
	
	func resizeToScreenSize(image: UIImage)->UIImage{
		return resizeImage(image: image, newWidth: north.frame.width)
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
}
