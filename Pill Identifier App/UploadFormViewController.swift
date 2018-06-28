// 88   88 88""Yb 88      dP"Yb     db    8888b.
// 88   88 88__dP 88     dP   Yb   dPYb    8I  Yb
// Y8   8P 88"""  88  .o Yb   dP  dP__Yb   8I  dY
// `YbodP' 88     88ood8  YbodP  dP""""Yb 8888Y"

import UIKit.UIViewController
import ActionSheetPicker_3_0
import SwiftyJSON
import Alamofire

class UploadFormViewController:
NorthSouthViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
UITextFieldDelegate {
	
	var color: String!
	var shape: String!
	var imprint: String!

	// pick buttons
	var imageViewButton:	UIButton!
	var pickColorBtn:		UIButton!
	var pickShapeBtn:  		UIButton!
	var choosePictureBtn:	UIButton!
	var sampleTextField: 	UITextField!
	var submitButton: 		UIButton!
	
	var imprintTextField: 	UITextField!
	
	override func loadView() {
		super.loadView()
		
		//Looks for single or multiple taps.
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UploadFormViewController.dismissKeyboard))
		
		//Uncomment the line below if you want the tap not not interfere and cancel other interactions.
		//tap.cancelsTouchesInView = false
		
		view.addGestureRecognizer(tap)

	}// end loadview
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setNavigationBar(title: "Enter Pill Information")
		
	}// end view did load
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		south.frame = self.southFrame
		north.frame = self.northFrame
		
		//self.color = " "
		//self.shape = " "
		//self.imprint  = "no-imprint"

		// ====================================  Choose Picture Button
		choosePictureBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.025,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		choosePictureBtn.layer.borderWidth = 2.0
		choosePictureBtn.setTitleColor(UIColor.black, for: .normal)
		choosePictureBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		choosePictureBtn.setTitleColor(UIColor.white, for: .highlighted)
		choosePictureBtn.setTitle("Choose a Picture", for: .normal)
		choosePictureBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		choosePictureBtn.addTarget(
			self,
			action: #selector(choosePictureBtnTapped),
			for: .touchUpInside)
		
		// ====================  set up IMAGE BUTTON (NORTH VIEW)
		imageViewButton =  UIButton(
			frame: CGRect(
				x: myListIndent,
				y: myListPadTop,
				width: north.frame.width * 0.9,
				height: north.frame.height * 0.9))
		imageViewButton.layer.borderWidth = 2.0
		imageViewButton.setTitleColor(UIColor.black, for: .normal)
		imageViewButton.setTitleColor(UIColor.lightGray, for: .disabled)
		imageViewButton.setTitleColor(UIColor.white, for: .highlighted)
		imageViewButton.setTitle("", for: .normal)
		imageViewButton.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		imageViewButton.addTarget(
			self,
			action: #selector(self.imageButtonTapped),
			for: .touchUpInside)
		
		imageName = "250x250placeholder.jpg"
		image = UIImage(named: imageName)
		imageView = makeDisplayImage(image: image)
		
		// ================================  Set Up PICK COLOR Button
		pickColorBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.125,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		pickColorBtn.layer.borderWidth = 2.0
		pickColorBtn.setTitleColor(UIColor.black, for: .normal)
		pickColorBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		pickColorBtn.setTitleColor(UIColor.white, for: .highlighted)
		pickColorBtn.setTitle("Pick Color", for: .normal)
		pickColorBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		pickColorBtn.addTarget(
			self,
			action: #selector(pickColorBtnTapped),
			for: .touchUpInside)

		// ================================  Set Up PICK SHAPE Button
		pickShapeBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.225,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		pickShapeBtn.layer.borderWidth = 2.0
		pickShapeBtn.setTitleColor(UIColor.black, for: .normal)
		pickShapeBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		pickShapeBtn.setTitleColor(UIColor.white, for: .highlighted)
		pickShapeBtn.setTitle("Pick Shape", for: .normal)
		pickShapeBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		pickShapeBtn.addTarget(
			self,
			action: #selector(pickShapeBtnTapped),
			for: .touchUpInside)

		// ====================================  Set Up Submit Button
		submitButton = UIButton(frame: CGRect(
			x: myListIndent,
			y: ((south.frame.height)  * 0.8),
			width: (south.frame.width * 0.90),
			height: myDefaultTextFieldHeight))
		submitButton.layer.borderWidth = 2.0
		submitButton.setTitleColor(UIColor.black, for: .normal)
		submitButton.setTitleColor(UIColor.lightGray, for: .disabled)
		submitButton.setTitleColor(UIColor.white, for: .highlighted)
		submitButton.setTitle("Submit", for: .normal)
		submitButton.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		submitButton.addTarget(
			self,
			action: #selector(submitButtonTapped),
			for: .touchUpInside)
		
		// Create UITextField
		let imprintTextField: UITextField = UITextField(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		
		// Set UITextField placeholder text
		imprintTextField.placeholder = "Enter Pill Imprint"
		imprintTextField.clearsOnBeginEditing = true
		imprintTextField.delegate = self
		
		// Set text to UItextField
		//imprintTextField.text = "Enter Imprint"
		imprintTextField.textAlignment = .center
		
		// Set UITextField border style
		imprintTextField.borderStyle = UITextField.BorderStyle.line
		imprintTextField.layer.borderWidth = 2.0
		
		// Set UITextField background colour
		//imprintTextField.backgroundColor = UIColor.clear
		imprintTextField.backgroundColor = UIColor.white
		//imprintTextField.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		imprintTextField.autocorrectionType  = .no
		imprintTextField.autocapitalizationType = .none
		imprintTextField.spellCheckingType = .no
		
		// Set UITextField text color
		imprintTextField.textColor = UIColor.black
		
		// Add UITextField as a subview
		north.addSubview(imprintTextField)
		
		// NORTH VIEW SET
		north.addSubview(choosePictureBtn)
		north.addSubview(pickColorBtn)
		north.addSubview(pickShapeBtn)
		
		// SOUTH VIEW SET
		//south.addSubview(imageView)
		//south.addSubview(imageViewButton)
		south.addSubview(submitButton)

	}// end viewdidlayoutsubviews

	// when user hits return key on keyboard
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		//print(textField.text!)
		self.imprint = textField.text!
		print(self.imprint!)
		textField.resignFirstResponder()
		return true
	}
	
	@objc func choosePictureBtnTapped(){
		showImageActionSheet()
	}
	
	@objc func pickColorBtnTapped(sender: UIButton){
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick Color",
			rows: [
				colors
			],
			initialSelection: [0, 0],
			doneBlock: {
				picker, indexes, values in
				//print("color = \(values!)")
				//print("indexes = \(indexes!)")
				let value = colors[indexes?.first as! Int]
				self.color = String(value).uppercased()
				
				let txt = "Color: " + self.color
				print(txt)
				
				sender.setTitle(txt,for: .normal)
				//sender.isEnabled = false
				
				return
		},
			cancel: {ActionMultipleStringCancelBlock in return },
			origin: sender)
	}// end pick color

	@objc func pickShapeBtnTapped(sender: UIButton){
		
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick Shape",
			rows: [
				shapes
			],
			initialSelection: [0],
			doneBlock: {
				picker, indexes, values in
				//print("shape = \(values!)")
				//print("indexes = \(indexes!)")
				let value = shapes[indexes?.first as! Int]
				self.shape = String(value).uppercased()
				
				let txt = ("Shape: " + self.shape)
				print(txt)
				sender.setTitle(txt,for: .normal)
				//sender.isEnabled = false
				
				return
		},
			cancel: {ActionMultipleStringCancelBlock in return },
			origin: sender)
	}// end pick shape
	
	func submit() {

		guard let color = self.color else {
			print("No color to submit")
			return
		}
		
		guard let shape = self.shape else {
			print("No shape to submit")
			return
		}

		// make http request string
		// http://rximage.nlm.nih.gov/api/{apiName}/{apiVersion}/{resourcePath}?{parameters}
		// http://rximage.nlm.nih.gov/api/rximage/1/rxnav?color=blue&size=17&sizeT=0
		
		var url = "http://rximage.nlm.nih.gov/api/" + "rximage/" + "1/" + "rxnav?"
		+ "color=" + color
		+ "&"
		+ "shape=" + shape
		
		if (imprint != nil) && (imprint.isEmpty == false) {
			url = url + "&" + "imprint=" + imprint
		}
		
		print(url)
		
		// get http request
		Alamofire.request(url).responseJSON { response in
			//print("Request: \(String(describing: response.request))")   // original url request
			if let json = response.result.value {
				//print("JSON: \(json)") // serialized json response
				let swiftyJsonVar = JSON(json)//  conert json response to swiftyJSON
				print(swiftyJsonVar["replyStatus"])
				
				// get results as pill array
				//print(swiftyJsonVar["nlmRxImages"])// list of pills
				
				// one or more pill found
				if swiftyJsonVar["replyStatus"]["totalImageCount"]  > 0 {
					// send pill array to results page here
					self.displayResultsPage(json: swiftyJsonVar)
				} else {
					// no results found
				}
				
			}
		}
		

	}// end submit

	@objc func submitButtonTapped(){
		submit()
	}// end upload button action
	
	@objc func imageButtonTapped(_ sender: Any) {
		showImageActionSheet()
		//importImage()
	}// end upload button action
	
	func importImage() {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .photoLibrary
		present(imagePicker, animated: true, completion: nil)
	}
	
	// MARK: - ImagePicker Delegate
	@objc func imagePickerController(
		_ picker: UIImagePickerController,
		didFinishPickingMediaWithInfo info: [
		UIImagePickerController.InfoKey : Any]) {
		
		if let pickedImage = info[
			UIImagePickerController.InfoKey.originalImage] as? UIImage {
			imageView.image  = pickedImage
			self.submitButton.isEnabled = true
			choosePictureBtn.setTitle(
				("Picture: Selected").uppercased(), for: .normal)
			choosePictureBtn.setImage(pickedImage, for: .normal)
			choosePictureBtn.imageView?.contentMode = .scaleAspectFill
		}
		dismiss(animated: true, completion: nil)
	}
	
	@objc func imagePickerControllerDidCancel(
		_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}// end imagepicker cancel
	
	func camera() {
		if UIImagePickerController.isSourceTypeAvailable(.camera){
			let myPickerController = UIImagePickerController()
			myPickerController.delegate = self;
			myPickerController.sourceType = .camera
			self.present(
				myPickerController,
				animated: true,
				completion: {
				print("Accessing Camera...")
			})
		}
	}// end camera
	
	func photoLibrary() {
		if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
			let myPickerController = UIImagePickerController()
			myPickerController.delegate = self;
			myPickerController.sourceType = .photoLibrary
			self.present(myPickerController, animated: true, completion: {
				print("Acessing Photo Library...")
			})
		}
	}// end photolibrary
	
	func showImageActionSheet() {
		let actionSheet = UIAlertController(
			title: nil,
			message: nil,
			preferredStyle: .actionSheet)
		
		actionSheet.addAction(UIAlertAction(
			title: "Camera",
			style: .default,
			handler: { (alert:UIAlertAction!) -> Void in
			self.camera()
		}))
		
		actionSheet.addAction(UIAlertAction(
			title: "Gallery",
			style: .default,
			handler: { (alert:UIAlertAction!) -> Void in
			self.photoLibrary()
		}))
		
		actionSheet.addAction(UIAlertAction(
			title: "Cancel",
			style: .cancel,
			handler: nil))
		
		self.present(actionSheet, animated: true, completion: nil)
	}// end show actionsheet
	
	func displayResultsPage(json: JSON) {
		let resultsTableViewController: ResultsTableViewController
		= storyboard?.instantiateViewController(withIdentifier:
			"resultsTableViewController") as! ResultsTableViewController
		
		let nlmRxImages = json["nlmRxImages"].array!
		
		// set new cell data in cell array for results page
		var i = 0
		while i < nlmRxImages.count {
			resultsTableViewController.arrayOfCellData.append(cellData(
				cell: i,
				text: nlmRxImages[i]["name"].string,
				image: #imageLiteral(resourceName: "250x250placeholder"),
				imageUrl: nlmRxImages[i]["imageUrl"].string,
				color: color,
				shape: shape,
				imprint: self.imprint
				//image: #imageLiteral(resourceName: "250x250placeholder")
			))
			i = i + 1
		}

		//resultsTableViewController.arrayOfCellData = cellArray

		self.present(
			resultsTableViewController,
			animated: true,
			completion: nil)
	}

	// Put this piece of code anywhere you like
	func hideKeyboardWhenTappedAround() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
		tap.cancelsTouchesInView = false
		view.addGestureRecognizer(tap)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}

}// end view controller class definition

