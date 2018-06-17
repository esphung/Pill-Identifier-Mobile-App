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

public let myDefaultImage = UIImage(named: "250x250placeholder.png")!

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
	var square: UIView!

	
	var northFrame: CGRect {
		//let midX = self.view.bounds.midX
		//let midY = self.view.bounds.midY
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115),width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2)
	}
	
	var southFrame: CGRect {
		//let midX = self.view.bounds.midX
		//slet midY = self.view.bounds.midY
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight/1.9), width: (screenWidth * 0.90), height: (screenHeight * 0.9)/2)
	}

	var squareFrame: CGRect {
		return CGRect(x: 0, y: 0, width: (screenWidth * 0.90), height: ((screenHeight * 0.9)/2)/2)
	}
	
	override func loadView() {
		super.loadView()
		
		let north = UIView()
		self.view.addSubview(north)
		self.north = north
		
		let south = UIView()
		self.view.addSubview(south)
		self.south = south
		
		let square = UIView()
		self.south.addSubview(square)
		self.square = square
		
		
	}// end loadview
	
	var imageBtn:			UIButton!
	var pillImageView:		UIImageView!

	var pickerTextField:	UITextField!
	var pickerView: 		UIPickerView! 
	
	let pickerData = [
		["Orange" , "Purple" , "Green", "White", "Pink"],
		["Diamond","Circle","Square","Triangle","Rectangle"]
	]

	//var shapeTextField:	UITextField!
	var colorLabel: 		UILabel!
	var shapeLabel: 		UILabel!
	var imprintLabel:		UILabel!

	var imprintTextField:	UITextField!
	var submitButton: 		UIButton!

	let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
	
	override func viewDidLoad() {
		super.viewDidLoad()

        //Looks for single or multiple taps. 
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PillSearchViewController.dismissKeyboard))

	    //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
	    //tap.cancelsTouchesInView = false 

	    view.addGestureRecognizer(tap)

		// Do any additional setup after loading the view
		//self.south.backgroundColor = .yellow
		//self.north.backgroundColor = .green
		//self.square.backgroundColor = .orange

		
	}// end view did load
	
	@objc func doneClick() {
		updateLabels()
		pickerTextField.resignFirstResponder()
	}
	@objc func cancelClick() {
		pickerTextField.resignFirstResponder()
	}

	func pickUp(_ textField : UITextField){
		// UIPickerView
		self.pickerView = UIPickerView(frame:CGRect(x: north.frame.minX, y: north.frame.minY, width: north.frame.size.width, height: 216))
		self.pickerView.delegate = self
		self.pickerView.dataSource = self
		self.pickerView.backgroundColor = UIColor.white
		pickerTextField.inputView = self.pickerView
		
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
		toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
		toolBar.isUserInteractionEnabled = true
		textField.inputAccessoryView = toolBar
		
	}
	
	@objc func submitButtonTapped() {
		print("Submit Button Tapped!")

		exit(0)
	}// end upload button action

	@objc func imageButtonTapped(_ sender: Any) {
		importImage()
	}// end upload button action
	
	func importImage() {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .photoLibrary
		present(imagePicker, animated: true, completion: {})
	}
	
	//MARK:- PickerView Delegate & DataSource
	func numberOfComponents(in pickerView: UIPickerView) -> Int {
		return pickerData.count
	}

	func pickerView(_
		pickerView: UIPickerView,
					numberOfRowsInComponent component: Int
		) -> Int {
		return pickerData[component].count
	}

	func pickerView(_
		pickerView: UIPickerView,
					titleForRow row: Int,
					forComponent component: Int
		) -> String? {
		return pickerData[component][row]
	}
	
	func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
		self.pickerTextField.text = pickerData[component][row]
	}

	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		updateImprintLabel()
		return true
	}
	
	func textFieldDidChange(textField : UITextField){
		updateImprintLabel()
	}

	//MARK:- TextField Delegate
	func textFieldDidBeginEditing(_ textField: UITextField) {
		self.pickUp(pickerTextField)
	}
	
	// MARK: - ImagePicker Delegate
	@objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			self.pillImageView.image = pickedImage
		} else {
			self.pillImageView.image = myDefaultImage
		}
		dismiss(animated: true, completion: nil)
	}
	
	@objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
	func setMyBackgroundImage() {
		backgroundImage.image = UIImage(named: "background.png")
		backgroundImage.contentMode = UIView.ContentMode.scaleToFill
		self.view.insertSubview(backgroundImage, at: 0)
	}

	//MARK - Color and Shape Picker Instance Methods
	func updateLabels(){
		let color = pickerData[0][pickerView.selectedRow(inComponent: 0)]
		let shape = pickerData[1][pickerView.selectedRow(inComponent: 1)]
		self.colorLabel.text = ("Color:\t\t" + color)
		self.shapeLabel.text = ("Shape:\t\t" + shape)
		self.updateImprintLabel()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.south.frame = self.southFrame
		self.north.frame = self.northFrame
		self.square.frame = self.squareFrame

		setMyBackgroundImage()

		// ====================  set up IMAGE BUTTON (NORTH VIEW)
		self.imageBtn =  UIButton(frame: CGRect(x: 0, y: 0,width: self.north.frame.width, height: self.north.frame.height))
		self.imageBtn.layer.borderWidth = 2.0
		self.imageBtn.setTitleColor(UIColor.black, for: .normal)
		self.imageBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		self.imageBtn.setTitleColor(UIColor.white, for: .highlighted)
		self.imageBtn.setTitle("Pick an Image", for: .normal)
		self.imageBtn.titleLabel?.font =  UIFont.systemFont(ofSize: myDefaultTextFontSize, weight: .light)
		self.imageBtn.addTarget(self, action: #selector(self.imageButtonTapped), for: .touchUpInside)
		self.north.addSubview(self.imageBtn)
		
		// ========================================  set up PILLImageVIEW (NORTH VIEW)
		self.pillImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0,width: self.north.frame.width, height: self.north.frame.height))
		//self.pillImageView.image = UIImage(named: "250x250placeholder.png")!
		self.north.addSubview(self.pillImageView)

		// ========================================  Set Up Picker Text Field
		self.pickerTextField = UITextField(frame: CGRect(x: myListIndent,y: (self.square.frame.maxY * 0.1), width: (self.square.frame.width * 0.90), height: myDefaultTextFieldHeight))
		self.pickerTextField.placeholder = "Pick Color"
		self.pickerTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		//pickerTextField.layer.borderWidth = 2.0
		self.pickerTextField.borderStyle = UITextField.BorderStyle.roundedRect
		//pickerTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		self.pickerTextField.delegate = self

		self.square.addSubview(self.pickerTextField)
		
		// ========================================  PILL IMPRINT TEXT FIELD
		self.imprintTextField = UITextField(frame: CGRect(x: myListIndent,y: (self.square.frame.maxY  * 0.4), width: (self.square.frame.width * 0.90), height: myDefaultTextFieldHeight))
		self.imprintTextField.placeholder = "Enter Pill Imprint"
		self.imprintTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		//imprintTextField.layer.borderWidth = 2.0
		self.imprintTextField.borderStyle = UITextField.BorderStyle.roundedRect
		self.imprintTextField.autocorrectionType = UITextAutocorrectionType.no
		//imprintTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		imprintTextField.delegate = self

		self.square.addSubview(self.imprintTextField)

		// ========================================  Set Up Submit Button
		
		submitButton = UIButton(frame: CGRect(x: myListIndent,y: (self.square.frame.maxY) * 0.7, width: (self.square.frame.width * 0.90), height: myDefaultTextFieldHeight))
		submitButton.layer.borderWidth = 2.0
		submitButton.setTitleColor(UIColor.black, for: .normal)
		submitButton.setTitleColor(UIColor.lightGray, for: .disabled)
		submitButton.setTitleColor(UIColor.white, for: .highlighted)
		submitButton.setTitle("Submit", for: .normal)
		submitButton.titleLabel?.font =  UIFont.systemFont(ofSize: myDefaultTextFontSize, weight: .light)
		submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
		
		self.square.addSubview(submitButton)
		
		// ========================================  PILL PARAMETERS SEARCH DISPLAY
		colorLabel = UILabel(frame: CGRect(x: myListIndent,y: (self.south.frame.height/2) * 1.0, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		colorLabel.text = "Color:"

		shapeLabel = UILabel(frame: CGRect(x: myListIndent,y: (self.south.frame.height/2) * 1.2, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		shapeLabel.text = "Shape:"

		imprintLabel = UILabel(frame: CGRect(x: myListIndent,y: (self.south.frame.height/2) * 1.4, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		imprintLabel.text = "Imprint:"

		self.south.addSubview(colorLabel)
		self.south.addSubview(shapeLabel)
		self.south.addSubview(imprintLabel)

		print("FINISHED VIEW SET UP!")
		
	}
	
	func updateImprintLabel() {
		self.imprintLabel.text = "Imprint:\t" + self.imprintTextField.text!
	}

	    //Calls this function when the tap is recognized.
	@objc func dismissKeyboard() {
	    //Causes the view (or one of its embedded text fields) to resign the first responder status.
		updateImprintLabel()
	    view.endEditing(true)
	}
	
	func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
		updateImprintLabel()
		self.view.endEditing(true)
		return true
	}
	
}// end view controller class definition
