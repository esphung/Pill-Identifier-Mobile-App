// 88   88 88""Yb 88      dP"Yb     db    8888b.
// 88   88 88__dP 88     dP   Yb   dPYb    8I  Yb
// Y8   8P 88"""  88  .o Yb   dP  dP__Yb   8I  dY
// `YbodP' 88     88ood8  YbodP  dP""""Yb 8888Y"

import UIKit.UIViewController

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
		setNavigationBar()
		/*
		//Looks for single or multiple taps.
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(
			target: self,
			action: #selector(
				UploadFormViewController.dismissKeyboard))
		
		view.addGestureRecognizer(tap)
		*/

	}// end view did load
	
	@objc func doneTapped() {
		print("Hello Done")
	}
	
	@objc func imageButtonTapped(_ sender: Any) {
		importImage()

		
	}// end upload button action


	@objc func backAction() -> Void {
		performSegueToReturnBack()
	}
	
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
			//makeDisplayImage(image: pickedImage)
			//pillImageView.image = pickedImage
		}
		dismiss(animated: true, completion: nil)
	}
	
	@objc func imagePickerControllerDidCancel(
		_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		south.frame = self.southFrame
		north.frame = self.northFrame

		// ====================================  Take Picture Button
		takePictureBtn = UIButton(frame: CGRect(
			x: myListIndent,
			y: ((south.frame.height)  * 0.0),
			width: (south.frame.width * 0.90),
			height: myDefaultTextFieldHeight))
		takePictureBtn.layer.borderWidth = 2.0
		takePictureBtn.setTitleColor(UIColor.black, for: .normal)
		takePictureBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		takePictureBtn.setTitleColor(UIColor.white, for: .highlighted)
		takePictureBtn.setTitle("Take a Picture", for: .normal)
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
				height: north.frame.height * 0.7))
		imageBtn.layer.borderWidth = 2.0
		imageBtn.setTitleColor(UIColor.black, for: .normal)
		imageBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		imageBtn.setTitleColor(UIColor.white, for: .highlighted)
		imageBtn.setTitle("Pick Image", for: .normal)
		imageBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: myDefaultTextFontSize,
			weight: .light)
		imageBtn.addTarget(
			self,
			action: #selector(self.imageButtonTapped),
			for: .touchUpInside)
		north.addSubview(imageBtn)
	
		// ====================  set up PILLImageVIEW (NORTH VIEW)
		// ============ load image
		imageName = "250x250placeholder.jpg"
		image = UIImage(named: imageName)
		imageView = makeDisplayImage(image: image)
		north.addSubview(imageView)
		
		/*
		pillImageView = UIImageView(frame: CGRect(
			x: myListIndent,
			y: myListPadTop,
			width: north.frame.width * 0.9,
			height: north.frame.height * 0.7))
		*/
		//north.addSubview(pillImageView)
		
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
			action: #selector(pickColorBtnTapped),
			for: .touchUpInside)
		
		south.addSubview(pickImprintBtn)

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

		south.addSubview(submitButton)

	}

	@objc func takePictureBtnTapped(){
	}
	
	@objc func pickColorBtnTapped(){
	}

	@objc func pickShapeBtnTapped(){
	}

	//Calls this function when the tap is recognized.
	@objc func dismissKeyboard() {
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

		guard let imprint = imprint else {
			print("No imprint to submit")
			return
		}
		
		print(color)
		print(shape)
		print(imprint)

	}

	@objc func submitButtonTapped(){
		performSegueToReturnBack()

		//submit()

	}// end upload button action
	
}// end view controller class definition

