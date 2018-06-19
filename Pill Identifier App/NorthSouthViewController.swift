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
	var north:  UIView!
	var south: 	UIView!
	
	var northFrame: CGRect {
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115),width: (screenWidth * 0.90), height: ((screenHeight)/2) * 0.8 )
	}
	
	var southFrame: CGRect {
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight/1.8), width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2)
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		
		let north = UIView()
		self.view.addSubview(north)
		self.north = north
		
		let south = UIView()
		self.view.addSubview(south)
		self.south = south
		
		showDebug()

	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		south.frame = self.southFrame
		north.frame = self.northFrame
		
	}
	
	func showFrames() {
		// show debug view canvases
		self.south.backgroundColor = .yellow
		self.north.backgroundColor = .green
		
	}
	
	func setBorders(float: CGFloat){
		myBorders = float
	}
	
	func showDebug() {
		if debug == true {
			showFrames()
			setBorders(float: 2.0)
			//self.view.backgroundColor = .white
		} else {
			setBorders(float: 0.0)
		}
	}

}
