//
//  Utility.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/18/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//
// 88   88 888888 88 88     88 888888 Yb  dP
// 88   88   88   88 88     88   88    YbdP
// Y8   8P   88   88 88  .o 88   88     8P
// `YbodP'   88   88 88ood8 88   88    dP

import UIKit.UIViewController

//  set up and display wallpaper for sender view
func setBackgroundImage(sender: UIViewController, filename: String) {
	let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
	backgroundImage.image = UIImage(named: filename)
	backgroundImage.contentMode = UIView.ContentMode.scaleToFill
	sender.view.insertSubview(backgroundImage, at: 0)	
}

public func transition(sender: UIViewController, title: String) {
	let secondViewController:ViewController = ViewController()
	sender.present(secondViewController,animated: true,
				 completion: {
					print(sender, " change view ... > ", secondViewController)
	})
}

func isDebugOn() -> Bool {
	if debug  == true {
		return true
	}
	else {
		return false
	}
}
