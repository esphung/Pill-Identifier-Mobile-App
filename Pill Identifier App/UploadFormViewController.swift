// 88   88 88""Yb 88      dP"Yb     db    8888b.
// 88   88 88__dP 88     dP   Yb   dPYb    8I  Yb
// Y8   8P 88"""  88  .o Yb   dP  dP__Yb   8I  dY
// `YbodP' 88     88ood8  YbodP  dP""""Yb 8888Y"

import UIKit.UIViewController
import ActionSheetPicker_3_0

class UploadFormViewController:
NorthSouthViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

	var color: String!
	var shape: String!
	var imprint: String!

	override func loadView() {
		super.loadView()
		
		
	}// end loadview
	
	// input variables
	var imageBtn:			UIButton!
	var submitButton: 		UIButton!

	// display vars
	var pillImageView:		UIImageView!
	var colorLabel: 		UILabel!
	var shapeLabel: 		UILabel!
	var imprintLabel:		UILabel!
	var searchLabel:		UILabel!
	
	// pick buttons
	var pickColorBtn:	UIButton!
	var pickShapeBtn:  	UIButton!
	var pickImprintBtn:	UIButton!
	var takePictureBtn:	UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()
		setNavigationBar(title: "Enter Pill Information")

	}// end view did load
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		south.frame = self.southFrame
		north.frame = self.northFrame

		// ====================================  Take Picture Button
		takePictureBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: ((south.frame.height)  * 0.0),
			width: (south.frame.width * 0.9),
			height: myDefaultTextFieldHeight))
		takePictureBtn.layer.borderWidth = 2.0
		takePictureBtn.setTitleColor(UIColor.black, for: .normal)
		takePictureBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		takePictureBtn.setTitleColor(UIColor.white, for: .highlighted)
		takePictureBtn.setTitle("Choose a Picture", for: .normal)
		takePictureBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		takePictureBtn.addTarget(
			self,
			action: #selector(takePictureBtnTapped),
			for: .touchUpInside)
		
		south.addSubview(takePictureBtn)

		// ====================  set up IMAGE BUTTON (NORTH VIEW)
		imageBtn =  UIButton(
			frame: CGRect(
				x: myListIndent,
				y: myListPadTop,
				width: north.frame.width * 0.9,
				height: north.frame.height * 0.9))
		imageBtn.layer.borderWidth = 2.0
		imageBtn.setTitleColor(UIColor.black, for: .normal)
		imageBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		imageBtn.setTitleColor(UIColor.white, for: .highlighted)
		imageBtn.setTitle("", for: .normal)
		imageBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		imageBtn.addTarget(
			self,
			action: #selector(self.imageButtonTapped),
			for: .touchUpInside)
		
		imageName = "250x250placeholder.jpg"
		image = UIImage(named: imageName)
		imageView = makeDisplayImage(image: image)
		
		north.addSubview(imageView)
		north.addSubview(imageBtn)
		
		// ================================  Set Up PICK SHAPE Button
		pickShapeBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: ((south.frame.height)  * 0.2),
			width: (south.frame.width * 0.90),
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
		
		south.addSubview(pickShapeBtn)
		
		// ================================  Set Up PICK COLOR Button
		pickColorBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: ((south.frame.height)  * 0.4),
			width: (south.frame.width * 0.90),
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
		
		south.addSubview(pickColorBtn)
		
		// ============================  Set Up PICK IMPRINT Button
		pickImprintBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: ((south.frame.height)  * 0.6),
			width: (south.frame.width * 0.90),
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
		submitButton.isEnabled = false

		south.addSubview(pickImprintBtn)
		south.addSubview(submitButton)

	}

	@objc func takePictureBtnTapped(){
		showActionSheet()
	}

	@objc func pickShapeBtnTapped(sender: UIButton){
		
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick a Shape",
			rows: [
				shapes
			],
			initialSelection: [0],
			doneBlock: {
				picker, indexes, values in
				//print("shape = \(values!)")
				//print("indexes = \(indexes!)")
				let value = shapes[indexes?.first as! Int]
				let txt = "SHAPE: " + String(value)
				print(txt)
				sender.setTitle(txt,for: .normal)
				sender.isEnabled = false
				
				return
		},
			cancel: {ActionMultipleStringCancelBlock in return },
			origin: sender)
	}// end pick shape
	
	@objc func pickColorBtnTapped(sender: UIButton){
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick a Color",
			rows: [
				colors
			],
			initialSelection: [0, 0],
			doneBlock: {
				picker, indexes, values in
				//print("color = \(values!)")
				//print("indexes = \(indexes!)")
				let value = colors[indexes?.first as! Int]
				let txt = "SHAPE: " + String(value)
				print(txt)
				sender.setTitle(txt,for: .normal)
				sender.isEnabled = false
				
				return
		},
			cancel: {ActionMultipleStringCancelBlock in return },
			origin: sender)
	}// end pick color

	func textFieldShouldReturn(_ scoreText: UITextField) -> Bool {
		self.view.endEditing(true)
		return true
	}
	
	@objc func pickImprintBtnTapped(sender: UIButton) {
		print("Imprint Button")
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

		guard let imprint = imprint else {
			print("No imprint to submit")
			return
		}
		
		print(color)
		print(shape)
		print(imprint)

	}

	@objc func submitButtonTapped(){
		//performSegueToReturnBack()

		//submit()

	}// end upload button action
	
	@objc func imageButtonTapped(_ sender: Any) {
		showActionSheet()
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
			takePictureBtn.setTitle("PICTURE: SELECTED", for: .normal)
			takePictureBtn.isEnabled = false
		}
		dismiss(animated: true, completion: nil)
	}
	
	@objc func imagePickerControllerDidCancel(
		_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
	func camera()
	{
		if UIImagePickerController.isSourceTypeAvailable(.camera){
			let myPickerController = UIImagePickerController()
			myPickerController.delegate = self;
			myPickerController.sourceType = .camera
			self.present(myPickerController, animated: true, completion: {
				print("Accessing Camera...")
			})
		}
		
	}
	
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
	}
	
	func showActionSheet() {
		let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
		
		actionSheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (alert:UIAlertAction!) -> Void in
			self.camera()
		}))
		
		actionSheet.addAction(UIAlertAction(title: "Gallery", style: .default, handler: { (alert:UIAlertAction!) -> Void in
			self.photoLibrary()
		}))
		
		actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
		
		self.present(actionSheet, animated: true, completion: nil)
	}


}// end view controller class definition


