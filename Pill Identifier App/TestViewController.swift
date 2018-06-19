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
		
		var debugBtn = UIButton()
		
		// set up debugBtn
		debugBtn =  UIButton(frame: CGRect(x: screenWidth/12, y: screenHeight/2, width: screenWidth * 0.8, height: 50))
		debugBtn.layer.borderWidth = 2.0;
		debugBtn.backgroundColor = UIColor.green
		
		if isDebugOn() {
			debugBtn.setTitle("Debug On", for: .normal)
		} else {
			debugBtn.setTitle("Debug Off", for: .normal)
		}
		debugBtn.titleLabel?.font =  UIFont.systemFont(ofSize: 32, weight: .light)
		debugBtn.addTarget(self, action: #selector(debugBtnTapped), for: .touchUpInside)
		
		self.view.addSubview(debugBtn)
		
	}// end view did load
	
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

}
