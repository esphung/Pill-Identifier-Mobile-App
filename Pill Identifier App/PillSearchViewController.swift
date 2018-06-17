//
//  PillSearchViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/17/18.
//  Copyright © 2018 Phung Technology. All rights reserved.

import UIKit
import Alamofire
import SwiftyJSON

let baseUrl =  "https://rximage.nlm.nih.gov/"

public let myDefaultTextFontSize = CGFloat(24.0)
public let myDefaultTextFieldHeight = CGFloat(myDefaultTextFontSize + (myDefaultTextFontSize * 0.66))
public let myListIndent = CGFloat(20.0)

let backgroundImage = UIImageView(frame: UIScreen.main.bounds)

public let pickerData = [
		["Orange" , "Purple" , "Green", "White", "Pink"],
		["Diamond","Circle","Square","Triangle","Rectangle"]
	]

public let myDefaultImage = UIImage(named: "250x250placeholder.png")!



class PillSearchViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

	var userColor: String!
	var userShape: String!
	var userImprint: String!

	// set up view layout
	var north:  UIView!
	var south: 	UIView!

	var northFrame: CGRect {
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115),width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2)
	}
	
	var southFrame: CGRect {
		return CGRect(x: (screenWidth * 0.05), y: (screenHeight/1.9), width: (screenWidth * 0.90), height: (screenHeight * 0.9)/2)
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
		
		//showFrames()
		
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
		}
		dismiss(animated: true, completion: nil)
	}
	
	@objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
	func setMyBackgroundImage(img:String) {
		backgroundImage.image = UIImage(named: img)
		backgroundImage.contentMode = UIView.ContentMode.scaleToFill
		self.view.insertSubview(backgroundImage, at: 0)
	}

	//MARK - Color and Shape Picker Instance Methods
	func updateLabels(){

		//let color = pickerData[0][pickerView.selectedRow(inComponent: 0)]
		//let shape = pickerData[1][pickerView.selectedRow(inComponent: 1)]
		
		self.userColor = pickerData[0][pickerView.selectedRow(inComponent: 0)]
		self.userShape = pickerData[1][pickerView.selectedRow(inComponent: 1)]

		self.colorLabel.text = ("Color:\t\t" + userColor)
		self.shapeLabel.text = ("Shape:\t\t" + userShape)

	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.south.frame = self.southFrame
		self.north.frame = self.northFrame

		//setMyBackgroundImage(img:"background.png")

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
		self.north.addSubview(self.pillImageView)

		// ========================================  Set Up Picker Text Field
		self.pickerTextField = UITextField(frame: CGRect(x: myListIndent,y: ((self.south.frame.height) * 0.1), width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		self.pickerTextField.placeholder = "Color and Shape"
		self.pickerTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		//pickerTextField.layer.borderWidth = 2.0
		self.pickerTextField.borderStyle = UITextField.BorderStyle.roundedRect
		self.pickerTextField.delegate = self
		

		self.south.addSubview(self.pickerTextField)
		
		// ========================================  PILL IMPRINT TEXT FIELD
		self.imprintTextField = UITextField(frame: CGRect(x: myListIndent,y: ((self.south.frame.height)  * 0.3), width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		self.imprintTextField.placeholder = "Pill Imprint"
		self.imprintTextField.font = UIFont.systemFont(ofSize: CGFloat(myDefaultTextFontSize))
		//imprintTextField.layer.borderWidth = 2.0
		self.imprintTextField.borderStyle = UITextField.BorderStyle.roundedRect
		self.imprintTextField.autocorrectionType = UITextAutocorrectionType.no
		imprintTextField.delegate = self

		self.south.addSubview(self.imprintTextField)

		// ========================================  Set Up Submit Button
		submitButton = UIButton(frame: CGRect(x: myListIndent,y: ((self.south.frame.height/2)), width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		submitButton.layer.borderWidth = 2.0
		submitButton.setTitleColor(UIColor.black, for: .normal)
		submitButton.setTitleColor(UIColor.lightGray, for: .disabled)
		submitButton.setTitleColor(UIColor.white, for: .highlighted)
		submitButton.setTitle("Submit", for: .normal)
		submitButton.titleLabel?.font =  UIFont.systemFont(ofSize: myDefaultTextFontSize, weight: .light)
		submitButton.addTarget(self, action: #selector(submitButtonTapped), for: .touchUpInside)
		//submitButton.isEnabled = false

		self.south.addSubview(submitButton)
		
		// ========================================  PILL PARAMETERS SEARCH DISPLAY
		self.colorLabel = UILabel(frame: CGRect(x: myListIndent,y: (self.south.frame.height/2) * 1.2, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		self.colorLabel.text = "Color:"
		

		self.shapeLabel = UILabel(frame: CGRect(x: myListIndent,y: (self.south.frame.height/2) * 1.4, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		self.shapeLabel.text = "Shape:"

		self.imprintLabel = UILabel(frame: CGRect(x: myListIndent,y: (self.south.frame.height/2) * 1.6, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		self.imprintLabel.text = "Imprint:"

		self.searchLabel = UILabel(frame: CGRect(x: myListIndent,y: (self.south.frame.height/2) * 1.8, width: (self.south.frame.width * 0.90), height: myDefaultTextFieldHeight))
		self.searchLabel.text = "Search Request:"

		// self.south.addSubview(colorLabel)
		// self.south.addSubview(shapeLabel)
		// self.south.addSubview(imprintLabel)
		
	}
	
	func updateImprintLabel() {

		self.userImprint =  self.imprintTextField.text
		if (self.userImprint != nil) {
			self.imprintLabel.text = "Imprint:\t" + self.userImprint
		}
		
	}

	//Calls this function when the tap is recognized.
	@objc func dismissKeyboard() {
	    
	    //Causes the view (or one of its embedded text fields) to resign the first responder status.
		self.updateImprintLabel()
	    self.view.endEditing(true)
	}
	
	func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
		updateImprintLabel()
		self.view.endEditing(true)
		return true
	}
	
	func submit() {

		guard let color = userColor else {
			print("No color to submit")
			return
		}
		
		guard let shape = userShape else {
			print("No shape to submit")
			return
		}

		// guard let imprint = userImprint else {
		// 	print("No imprint to submit")
		// 	return
		// }

		// Array & Dictionary
		//let json: JSON =  ["color": color, "shape": shape]
		//print(json)
		
		sendToServer(color: color, shape: shape)
	}
	
	func sendToServer(color: String, shape: String) {
		
		Alamofire.request(baseUrl+"api/rximage/1/rxnav?color="+color+"&shape="+shape+"").responseJSON { response in

			if let jsonObject = response.result.value {
				let json = JSON(jsonObject)

				// look up by key
				//print(json["nlmRxImages"])
				//print(json["replyStatus"])

				if (json["replyStatus"]["success"] == true)  {
					//print(json["replyStatus"])

					if (json["replyStatus"]["totalImageCount"] >= 1) {
						// if items are more than one segue to swipeable list  (tinder UI sort of)
						print(json)

					}// end if more than one item

				}

				// If json is .Dictionary
				// for (key,subJson):(String, JSON) in json["nlmRxImages"][0] {
				// 	// Do something you want
				// 	print(key,":\t","\tValue:",  subJson)
				// }
				
			}
		}

		
	}

	@objc func submitButtonTapped() {
		
		submit()

		// self.view.addSubview(colorLabel)
		// self.view.addSubview(shapeLabel)
		// self.view.addSubview(imprintLabel)
		// self.view.addSubview(searchLabel)

		self.north.removeFromSuperview()
		self.south.removeFromSuperview()

	}// end upload button action

	func showFrames() {
		// Do any additional setup after loading the view
		self.south.backgroundColor = .yellow
		self.north.backgroundColor = .green
	}
	
}// end view controller class definition

