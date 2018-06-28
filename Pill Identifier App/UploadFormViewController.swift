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
	var imageViewButton:		UIButton!
	var pickColorBtn:	UIButton!
	var pickShapeBtn:  	UIButton!
	var pickImprintBtn:	UIButton!
	var choosePictureBtn:	UIButton!
	var sampleTextField: UITextField!
	var submitButton: 	UIButton!
	
	var myTextField: UITextField!
	
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
		
		// ============================  Set Up PICK IMPRINT Button
		pickImprintBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		pickImprintBtn.layer.borderWidth = 2.0
		pickImprintBtn.setTitleColor(UIColor.black, for: .normal)
		pickImprintBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		pickImprintBtn.setTitleColor(UIColor.white, for: .highlighted)
		pickImprintBtn.setTitle("Pill Imprint", for: .normal)
		pickImprintBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		pickImprintBtn.addTarget(
			self,
			action: #selector(pickImprintBtnTapped),
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
		
		//submitButton.isEnabled = false

		// Create UITextField
		let myTextField: UITextField = UITextField(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		
		// Set UITextField placeholder text
		myTextField.placeholder = "Enter Pill Imprint"
		myTextField.clearsOnBeginEditing = true
		myTextField.delegate = self
		
		// Set text to UItextField
		//myTextField.text = "Enter Imprint"
		myTextField.textAlignment = .center
		
		// Set UITextField border style
		myTextField.borderStyle = UITextField.BorderStyle.line
		myTextField.layer.borderWidth = 2.0
		
		// Set UITextField background colour
		//myTextField.backgroundColor = UIColor.clear
		myTextField.backgroundColor = UIColor.white
		//myTextField.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
		// Set UITextField text color
		myTextField.textColor = UIColor.black
		
		// Add UITextField as a subview
		north.addSubview(myTextField)
		
		
		

		
		// NORTH VIEW SET
		north.addSubview(choosePictureBtn)
		north.addSubview(pickColorBtn)
		north.addSubview(pickShapeBtn)
		//north.addSubview(pickImprintBtn)
		
		// SOUTH VIEW SET
		//south.addSubview(imageView)
		//south.addSubview(imageViewButton)
		south.addSubview(submitButton)

	}// end viewdidlayoutsubviews
	
	/*
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		//Color #3 - While touching outside the textField.
		if isDebugOn() {
			view.backgroundColor = UIColor.cyan
		}
		self.view.endEditing(true)
	}
	*/

	
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
	
	@objc func pickImprintBtnTapped(sender: UIButton) {
		showImprintActionSheet()
		//self.imprint = "Hello Imprint"
		//print("Imprint: " + self.imprint)
	}
	
	func submit() {

		guard let color = self.color else {
			print("No color to submit")
			return
		}
		
		guard let shape = self.shape else {
			print("No shape to submit")
			return
		}

		/*
		guard let imprint = self.imprint else {
			print("No imprint to submit")
			return
		}*/
		
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
		//performSegueToReturnBack()
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
		present(imagePicker, animated: true, completion: {
			//self.submitButton.isEnabled = true
		})
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
			choosePictureBtn.isEnabled = false
			choosePictureBtn.setImage(pickedImage, for: .normal)
			choosePictureBtn.imageView?.contentMode = .scaleAspectFill
		}
		dismiss(animated: true, completion: nil)
	}
	
	@objc func imagePickerControllerDidCancel(
		_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}// end imagepicker cancel
	
	func camera()
	{
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
	
	func photoLibrary()
	{
		
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
	
	func showImprintActionSheet() {
		
		let alertController = UIAlertController(
			title: "Pill Imprint",
			message: "",
			preferredStyle: UIAlertController.Style.alert)
		
		let saveAction = UIAlertAction(
			title: "Save",
			style: UIAlertAction.Style.default,
			handler: { alert -> Void in
				_ = alertController.textFields![0] as UITextField
		})
		
		let cancelAction = UIAlertAction(
			title: "Cancel",
			style: UIAlertAction.Style.default,
			handler: { (
				action : UIAlertAction!) -> Void in })
		alertController.addTextField { (textField : UITextField!) -> Void in
			textField.placeholder = "Enter Imprint Here"
		}
		
		alertController.addAction(saveAction)
		alertController.addAction(cancelAction)
		
		self.present(alertController, animated: true, completion: nil)
	}
	
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
				imageUrl: nlmRxImages[i]["imageUrl"].string
				//image: #imageLiteral(resourceName: "250x250placeholder")
			))
			i = i + 1
		}

		//resultsTableViewController.arrayOfCellData = cellArray
		
		self.present(
			resultsTableViewController,
			animated: true,
			completion: {})
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

