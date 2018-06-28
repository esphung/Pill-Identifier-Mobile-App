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

	var imageViewButton:	UIButton!
	var pickColorBtn:		UIButton!
	var pickShapeBtn:  		UIButton!
	var choosePictureBtn:	UIButton!
	var sampleTextField: 	UITextField!
	var submitButton: 		UIButton!
	
	var isChecked = 		true
	var imprintButton: 		UIButton!
	var imprintTextField: 	UITextField!
	
	override func loadView() {
		super.loadView()
		//Looks for single or multiple taps.
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UploadFormViewController.dismissKeyboard))
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
		imprintTextField = UITextField(frame: CGRect(
			x: (screenWidth/2) - myListIndent,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8/2,
			height: myDefaultTextFieldHeight))
		
		// Set UITextField placeholder text
		imprintTextField.placeholder = "Enter Imprint"
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
		
		
		imprintButton = UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8/2,
			height: myDefaultTextFieldHeight))
		imprintButton.layer.borderWidth = 2.0
		imprintButton.setTitleColor(UIColor.black, for: .normal)
		imprintButton.setTitleColor(UIColor.lightGray, for: .disabled)
		imprintButton.setTitleColor(UIColor.white, for: .highlighted)
		imprintButton.setTitle("Any Imprint ✓", for: .normal)
		imprintButton.setTitleColor(.orange, for: .normal)
		imprintButton.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		imprintButton.addTarget(
			self,
			action: #selector(imprintButtonTapped),
			for: .touchUpInside)
		
		
		north.addSubview(imprintButton)
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

	
	func setIsChecked(bool: Bool){
		if bool {
			isChecked = true
		} else {
			isChecked = false
		}
	}
	
	func toggleIsChecked() {
		if isChecked {
			setIsChecked(bool: false)
		} else  {
			setIsChecked(bool: true)
		}
	}
	
	func toggleImprintField(){
		if imprintTextField.isEnabled {
			imprintTextField.isEnabled = false
			imprintTextField.text = ""
			self.imprint = imprintTextField.text!
			
			
		}  else {
			imprintTextField.isEnabled = true
			imprintTextField.text = ""
			self.imprint = imprintTextField.text!
			
		}
	}

	// when user hits return key on keyboard
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		//print(textField.text!)
		self.imprint = textField.text!
		print("Imprint: " + self.imprint!)
		
		if imprintTextField.text! ==  "" {
			setIsChecked(bool: true)
			imprintButton.setTitle("Any Imprint ✓", for: .normal)
			imprintButton.setTitleColor(.orange, for: .normal)
		} else {
			setIsChecked(bool: true)
			imprintButton.setTitle("Imprint ✓", for: .normal)
			imprintButton.setTitleColor(.green, for: .normal)
		}
		
		
		
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
	
	
	@objc func submitButtonTapped(){
		submit()
	}// end submit btn tapped
	
	@objc func imageButtonTapped(_ sender: Any) {
		showImageActionSheet()
		//importImage()
	}// end upload imprintButton action
	
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
	
	@objc func imprintButtonTapped(_ sender: UIButton) {
		toggleIsChecked()
		toggleImprintField()
		if hasImprint(sender: sender) {
			self.imprint = ""
			print("Imprint: " + self.imprint!)
		} else {
			self.imprint = "no-imprint"
			print("Imprint: " + self.imprint!)
		}
	}
	
	func hasImprint(sender: UIButton) -> Bool {
		if isChecked {
			sender.setTitle("Any Imprint ✓", for: .normal)
			sender.setTitleColor(.orange, for: .normal)
			return true
		} else {
			sender.setTitle("No Imprint X", for: .normal)
			sender.setTitleColor(.red, for: .normal)
			
			return false
		}
	}
	
	func submit() {
		
		// make http request string
		// http://rximage.nlm.nih.gov/api/{apiName}/{apiVersion}/{resourcePath}?{parameters}
		// http://rximage.nlm.nih.gov/api/rximage/1/rxnav?color=blue&size=17&sizeT=0
		
		var url = "http://rximage.nlm.nih.gov/api/" + "rximage/" + "1/" + "rxnav?"
		
		// check color
		if (color != nil) && (color.isEmpty == false) {
			url = url + "&color=" + color
		} else {
			color = ""
		}
		
		// check shape
		if (shape != nil) && (shape.isEmpty == false) {
			url = url + "&shape=" + shape
		} else {
			shape = ""
		}
		
		// check imprint
		if (imprint != nil) && (imprint.isEmpty == false) {
			url = url + "&imprint=" + imprint
		} else {
			// user chose "no imprint"
			//url = url + "&" + "imprint=" + "no-imprint"
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
	
	func importImage() {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .photoLibrary
		present(imagePicker, animated: true, completion: nil)
	}
	
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
		
		self.present(
			resultsTableViewController,
			animated: true,
			completion: nil)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}

}// end view controller class definition

