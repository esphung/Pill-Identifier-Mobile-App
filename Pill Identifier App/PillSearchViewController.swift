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
	var square: UIView!
	var north:  UIView!
	
	var squareFrame: CGRect {
		//let midX = self.view.bounds.midX
		//let midY = self.view.bounds.midY
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115), width: (screenWidth * 0.90), height: (screenHeight * 0.8))
	}
	var northFrame: CGRect {
		//let midX = self.view.bounds.midX
		//let midY = self.view.bounds.midY
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115),width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2)
	}
	
	override func loadView() {
		super.loadView()
		
		let square = UIView()
		self.view.addSubview(square)
		self.square = square
		
		let north = UIView()
		self.view.addSubview(north)
		self.north = north
		
	}
	
	var currentImage: 	UIImage!
	var imageBtn:		UIButton!
	var pillImageView: UIImageView!
	
	let sampleTextField =  UITextField(frame: CGRect(
		x: (screenWidth * 0.05) ,
		y: (((screenHeight)/(2))+((screenHeight)/(2))/2),
		width: (screenWidth * 0.90), height: 40))
	
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		// Do any additional setup after loading the view
		self.square.backgroundColor = .yellow
		self.north.backgroundColor = .green
		
		
		
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
		
		self.square.frame = self.squareFrame
		self.north.frame = self.northFrame
		
		// ====================  set up SEND BUTTON (NORTH VIEW)
		imageBtn =  UIButton(frame: CGRect(x: 0, y: 0,width: self.north.frame.width, height: self.north.frame.height))
		imageBtn.layer.borderWidth = 1.0
		imageBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		imageBtn.setTitleColor(UIColor.white, for: .highlighted)
		imageBtn.setTitle("Upload Image", for: .normal)
		imageBtn.titleLabel?.font =  UIFont.systemFont(ofSize: 32, weight: .light)
		imageBtn.addTarget(self, action: #selector(uploadBtnTapped), for: .touchUpInside)
		self.north.addSubview(imageBtn)
		
		// ====================  set up PILLImageVIEW (NORTH VIEW)
		//pillImageView.image = UIImage(named: "test.png")
		pillImageView = UIImageView(frame: CGRect(x: 0, y: 0,width: self.north.frame.width, height: self.north.frame.height))
		self.north.addSubview(pillImageView)

		// ====================  set up TEXTFIELD
		sampleTextField.placeholder = "Enter Pill Imprint"
		sampleTextField.font = UIFont.systemFont(ofSize: 24)
		sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
		sampleTextField.autocorrectionType = UITextAutocorrectionType.no
		sampleTextField.keyboardType = UIKeyboardType.default
		sampleTextField.returnKeyType = UIReturnKeyType.done
		sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
		sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		//sampleTextField.delegate = self
		self.view.addSubview(sampleTextField)
		
	}
	
}// end view controller class definition

