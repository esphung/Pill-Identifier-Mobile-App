// .dP"Y8 888888    db    88""Yb  dP""b8 88  88 Yb    dP 88 888888 Yb        dP
// `Ybo." 88__     dPYb   88__dP dP   `" 88  88  Yb  dP  88 88__    Yb  db  dP
// o.`Y8b 88""    dP__Yb  88"Yb  Yb      888888   YbdP   88 88""     YbdPYbdP
// 8bodP' 888888 dP""""Yb 88  Yb  YboodP 88  88    YP    88 888888    YP  YP

import ActionSheetPicker_3_0
import SwiftyJSON
import Alamofire

class SearchViewController:
NorthSouthViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
UITextFieldDelegate {

	// cases to search for
	enum Search {
		case nameParam
		case shapeParam
		case colorParam
		case rxcuiParam
		case imprintParam
		case scoreParam
		case limitParam
	}

	// view vars
	var baseUrl = "http://rximage.nlm.nih.gov/api/rximage/1/rxnav?"

	// search types
	var nameParam = Search.nameParam
	var rxcuiParam = Search.rxcuiParam
	var colorParam = Search.colorParam
	var shapeParam = Search.shapeParam
	var imprintParam = Search.imprintParam
	var scoreParam = Search.scoreParam
	var limitParam  = Search.limitParam
	
	// handling
	var url: 		URL!

	// search params
	var name: 		String!
	var color: 		String!
	var shape: 		String!
	var imprint: 	String!
	var rxcui: 		Int!
	var score:		Int!
	var limit: 		Int!

	// ui buttons
	var pickColorBtn:		UIButton!
	var pickShapeBtn:  		UIButton!
	var pickPictureBtn:		UIButton!
	var pickImprintBtn: 	UIButton!
	var pickScoreBtn:		UIButton!
	var submitButton: 		UIButton!

	
	// input fields
	var pickImprintTextField: 	UITextField!
	var nameTextField: 	UITextField!

	// check vars
	var isChecked = 			true
	var isScored = 				false
	
	var middleBoxBtn = UIButton()
	var rightBoxBtn = UIButton()
	var leftBoxBtn = UIButton()


	override func loadView() {
		super.loadView()
		
		

		//Looks for single or multiple taps to dismiss keyboard
		let tap: UITapGestureRecognizer
		= UITapGestureRecognizer(
			target: self,
			action: #selector(dismissKeyboard))
		view.addGestureRecognizer(tap)

	}// end loadview
	
	override func viewDidLoad() {
		super.viewDidLoad()

		setNavigationBar(title: "Enter Pill Information")
		
		// ====  PICK PICTURE BUTTON
		pickPictureBtn = UIButton(frame: CGRect(
			x: 20,
			y: screenHeight * 0.025,
			width: screenWidth * 0.8,
			height: 44))
		pickPictureBtn.layer.borderWidth = 2.0
		pickPictureBtn.setTitleColor(UIColor.black, for: .normal)
		pickPictureBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		pickPictureBtn.setTitleColor(UIColor.white, for: .highlighted)
		pickPictureBtn.setTitle("Pick Picture", for: .normal)
		pickPictureBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		pickPictureBtn.addTarget(
			self,
			action: #selector(pickPictureBtnTapped),
			for: .touchUpInside)
		pickPictureBtn.isEnabled = false


		// ================================  Set Up PICK COLOR Button
		pickColorBtn = UIButton(frame: CGRect(
			x: 20,
			y: screenHeight * 0.125,
			width: screenWidth * 0.8,
			height: 44))
		pickColorBtn.layer.borderWidth = 2.0
		pickColorBtn.borderColor =  .black
		pickColorBtn.setTitleColor(UIColor.black, for: .normal)
		pickColorBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		pickColorBtn.setTitleColor(UIColor.white, for: .highlighted)
		pickColorBtn.setTitle("Pick Color", for: .normal)
		pickColorBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		pickColorBtn.addTarget(
			self,
			action: #selector(pickColorBtnTapped),
			for: .touchUpInside)

		// ================================  Set Up PICK SHAPE Button
		pickShapeBtn = UIButton(frame: CGRect(
			x: 20,
			y: screenHeight * 0.225,
			width: screenWidth * 0.8,
			height: 44))
		pickShapeBtn.layer.borderWidth = 2.0
		pickShapeBtn.borderColor = .black
		pickShapeBtn.setTitleColor(UIColor.black, for: .normal)
		pickShapeBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		pickShapeBtn.setTitleColor(UIColor.white, for: .highlighted)
		pickShapeBtn.setTitle("Pick Shape", for: .normal)
		pickShapeBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		pickShapeBtn.addTarget(
			self,
			action: #selector(pickShapeBtnTapped),
			for: .touchUpInside)
		
		
		// ==================================== Create UITextField
		pickImprintTextField = UITextField(frame: CGRect(
			x: (screenWidth/2) - 20,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8/2,
			height: 44))
		
		// Set UITextField placeholder text
		pickImprintTextField.placeholder = "Or Leave Blank"
		pickImprintTextField.clearsOnBeginEditing = true
		pickImprintTextField.delegate = self
		
		// Set text to UItextField
		//pickImprintTextField.text = "Enter Imprint"
		pickImprintTextField.textAlignment = .center
		
		// Set UITextField border style
		//pickImprintTextField.borderStyle = UITextField.BorderStyle.line
		pickImprintTextField.layer.borderWidth = 2.0
		pickImprintTextField.borderColor = .black
		
		// Set UITextField background colour
		//pickImprintTextField.backgroundColor = UIColor.clear
		pickImprintTextField.backgroundColor = UIColor.white
		//pickImprintTextField.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		pickImprintTextField.autocorrectionType  = .no
		pickImprintTextField.autocapitalizationType = .none
		pickImprintTextField.spellCheckingType = .no
		
		// Set UITextField text color
		pickImprintTextField.textColor = UIColor.black
		
		// ==================================== PICK IMPRINT BUTTON
		pickImprintBtn = UIButton(frame: CGRect(
			x: 20,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8/2,
			height: 44))
		pickImprintBtn.layer.borderWidth = 2.0
		pickImprintBtn.borderColor = .black
		pickImprintBtn.setTitleColor(UIColor.black, for: .normal)
		pickImprintBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		pickImprintBtn.setTitleColor(UIColor.white, for: .highlighted)
		pickImprintBtn.setTitle("Any Imprint ✓", for: .normal)
		pickImprintBtn.setTitleColor(.green, for: .normal)
		pickImprintBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		pickImprintBtn.addTarget(
			self,
			action: #selector(pickImprintBtnTapped),
			for: .touchUpInside)
		
		// PICK SCORE BUTTON
		pickScoreBtn = UIButton(frame: CGRect(
			x: 20,
			y: screenHeight * 0.425,
			width: screenWidth * 0.8,
			height: 44))
		pickScoreBtn.layer.borderWidth = 2.0
		pickScoreBtn.setTitleColor(UIColor.black, for: .normal)
		pickScoreBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		pickScoreBtn.setTitleColor(UIColor.white, for: .highlighted)
		pickScoreBtn.setTitle("Pick Scores (Max)", for: .normal)
		pickScoreBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		pickScoreBtn.addTarget(
			self,
			action: #selector(pickScoreBtnTapped),
			for: .touchUpInside)
		

		// SUBMIT BUTTON
		submitButton = UIButton(frame: CGRect(
			x: screenWidth * 0.8 * 0.333 - 20,
			y: screenHeight * 0.725,
			width: screenWidth * 0.8 * 0.666,
			height: 44))
		submitButton.setTitleColor(UIColor.black, for: .normal)
		submitButton.setTitleColor(UIColor.lightGray, for: .disabled)
		submitButton.setTitleColor(UIColor.white, for: .highlighted)
		submitButton.setTitle("Search Pills", for: .normal)
		submitButton.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		
		submitButton.borderWidth = 1.0
		submitButton.borderColor = .lightGray
		submitButton.addTarget(
			self,
			action: #selector(submitButtonTapped),
			for: .touchUpInside)
		
		// NORTH VIEW SET
		north.addSubview(pickPictureBtn)
		pickPictureBtn.isEnabled = false

		north.addSubview(pickImprintBtn)
		north.addSubview(pickImprintTextField)
		
		//north.addSubview(pickScoreBtn)
		//pickScoreBtn.isEnabled = false
		
		north.addSubview(pickColorBtn)
		north.addSubview(pickShapeBtn)
		
		//north.addSubview(submitButton)
		
		north.addSubview(getSampleLabel())

		//let msgLbl = headerMsg(
		//	msg: "Images provided by National Library Medicine")
		//north.addSubview(msgLbl)

		let copyright = copyrightLabel()
		myView.addSubview(copyright)
		
	}// end view did load
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		//south.frame = self.southFrame
		north.frame = self.northFrame

		// LEFT BOX BUTTON  (LEFT)
		leftBoxBtn =  UIButton(frame: CGRect(
			x: (screenWidth * 0),
			y: screenHeight * 0.65,
			width: 110,
			height: 110))
		//submitButton.layer.borderWidth = 0.0
		leftBoxBtn.setTitleColor(UIColor.black, for: .normal)
		leftBoxBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		leftBoxBtn.setTitleColor(UIColor.white, for: .highlighted)
		leftBoxBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		
		leftBoxBtn.borderWidth = 1.0
		leftBoxBtn.borderColor = .lightGray
		leftBoxBtn.addTarget(
			self,
			action: #selector(leftBoxBtnTapped),
			for: .touchUpInside)
		leftBoxBtn.setTitle("Shape", for: .normal)
		//leftBoxBtn.setImage(UIImage(named: "250x250placeholder.png"), for: .normal)
		
		north.addSubview(leftBoxBtn)
		
		
		// WIKIPEDIA PAGE BUTTON  (MIDDLE)
		middleBoxBtn =  UIButton(frame: CGRect(
			x: (screenWidth) * 0.3,
			y: screenHeight * 0.65,
			width: 110,
			height: 110))
		middleBoxBtn.setTitleColor(UIColor.black, for: .normal)
		middleBoxBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		middleBoxBtn.setTitleColor(UIColor.white, for: .highlighted)
		
		middleBoxBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		
		middleBoxBtn.borderWidth = 1.0
		middleBoxBtn.borderColor = .lightGray
		middleBoxBtn.addTarget(
			self,
			action: #selector(middleBoxBtnTapped),
			for: .touchUpInside)
		middleBoxBtn.setTitle("Submit", for: .normal)
		//middleBoxBtn.setImage(UIImage(named: "250x250placeholder.png"), for: .normal)
		
		north.addSubview(middleBoxBtn)
		
		// RIGHT BOX BUTTON  (RIGHT)
		rightBoxBtn =  UIButton(frame: CGRect(
			x: screenWidth * 0.6,
			y: screenHeight * 0.65,
			width: 110,
			height: 110))
		rightBoxBtn.setTitleColor(UIColor.black, for: .normal)
		rightBoxBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		rightBoxBtn.setTitleColor(UIColor.white, for: .highlighted)
		rightBoxBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		
		rightBoxBtn.borderWidth = 1.0
		rightBoxBtn.borderColor = .lightGray
		rightBoxBtn.addTarget(
			self,
			action: #selector(rightBoxBtnTapped),
			for: .touchUpInside)
		rightBoxBtn.setTitle("Color", for: .normal)
		//rightBoxBtn.setImage(UIImage(named: "250x250placeholder.png"), for: .normal)
		
		north.addSubview(rightBoxBtn)
		
	}// end layouts did load
	
	@objc func leftBoxBtnTapped(){
		pickShapeBtnTapped(sender: pickShapeBtn)
	}
	
	@objc func middleBoxBtnTapped() {
		submitButtonTapped()
	}

	@objc func rightBoxBtnTapped() {
		pickColorBtnTapped(sender: pickColorBtn)
	}
	
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
		if pickImprintTextField.isEnabled {
			pickImprintTextField.isEnabled = false
			pickImprintTextField.text = ""
			self.imprint = pickImprintTextField.text!
			
			
		}  else {
			pickImprintTextField.isEnabled = true
			pickImprintTextField.text = ""
			self.imprint = pickImprintTextField.text!
			
		}
	}
	

	// when user hits return key on keyboard
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		//print(textField.text!)
		
		
		if  (textField == pickImprintTextField) {
			self.imprint = textField.text!
			//print("Imprint: " + self.imprint!)
			
			if textField.text! ==  "" {
				setIsChecked(bool: true)
				pickImprintBtn.setTitle("Any Imprint ✓", for: .normal)
				pickImprintBtn.setTitleColor(.green, for: .normal)
			} else {
				setIsChecked(bool: true)
				pickImprintBtn.setTitle("Imprint ✓", for: .normal)
				pickImprintBtn.setTitleColor(.green, for: .normal)
			}
		}
		
		if (textField  == nameTextField) {
			self.name = textField.text!
			textField.textColor = .green
		}
		
		print(textField.text!)
		
		textField.resignFirstResponder()
		return true
	}
	
	@objc func pickPictureBtnTapped(){
		showImageActionSheet()
	}
	
	@objc func pickColorBtnTapped(sender: UIButton){
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick Color",
			rows: [
				colors
			],
			initialSelection: [0],
			doneBlock: {
				picker, indexes, values in
				//print("color = \(values!)")
				//print("indexes = \(indexes!)")
				let value = colors[indexes?.first as! Int]
				self.color = String(value).uppercased()
				
				let txt = ("Color: " + self.color  + " ✓").capitalized
				self.rightBoxBtn.setImage(UIImage(named: "250x250placeholder.png"), for: .normal)
				//print(txt)
				
				sender.setTitle(txt,for: .normal)
				sender.setTitleColor(.green, for: .normal)
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
				
				let txt = ("Shape: " + self.shape + " ✓").capitalized
				self.leftBoxBtn.setImage(UIImage(named: "250x250placeholder.png"), for: .normal)
				//print(txt)
				
				sender.setTitle(txt,for: .normal)
				sender.setTitleColor(.green, for: .normal)
				//sender.isEnabled = false
				
				return
		},
			cancel: {ActionMultipleStringCancelBlock in return },
			origin: sender)
	}// end pick shape
	
	
	@objc func pickScoreBtnTapped(){
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick Score",
			rows: [
				scores
			],
			initialSelection: [0],
			doneBlock: {
				picker, indexes, values in
				//print("shape = \(values!)")
				//print("indexes = \(indexes!)")
				let value = scores[indexes?.first as! Int]
				self.score = value
				
				let num = (self.score)
				//print(txt)
				
				if num == 1 {
					self.pickScoreBtn.setTitle("Score:\tI",for: .normal)
				}
				if num == 2 {
					self.pickScoreBtn.setTitle("Score:\tII",for: .normal)
				}
				if num == 3 {
					self.pickScoreBtn.setTitle("Score:\tIII",for: .normal)
				}
				if num == 4 {
					self.pickScoreBtn.setTitle("Score:\tIIII",for: .normal)
				}
				
				self.pickScoreBtn.borderColor =  .black
				self.pickScoreBtn.setTitleColor(.green, for: .normal)
				
				return
		},
			cancel: {ActionMultipleStringCancelBlock in return },
			origin: pickScoreBtn)
	}// end pick shape

	@objc func exitButtonTapped(){
		exit(0)
	}// end submit btn tapped
	
	@objc func submitButtonTapped(){
		submit()

	}// end submit btn tapped
	
	@objc func imageButtonTapped(_ sender: Any) {
		showImageActionSheet()
		//importImage()
	}// end upload pickImprintBtn action
	
	func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
		let size = image.size
		
		let widthRatio  = targetSize.width  / size.width
		let heightRatio = targetSize.height / size.height
		
		// Figure out what our orientation is, and use that to form the rectangle
		var newSize: CGSize
		if(widthRatio > heightRatio) {
			newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
		} else {
			newSize = CGSize(width: size.width * widthRatio,  height: size.height * widthRatio)
		}
		
		// This is the rect that we've calculated out and this is what is actually used below
		let rect = CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height)
		
		// Actually do the resizing to the rect using the ImageContext stuff
		UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
		image.draw(in: rect)
		let newImage = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		
		return newImage!
	}
	
	// MARK: - ImagePicker Delegate
	@objc func imagePickerController(
		_ picker: UIImagePickerController,
		didFinishPickingMediaWithInfo info: [
		UIImagePickerController.InfoKey : Any]) {
		dismiss(animated: false, completion: nil)
		self.pickPictureBtn.isEnabled = false
		
		//  COMPLETELY BROKEN
		
		/*
		let image = info[UIImagePickerController.InfoKey.originalImage]
		self.imageView = makeDisplayImage(image: image as! UIImage)
		
		pickPictureBtn.setTitle(("Picture: Selected").uppercased(), for: .normal)
		pickPictureBtn.setImage(image as? UIImage, for: .normal)
		pickPictureBtn.removeFromSuperview()
		
		pickShapeBtn.removeFromSuperview()
		pickColorBtn.removeFromSuperview()
		pickScoreBtn.removeFromSuperview()
		pickImprintBtn.removeFromSuperview()
		pickImprintTextField.removeFromSuperview()
		
		self.north.addSubview(imageView)
		self.navigationItem.leftBarButtonItem?.isEnabled = false

		self.submitButton.setTitle("Feature Coming Soon", for: .normal)
		self.submitButton.addTarget(
			self,
			action: #selector(rightButtonTapped),
			for: .touchUpInside)
		
		//imageView.borderColor  = .black
		//imageView.borderWidth = 1.0
		
		dismiss(animated: false, completion: nil)
		*/
		
		/*
		if let pickedImage = info[
			UIImagePickerController.InfoKey.originalImage] as? UIImage {
			imageView.image  = pickedImage
			//submitButton.isEnabled = true
			pickPictureBtn.setTitle(
				("Picture: Selected").uppercased(), for: .normal)
			pickPictureBtn.setImage(pickedImage, for: .normal)
			pickPictureBtn.imageView?.contentMode = .scaleAspectFill
		}
		*/
		
	}
	
	@objc func imagePickerControllerDidCancel(
		_ picker: UIImagePickerController) {
		dismiss(animated: false, completion: nil)
	}// end imagepicker cancel
	
	@objc func pickImprintBtnTapped(_ sender: UIButton) {
		toggleIsChecked()
		toggleImprintField()
		if hasImprint(sender: sender) {
			self.imprint = ""
			//print("Imprint: " + self.imprint!)
		} else {
			self.imprint = "no-imprint"
			//print("Imprint: " + self.imprint!)
		}
	}
	
	func hasImprint(sender: UIButton) -> Bool {
		if isChecked {
			sender.setTitle("Any Imprint ✓", for: .normal)
			sender.setTitleColor(.green, for: .normal)
			pickImprintTextField.placeholder = "Enter Imprint"
			imprint = ""
			//pickImprintTextField.isHidden = false
			return true
		} else {
			sender.setTitle("No Imprint X", for: .normal)
			sender.setTitleColor(.red, for: .normal)
			pickImprintTextField.placeholder = ""
			//pickImprintTextField.isHidden = true
			imprint = "no-imprint"
			
			return false
		}
	}


	
	func submit() {
		var url = baseUrl
		
		// check color
		if (color != nil) && (color.isEmpty == false) {
			url = url + getSearchUrlString(find: colorParam, str: color)
		} else {
			color = ""
		}
		
		// check shape
		if (shape != nil) && (shape.isEmpty == false) {
			url = url + getSearchUrlString(find: shapeParam, str: shape)
		} else {
			shape = ""
		}
		
		// check imprint
		if (imprint != nil) && (imprint.isEmpty == false) {
			url = url + getSearchUrlString(find: imprintParam, str: String(imprint))
		} else {
			imprint  = ""
		}

		// check score
		if (score != nil) && (score > 0 && score <= 4) {
			// contains score input [1,2,3,4]
			url = url + getSearchUrlString(find: scoreParam, str: String(score))
		}
		
		// check name
		//guard let name = self.nameTextField.text else { return }
		if (name != nil) && (name.isEmpty == false) {
			// contains score input [1,2,3,4]
			url = url + getSearchUrlString(find: nameParam, str: name)
		} else {
			name = ""
		}
		
		// check limit
		if (limit != nil) {
			url = url + getSearchUrlString(find: colorParam, str: color) // "&rLimit="
		}



		//print(getSearchUrlString(find: rxcuiParam, str: "198429"))// rxcuiParam
		
		
		// final url to be sent off
		print(url)
		//middleBoxBtn.setImage(UIImage(named: "250x250placeholder.png"), for: .normal)

		
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
					self.middleBoxBtn.setImage(UIImage(named: "250x250placeholder.png"), for: .normal)
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
				animated: false,
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
			self.present(myPickerController, animated: false, completion: {
				print("Acessing Photo Library...")
			})
		}
	}// end photolibrary
	
	func importImage() {
		let imagePicker = UIImagePickerController()
		imagePicker.delegate = self
		imagePicker.allowsEditing = false
		imagePicker.sourceType = .photoLibrary
		present(imagePicker, animated: false, completion: nil)
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
		
		self.present(actionSheet, animated: false, completion: nil)
	}// end show actionsheet
	
	func displayResultsPage(json: JSON) {
		let resultsTableViewController: ResultsTableViewController
		= storyboard?.instantiateViewController(withIdentifier:
			"resultsTableViewController") as! ResultsTableViewController
		
		let nlmRxImages = json["nlmRxImages"].array!
		
		// set new cell data in cell array for results page
		var i = 0
		while i < nlmRxImages.count {
			print(nlmRxImages[i]["rxcui"].int!)
			resultsTableViewController.arrayOfCellData.append(
				CellDataClass(
					cell: i,
					name: nlmRxImages[i]["name"].string!,
					image: "250x250placeholder",
					//image: #imageLiteral(resourceName: "250x250placeholder"),
					imageUrl: nlmRxImages[i]["imageUrl"].string!,
					color: 		color,
					shape: 		shape,
					imprint: 	imprint,
					rxcui: 		nlmRxImages[i]["rxcui"].int!,
					score:		0,
					limit:	 	0
			))
			i = i + 1
		}
		
		self.present(
			resultsTableViewController,
			animated: false,
			completion: nil)
	}
	
	@objc func dismissKeyboard() {
		view.endEditing(true)
	}
	
	func textFieldDidBeginEditing(_ textField: UITextField) {
		textField.autocapitalizationType = UITextAutocapitalizationType.none
	}
	
	let ACCEPTABLE_CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_"
	
	func checkCount(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		// only works for imprint field
		guard let text = textField.text else { return true }
		let newLength = text.count + string.count - range.length
		return newLength >= 10 // Bool
	}
	
	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		
		let isMaxLength = checkCount(textField, shouldChangeCharactersIn: range, replacementString: string)
		if isMaxLength == true {
			// cut off user input
			textField.isUserInteractionEnabled = false
		}
		/*
		guard let text = textField.text else { return true }
		let newLength = text.count + string.count - range.length
		return newLength <= 10 // Bool
		*/
		
		let cs = NSCharacterSet(charactersIn: ACCEPTABLE_CHARACTERS).inverted
		let filtered = string.components(separatedBy: cs).joined(separator: "")
		
		// let user edit again
		textField.isUserInteractionEnabled = true
		return (string == filtered)
	}
	

	func getSampleLabel() -> UITextField {
		
		nameTextField = UITextField(frame: CGRect(
			x: 20,
			y: screenHeight * 0.425,
			width: screenWidth * 0.8,
			height: 44))
		nameTextField.placeholder = "Enter Pill Name"
		nameTextField.textAlignment  = .center
		//nameTextField.font = UIFont.systemFont(ofSize: 15)
		//nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
		nameTextField.borderColor  = .black
		nameTextField.borderWidth  = 2.0
		nameTextField.autocorrectionType = UITextAutocorrectionType.no
		//nameTextField.keyboardType = UIKeyboardType.default
		nameTextField.returnKeyType = UIReturnKeyType.done
		nameTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
		nameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		
		
		nameTextField.delegate = self// when return key pressed, do sumthing
		
		return nameTextField
		// needs input validated
	}


	func getSearchUrlString(find: Search, str: String) -> String {
		var url = ""

		// tell me what to do in each case
		switch find {
			case .nameParam:
			url = "&name=" + str.lowercased()

			case .shapeParam:
			url = "&shape=" + str.lowercased()

			case .colorParam:
			url = "&color=" + str.lowercased()

			case .rxcuiParam:
			url = "&rxcui=" + str

			case .imprintParam:
			url = "&imprint=" + str.lowercased()

			case .scoreParam:
			url = "&score=" + str

			case .limitParam:
			url = "&limit=" + str
		}

		return url
	}


}// end view controller class definition

extension UIView {
	
	@IBInspectable var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set {
			layer.cornerRadius = newValue
			layer.masksToBounds = newValue > 0
		}
	}
	
	@IBInspectable var borderWidth: CGFloat {
		get {
			return layer.borderWidth
		}
		set {
			layer.borderWidth = newValue
		}
	}
	
	@IBInspectable var borderColor: UIColor? {
		get {
			return UIColor(cgColor: layer.borderColor!)
		}
		set {
			layer.borderColor = newValue?.cgColor
		}
	}
}
