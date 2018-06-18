//
//  PillSearchViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/17/18.
//  Copyright © 2018 Phung Technology. All rights reserved.

// BULLET, CAPSULE, CLOVER, DIAMOND, DOUBLE CIRCLE, FREEFORM, GEAR, HEPTAGON, HEXAGON, OCTAGON, OVAL, PENTAGON, RECTANGLE, ROUND, SEMI-CIRCLE, SQUARE, TEAR, TRAPEZOID, TRIANGLE

import UIKit
import Alamofire
import SwiftyJSON

let baseUrl =  "https://rximage.nlm.nih.gov/"

public let myDefaultTextFontSize = CGFloat(24.0)
public let myDefaultTextFieldHeight = CGFloat(myDefaultTextFontSize + (myDefaultTextFontSize * 0.66))
public let myListIndent = CGFloat(20.0)

let pickerData = [
		["Orange" , "Purple" , "Green", "White", "Pink"],
		["Diamond","Circle","Square","Triangle","Rectangle"]
]

class PillSearchViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

	var color: String!
	var shape: String!
	var userImprint: String!
	
	// set up view layout
	var north:  UIView!
	var south: 	UIView!

	var northFrame: CGRect {
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115),width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2)
	}
	
	var southFrame: CGRect {
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
	
	// input variables
	var imageBtn:			UIButton!
	var pickerTextField:	UITextField!
	var pickerView: 		UIPickerView!
	let colorComponent = 0
	let shapeComponent = 1
	var imprintTextField:	UITextField!
	var submitButton: 		UIButton!


	
	// display vars
	var pillImageView:		UIImageView!
	var colorLabel: 		UILabel!
	var shapeLabel: 		UILabel!
	var imprintLabel:		UILabel!
	var searchLabel:		UILabel!


	
	override func viewDidLoad() {
		super.viewDidLoad()

        //Looks for single or multiple taps. 
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(PillSearchViewController.dismissKeyboard))

	    //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
	    //tap.cancelsTouchesInView = false 

	    view.addGestureRecognizer(tap)
		
		showFrames()
		
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
		self.pickerView = UIPickerView(frame:CGRect(x: 0.0, y: 0.0, width: self.south.frame.size.width * 0.20, height: 216))
		self.pickerView.delegate = self
		self.pickerView.dataSource = self
		self.pickerView.backgroundColor = UIColor.clear
		self.pickerTextField.inputView = self.pickerView


		// ToolBar
		let toolBar = UIToolbar()
		toolBar.barStyle = .default
		toolBar.isTranslucent = true
		toolBar.tintColor = UIColor(red: 92/255, green: 216/255, blue: 255/255, alpha: 1)
		toolBar.sizeToFit()
		
		// Adding Button ToolBar
		let doneButton = UIBarButtonItem(title: "Done", style: .plain , target: self, action: #selector(doneClick))
		let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
		let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelClick))
		toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
		toolBar.isUserInteractionEnabled = true
		textField.inputAccessoryView = toolBar

	}

	@objc func imageButtonTapped(_ sender: Any) {
		if (self.pillImageView.image == nil) {
			importImage()
		} else {
			return
		}
		
	}// end upload button action
	
	func importImage() {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .photoLibrary
		present(imagePicker, animated: true, completion: nil)
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
		return true
	}
	
	func textFieldDidChange(textField : UITextField){
	}

	//MARK:- TextField Delegate
	func textFieldDidBeginEditing(_ textField: UITextField) {
		self.pickUp(pickerTextField)
	}
	
	// MARK: - ImagePicker Delegate
	@objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
			pillImageView.image = pickedImage
		}
		dismiss(animated: true, completion: nil)
	}
	
	@objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	

	//MARK - Color and Shape Picker Instance Methods
	func updateLabels(){
		color = pickerData[0][pickerView.selectedRow(inComponent: 0)]
		shape = pickerData[1][pickerView.selectedRow(inComponent: 1)]
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		south.frame = self.southFrame
		north.frame = self.northFrame

		// ====================  set up IMAGE BUTTON (NORTH VIEW)
		imageBtn =  UIButton(frame: CGRect(x: 0, y: 0,width: self.north.frame.width, height: self.north.frame.height))
		imageBtn.layer.borderWidth = 2.0
		imageBtn.setTitleColor(UIColor.black, for: .normal)
		imageBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		imageBtn.setTitleColor(UIColor.white, for: .highlighted)
		imageBtn.setTitle("Pick an Image", for: .normal)
		imageBtn.titleLabel?.font =  UIFont.systemFont(ofSize: myDefaultTextFontSize, weight: .light)
		imageBtn.addTarget(self, action: #selector(self.imageButtonTapped), for: .touchUpInside)
		north.addSubview(imageBtn)
	
		// ========================================  set up PILLImageVIEW (NORTH VIEW)
		pillImageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0,width: north.frame.width, height: north.frame.height))
		north.addSubview(pillImageView)

		// ========================================  Set Up Picker Text Field
		pickerTextField = UITextField(frame: CGRect(x: myListIndent,y: ((self.south.frame.height) * 0.1), width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		pickerTextField.placeholder = "Color and Shape"
		pickerTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		pickerTextField.layer.borderWidth = 2.0
		pickerTextField.borderStyle = UITextField.BorderStyle.roundedRect
		pickerTextField.delegate = self
		

		south.addSubview(pickerTextField)
		
		// ========================================  PILL IMPRINT TEXT FIELD
		imprintTextField = UITextField(frame: CGRect(x: myListIndent,y: ((south.frame.height)  * 0.3), width: (south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		imprintTextField.placeholder = "Pill Imprint"
		imprintTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		imprintTextField.layer.borderWidth = 2.0
		imprintTextField.borderStyle = UITextField.BorderStyle.roundedRect
		imprintTextField.autocorrectionType = UITextAutocorrectionType.no
		imprintTextField.delegate = self

		south.addSubview(imprintTextField)

		// ========================================  Set Up Submit Button
		submitButton = UIButton(frame: CGRect(x: myListIndent,y: ((south.frame.height/2)), width: (south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		submitButton.layer.borderWidth = 2.0
		submitButton.setTitleColor(UIColor.black, for: .normal)
		submitButton.setTitleColor(UIColor.lightGray, for: .disabled)
		submitButton.setTitleColor(UIColor.white, for: .highlighted)
		submitButton.setTitle("Submit", for: .normal)
		submitButton.titleLabel?.font =  UIFont.systemFont(ofSize: myDefaultTextFontSize, weight: .light)
		submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
		//submitButton.isEnabled = false

		south.addSubview(submitButton)
		

		
	}
	

	//Calls this function when the tap is recognized.
	@objc func dismissKeyboard() {
	    //Causes the view (or one of its embedded text fields) to resign the first responder status.
	    self.view.endEditing(true)
	}
	
	func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
		self.view.endEditing(true)
		return true
	}
	
	func submit() {

		guard let color = color else {
			print("No color to submit")
			return
		}
		
		guard let shape = shape else {
			print("No shape to submit")
			return
		}

		guard let imprint = imprintTextField.text else {
			print("No imprint to submit")
			return
		}
		
		print(color)
		print(shape)
		print(imprint)

		sendToServer(color: color, shape: shape, imprint: imprint)
	}
	
	func sendToServer(color: String, shape: String, imprint: String) {
		
		Alamofire.request(baseUrl+"api/rximage/1/rxnav?color="+color+"&shape="+shape+"").responseJSON { response in

			if let jsonObject = response.result.value {
				let json = JSON(jsonObject)

				// look up by key
				//print(json["nlmRxImages"])

				if (json["replyStatus"]["success"] == true)  {
					print(json["replyStatus"])

					if (json["replyStatus"]["totalImageCount"] > 0) {
						
						// If json is .Dictionary
						for (key,subJson):(String, JSON) in json["nlmRxImages"][0] {
							// Do something you want
							print(key,":\t","\tValue:",  subJson)
						}
						
					}// end if more than one item

				} else {
					print(json["replyStatus"])
				}
				
			}
		}

		
	}

	@objc func submitButtonTapped() {
		
		submit()

		//self.north.addSubview(colorLabel)
		//self.north.addSubview(shapeLabel)

		//self.north.removeFromSuperview()
		//self.south.removeFromSuperview()
		
		

	}// end upload button action

	func showFrames() {
		// Do any additional setup after loading the view
		south.backgroundColor = .yellow
		north.backgroundColor = .green
	}
	
}// end view controller class definition

