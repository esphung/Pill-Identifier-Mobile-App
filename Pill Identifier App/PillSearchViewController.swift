//
//  PillSearchViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/17/18.
//  Copyright © 2018 Phung Technology. All rights reserved.

import UIKit



public let myDefaultTextFontSize = CGFloat(24.0)
public let myDefaultTextFieldHeight = CGFloat(myDefaultTextFontSize + (myDefaultTextFontSize * 0.66))
public let myListIndent = CGFloat(20.0)

// Screen width.
public var screenWidth: CGFloat {
	return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
	return UIScreen.main.bounds.height
}

class PillSearchViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
	

	// set up view layout
	var north:  UIView!
	var south: UIView!
	
	
	var northFrame: CGRect {
		//let midX = self.view.bounds.midX
		//let midY = self.view.bounds.midY
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115),width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2)
	}
	
	var southFrame: CGRect {
		//let midX = self.view.bounds.midX
		//slet midY = self.view.bounds.midY
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
	
	var currentImage: 		UIImage!
	var imageBtn:			UIButton!
	var pillImageView:		UIImageView!

	var colorTextField:	UITextField!
	var pickerView : UIPickerView!
	var pickerData = ["", "Orange" , "Purple" , "Green", "White", "Pink"]

	var shapeTextField:	UITextField!
	var imprintTextField:	UITextField!
	var submitButton: UIButton!
	let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
	
	override func viewDidLoad() {
		
		super.viewDidLoad()
		// Do any additional setup after loading the view
		self.south.backgroundColor = .yellow
		self.north.backgroundColor = .green
		
	}// end view did load
	
	@objc func doneClick() {
		colorTextField.resignFirstResponder()
	}
	@objc func cancelClick() {
		colorTextField.resignFirstResponder()
	}

	func pickUp(_ textField : UITextField){
		// UIPickerView
		self.pickerView = UIPickerView(frame:CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 216))
		self.pickerView.delegate = self
		self.pickerView.dataSource = self
		self.pickerView.backgroundColor = UIColor.white
		colorTextField.inputView = self.pickerView
		
		// ToolBar
		let toolBar = UIToolbar()
		toolBar.barStyle = .default
		toolBar.isTranslucent = true
		toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
		toolBar.sizeToFit()
		
		// Adding Button ToolBar
		let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneClick))
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
		toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
		toolBar.isUserInteractionEnabled = true
		textField.inputAccessoryView = toolBar
		
	}
	
	@objc func submitButtonTapped(_ sender: Any) {
		print("HELLO WORLD!")
	}// end upload button action

	@objc func imageButtonTapped(_ sender: Any) {
		importImage()
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
	
	//MARK:- PickerView Delegate & DataSource
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return 1
	}
	func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
		return pickerData.count
	}
	func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
		return pickerData[row]
	}

	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.colorTextField.text = pickerData[row]
	}

	//MARK:- TextField Delegate
	func textFieldDidBeginEditing(_ textField: UITextField) {
		self.pickUp(colorTextField)
	}
	
	// MARK: - ImagePicker Delegate
	@objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			pillImageView.image = pickedImage
		}
		dismiss(animated: true, completion: {})
	}
	
	@objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: {})
	}
	
	func setMyBackgroundImage() {
		backgroundImage.image = UIImage(named: "background.png")
		backgroundImage.contentMode = UIView.ContentMode.scaleToFill
		self.view.insertSubview(backgroundImage, at: 0)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.south.frame = self.southFrame
		self.north.frame = self.northFrame
		
		//setMyBackgroundImage()
		
		

		// ====================  set up IMAGE BUTTON (NORTH VIEW)
		imageBtn =  UIButton(frame: CGRect(x: 0, y: 0,width: self.north.frame.width, height: self.north.frame.height))
		imageBtn.layer.borderWidth = 1.0
		imageBtn.setTitleColor(UIColor.black, for: .normal)
		imageBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		imageBtn.setTitleColor(UIColor.white, for: .highlighted)
		imageBtn.setTitle("Pick an Image", for: .normal)
		imageBtn.titleLabel?.font =  UIFont.systemFont(ofSize: myDefaultTextFontSize, weight: .light)
		imageBtn.addTarget(self, action: #selector(imageButtonTapped), for: .touchUpInside)
		self.north.addSubview(imageBtn)
		
		// ========================================  set up PILLImageVIEW (NORTH VIEW)
		pillImageView = UIImageView(frame: CGRect(x: 0, y: 0,width: self.north.frame.width, height: self.north.frame.height))

		self.north.addSubview(pillImageView)



		colorTextField = UITextField(frame: CGRect(x: myListIndent,y: (south.frame.height/2) * 0.1, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		colorTextField.placeholder = "Pick a Color"
		colorTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		colorTextField.layer.borderWidth = 1.0
		colorTextField.borderStyle = UITextField.BorderStyle.roundedRect
		colorTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		colorTextField.delegate = self

		self.south.addSubview(colorTextField)

		// ========================================  set up SHAPE AND SHAPE PICKER

		shapeTextField = UITextField(frame: CGRect(x: myListIndent,y: (south.frame.height/2) * 0.6, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		shapeTextField.placeholder = "Choose a Shape"
		shapeTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		shapeTextField.layer.borderWidth = 1.0
		shapeTextField.borderStyle = UITextField.BorderStyle.roundedRect
		shapeTextField.autocorrectionType = UITextAutocorrectionType.yes
		shapeTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		shapeTextField.delegate = self

		self.south.addSubview(shapeTextField)


		// ========================================  set up SHAPE AND SHAPE PICKER

		imprintTextField = UITextField(frame: CGRect(x: myListIndent,y: (south.frame.height/2) * 1.1, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		imprintTextField.placeholder = "Enter Pill Imprint"
		imprintTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		imprintTextField.layer.borderWidth = 1.0
		imprintTextField.borderStyle = UITextField.BorderStyle.roundedRect
		imprintTextField.autocorrectionType = UITextAutocorrectionType.yes
		imprintTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		imprintTextField.delegate = self

		self.south.addSubview(imprintTextField)


		submitButton = UIButton(frame: CGRect(x: myListIndent,y: (south.frame.height/2) * 1.6, width: (self.south.frame.width * 0.9), height: myDefaultTextFieldHeight))
		submitButton.layer.borderWidth = 2.0
		submitButton.setTitleColor(UIColor.black, for: .normal)
		submitButton.setTitleColor(UIColor.lightGray, for: .disabled)
		submitButton.setTitleColor(UIColor.white, for: .highlighted)
		submitButton.setTitle("Submit", for: .normal)
		submitButton.titleLabel?.font =  UIFont.systemFont(ofSize: myDefaultTextFontSize, weight: .light)
		submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)

		self.south.addSubview(submitButton)
		
	}
	
}// end view controller class definition
