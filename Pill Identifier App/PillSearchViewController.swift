//
//  PillSearchViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/17/18.
//  Copyright © 2018 Phung Technology. All rights reserved.

import UIKit


// Screen width.
public var screenWidth: CGFloat {
	return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
	return UIScreen.main.bounds.height
}

class PillSearchViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	// set up layout
	var south: UIView!
	var north:  UIView!
	
	var northFrame: CGRect {
		//let midX = self.view.bounds.midX
		//let midY = self.view.bounds.midY
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115),width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2)
	}
	
	var southFrame: CGRect {
		//let midX = self.view.bounds.midX
		//let midY = self.view.bounds.midY
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight/1.9), width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2)
	}


	
	override func loadView() {
		super.loadView()
		
		let north = UIView()
		self.view.addSubview(north)
		self.north = north
		
		let south = UIView()
		self.view.addSubview(south)
		self.south = south
		
	}// end loadview
	
	let currentImage = 	UIImage()
	var imageBtn:		UIButton!
	var pillImageView: UIImageView!
	
	let imprintTextField =  UITextField(frame: CGRect(
		x: (screenWidth * 0.05) ,
		y: (((screenHeight)/(2))+((screenHeight)/(2))/2),
		width: (screenWidth * 0.90), height: 40))
	
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		// Do any additional setup after loading the view
		self.south.backgroundColor = .yellow
		//self.north.backgroundColor = .green

		
		
	}// end view did load
	
	
	@objc func uploadBtnTapped(_ sender: Any) {
		// import form photo library
		importImage()
		print("Action:\tImage Button Tapped")
		
	}// end upload button action
	
	func importImage() {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .photoLibrary
		
		present(imagePicker, animated: false, completion: {})
	}
	
	//Calls this function when the tap is recognized.
	func dismissKeyboard() {
		//Causes the view (or one of its embedded text fields) to resign the first responder status.
		view.endEditing(true)
	}
	
	// MARK: - ImagePicker Delegate
	@objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			//inputPillImageView.image = pickedImage
			pillImageView.image = pickedImage
		}
		
		dismiss(animated: false, completion: {
			//self.imageBtn.isEnabled = true
		})
	}
	
	@objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion:{});
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.south.frame = self.southFrame
		self.north.frame = self.northFrame

		// ====================  set up SEND BUTTON (NORTH VIEW)
		imageBtn =  UIButton(frame: CGRect(x: 0, y: 0,width: self.north.frame.width, height: self.north.frame.height))
		imageBtn.layer.borderWidth = 1.0
		imageBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		imageBtn.setTitleColor(UIColor.white, for: .highlighted)
		imageBtn.setTitle("Upload Image", for: .normal)
		imageBtn.titleLabel?.font =  UIFont.systemFont(ofSize: 24, weight: .light)
		imageBtn.addTarget(self, action: #selector(uploadBtnTapped), for: .touchUpInside)
		self.north.addSubview(imageBtn)
		
		// ====================  set up PILLImageVIEW (NORTH VIEW)
		//pillImageView.image = UIImage(named: "test.png")
		pillImageView = UIImageView(frame: CGRect(x: 0, y: 0,width: self.north.frame.width, height: self.north.frame.height))
		self.north.addSubview(pillImageView)

		// ====================  set up TEXTFIELD
		imprintTextField.placeholder = "Enter Pill Imprint"
		imprintTextField.font = UIFont.systemFont(ofSize: 24)
		imprintTextField.borderStyle = UITextField.BorderStyle.roundedRect
		//imprintTextField.layer.borderWidth = 1.0
		imprintTextField.autocorrectionType = UITextAutocorrectionType.no
		imprintTextField.keyboardType = UIKeyboardType.default
		imprintTextField.returnKeyType = UIReturnKeyType.done
		imprintTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
		imprintTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		//imprintTextField.delegate = self
		//self.view.addSubview(imprintTextField)
		
	}
	
}// end view controller class definition

