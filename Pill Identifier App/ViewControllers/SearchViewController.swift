// .dP"Y8 888888    db    88""Yb  dP""b8 88  88 Yb    dP 88 888888 Yb        dP
// `Ybo." 88__     dPYb   88__dP dP   `" 88  88  Yb  dP  88 88__    Yb  db  dP
// o.`Y8b 88""    dP__Yb  88"Yb  Yb      888888   YbdP   88 88""     YbdPYbdP
// 8bodP' 888888 dP""""Yb 88  Yb  YboodP 88  88    YP    88 888888    YP  YP

import ActionSheetPicker_3_0
import SwiftyJSON
import Alamofire

class BoxButton: UIButton {
	

	
	override init(frame: CGRect) {
        // set myValue before super.init is called
		
        super.init(frame: frame)
		

        // set other operations after super.init, if required
        //backgroundColor = .red
		//submitButton.layer.borderWidth = 0.0
		self.setTitleColor(UIColor.black, for: .normal)
		self.setTitleColor(UIColor.lightGray, for: .disabled)
		self.setTitleColor(UIColor.white, for: .highlighted)
		//self.titleLabel?.font =  UIFont.systemFont(ofSize: 16,weight: .light)
		
		self.borderWidth = 1.0
		self.borderColor = .lightGray

		self.addTarget(
			self,
			action: #selector(boxBtnTapped),
			for: .touchUpInside)
		//self.setTitle("Hello Eric", for: .normal)
		//self.setImage(UIImage(named: placeholder), for: .normal)
		
    }// end override init
	
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
	
	// BUTTON HANDLER
	@objc func boxBtnTapped(sender: BoxButton){
		sender.setImage(UIImage(named: placeholder), for: .normal)
	}

}// end BOX BUTTON CLASS DEF

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

	/*
	// ui buttons
	var pickColorBtn:		UIButton!
	var pickShapeBtn:  		UIButton!
	var pickPictureBtn:		UIButton!
	var pickImprintBtn: 	UIButton!
	var pickScoreBtn:		UIButton!
	var submitButton: 		UIButton!
	*/
	
	// input fields
	var pickImprintTextField: 	UITextField!
	var pickNameTextField:		UITextField!

	// check vars
	var isChecked = 			true
	var isScored = 				false
	
	// my box buttons
	var boxBtn001: BoxButton!
	var boxBtn002: BoxButton!
	var boxBtn003: BoxButton!

	var boxBtn004: BoxButton!
	var boxBtn005: BoxButton!
	var boxBtn006: BoxButton!

	var boxBtn007: BoxButton!
	var boxBtn008: BoxButton!
	var boxBtn009: BoxButton!

	var boxBtn011: BoxButton!
	var boxBtn012: BoxButton!
	var boxBtn010: BoxButton!

	override func loadView() {
		super.loadView()

		//Looks for single or multiple taps to dismiss keyboard
		let tap: UITapGestureRecognizer
		= UITapGestureRecognizer(
			target: self,
			action: #selector(dismissKeyboard))
		view.addGestureRecognizer(tap)
		
	}// end loadview
	
	// GET BOX BUTTON
	func getBoxButton(x: CGFloat, y: CGFloat) -> BoxButton {
		let button = BoxButton(frame: CGRect(
			x: x,
			y: y,
			width: 110,
			height: 110))
		
		//submitButton.layer.borderWidth = 0.0
		button.setTitleColor(UIColor.black, for: .normal)
		button.setTitleColor(UIColor.lightGray, for: .disabled)
		button.setTitleColor(UIColor.white, for: .highlighted)
		button.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		//button.setImage(UIImage(named: placeholder), for: .normal)
		
		button.borderWidth = 1.0
		button.borderColor = .lightGray
		
		return button
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()

		setNavigationBar(title: "Enter Pill Information")

		//========================================
		
		// boxBtn001 (L) //667.0 || % 4.5 = 138-ish || 140 x 4 = 560
		// x is 1/3 of screenWidth
		let boxBtn001 = getBoxButton(x: 0, y: 0)// COLOR
		boxBtn001.setTitle("Color", for: .normal)
		boxBtn001.addTarget(
			self,
			action: #selector(pickColorBtnTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn001)
		
		// boxBtn002 (M)
		let boxBtn002 = getBoxButton(
			x: screenWidth * 0.3,
			y: 0)// SHAPE
		boxBtn002.setTitle("Shape", for: .normal)
		boxBtn002.addTarget(
			self,
			action: #selector(pickShapeBtnTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn002)
		
		// boxBtn003 (R)
		let boxBtn003 = getBoxButton(
			x: screenWidth * 0.6,
			y: 0)// PICTURE
		boxBtn003.addTarget(
			self,
			action: #selector(pickPictureBtnTapped),
			for: .touchUpInside)
		boxBtn003.setTitle("Picture", for: .normal)
		north.addSubview(boxBtn003)

		//========================================
		
		// boxBtn004 (L) || 120 x 4 = 480 || 140 || screenHeight/4 = 167ish
		let boxBtn004 = getBoxButton(
			x: 0,
			y: ((screenHeight/3) - (screenHeight/6)))// IMPRINT
		boxBtn004.setTitle("Imprint", for: .normal)
		boxBtn004.addTarget(
			self,
			action: #selector(pickImprintBtnTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn004)
		
		// boxBtn005 (M)
		let boxBtn005 = getBoxButton(
			x: screenWidth * 0.3,
			y: ((screenHeight/3) - (screenHeight/6)))
		boxBtn005.setTitle("Submit", for: .normal)//SUBMIT
		boxBtn005.addTarget(
			self,
			action: #selector(submitButtonTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn005)
		
		// boxBtn006 (R)
		let boxBtn006 = getBoxButton(
			x: screenWidth * 0.6,
			y: ((screenHeight/3) - (screenHeight/6)))
		boxBtn006.setTitle("Score", for: .normal)
		boxBtn006.addTarget(
			self,
			action: #selector(pickScoreBtnTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn006)//SCORE
		
		//========================================
		

				// Create UITextField
		pickImprintTextField = UITextField(frame: CGRect(
			x: screenWidth * 0.6,
			y: ((screenHeight/4) - (screenHeight/4)),
			width: boxBtn004.frame.width,
			height: boxBtn004.frame.height))
		
		// Set UITextField placeholder text
		pickImprintTextField.placeholder = "Enter Imprint"
		pickImprintTextField.clearsOnBeginEditing = true
		pickImprintTextField.delegate = self
		
		// Set text to UItextField
		//pickImprintTextField.text = "Enter Imprint"
		pickImprintTextField.textAlignment = .center
		
		// Set UITextField border style
		pickImprintTextField.borderStyle = UITextField.BorderStyle.line
		pickImprintTextField.layer.borderWidth = 1.0
		pickImprintTextField.borderColor = .lightGray
		
		// Set UITextField background colour
		//pickImprintTextField.backgroundColor = UIColor.clear
		pickImprintTextField.backgroundColor = UIColor.white
		//pickImprintTextField.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		pickImprintTextField.autocorrectionType  = .no
		pickImprintTextField.autocapitalizationType = .none
		pickImprintTextField.spellCheckingType = .no
		
		// Set UITextField text color
		//pickImprintTextField.textColor = UIColor.black
		
		north.addSubview(pickImprintTextField)
		
		//========================================

		// boxBtn007 (L) //667.0 || 120 + 120 = 240 || 140 + 140 || 166+166 = 332
		let boxBtn007 = getBoxButton(x: 0, y: ((screenHeight/3)))
		north.addSubview(boxBtn007)
		
		// boxBtn008 (M)
		let boxBtn008 = getBoxButton(x: screenWidth * 0.3, y: ((screenHeight/3)))
		north.addSubview(boxBtn008)
		
		// boxBtn009 (R)
		let boxBtn009 = getBoxButton(x: screenWidth * 0.6, y: ((screenHeight/3)))
		north.addSubview(boxBtn009)
		
		//========================================
		
		// boxBtn010 (L) //667.0 || 120 + 120 = 240 || 140 + 140 || 166+166 = 332
		let boxBtn010 = getBoxButton(x: 0, y: ((screenHeight/3) * 1.5))
		north.addSubview(boxBtn010)
		
		// boxBtn011 (M)
		let boxBtn011 = getBoxButton(x: screenWidth * 0.3, y: ((screenHeight/3) * 1.5))
		north.addSubview(boxBtn011)
		
		// boxBtn012 (R)
		let boxBtn012 = getBoxButton(x: screenWidth * 0.6, y: ((screenHeight/3) * 1.5))
		north.addSubview(boxBtn012)
		
		//========================================

		// boxBtn013 (L) //667.0 || 120 + 120 = 240 || 140 + 140 || 166+166 = 332
		let boxBtn013 = getBoxButton(x: 0, y: ((screenHeight/3) * 2))
		north.addSubview(boxBtn013)
		
		// boxBtn014 (M)
		let boxBtn014 = getBoxButton(x: screenWidth * 0.3, y: ((screenHeight/3) * 2))
		north.addSubview(boxBtn014)
		
		// boxBtn015 (R)
		let boxBtn015 = getBoxButton(x: screenWidth * 0.6, y: ((screenHeight/3) * 2))
		north.addSubview(boxBtn015)
		
		//========================================
		
		pickNameTextField = UITextField(frame: CGRect(
			x: 0,
			y: ((screenHeight/4) * 2) + (screenHeight/4),
			width: screenWidth * 0.90,
			height: boxBtn004.frame.height))
		pickNameTextField.placeholder = "Enter Pill Name"
		pickNameTextField.textAlignment  = .center
		//pickNameTextField.font = UIFont.systemFont(ofSize: 15)
		//pickNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
		pickNameTextField.borderColor  = .lightGray
		pickNameTextField.borderWidth  = 1.0
		pickNameTextField.autocorrectionType = UITextAutocorrectionType.no
		//pickNameTextField.keyboardType = UIKeyboardType.default
		pickNameTextField.returnKeyType = UIReturnKeyType.done
		pickNameTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
		pickNameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		
		
		pickNameTextField.delegate = self// when return key pressed, do sumthing
		
		//north.addSubview(pickNameTextField)
		
		
	}// end view did load

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		//south.frame = self.southFrame
		north.frame = self.northFrame
		
	}// end layouts did load
	
	@objc func boxBtn10Tapped(){}
	
	@objc func boxBtn11Tapped() {}

	@objc func boxBtn12Tapped() {}
	
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
	
	func toggleImprintField(sender: BoxButton){
		if pickImprintTextField.isEnabled {
			pickImprintTextField.isEnabled = false
			pickImprintTextField.text = ""
			self.imprint = pickImprintTextField.text!

		}  else {
			pickImprintTextField.isEnabled = true
			pickImprintTextField.text = ""
			self.imprint = pickImprintTextField.text!
		}


		sender.setImage(nil, for: .normal)
		//sender.setTitle("Hello", for: .normal)
		
	}// end toggle imprint field
	
	// when user hits return key on keyboard
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		if  (textField == pickImprintTextField) {
			self.imprint = textField.text!
			
			if textField.text! ==  "" {
				setIsChecked(bool: false)
				//textField.isHidden = true
				//boxBtn004.setTitle(str: "Any Imprint ✓")
				//boxBtn004.setTitleColor(.green, for: .normal)
			} else {
				setIsChecked(bool: true)
				//textField.isHidden = false
				//boxBtn004.setTitle("Imprint ✓", for: .normal)
				//boxBtn004.setTitleColor(.green, for: .normal)
				textField.isEnabled = false
				textField.textColor = .lightGray
				print(textField.text!)
				//print(boxBtn004)
				//print(boxBtn004.getTitle())
			}
		}
		
		if (textField  == pickNameTextField) {
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
	
	@objc func pickColorBtnTapped(sender: BoxButton){
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick Color",
			rows: [
				colors
			],
			initialSelection: [0],
			doneBlock: {
				picker, indexes, values in
				let value = colors[indexes?.first as! Int]
				self.color = String(value).uppercased()
				let txt = (self.color).capitalized

				sender.setTitle(txt,for: .normal)
				sender.setImage(nil, for: .normal)
				
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
				let value = shapes[indexes?.first as! Int]
				self.shape = String(value).uppercased()
				let txt = (self.shape).capitalized
				
				sender.setTitle(txt,for: .normal)
				sender.setImage(nil, for: .normal)
				
				return
		},
			cancel: {ActionMultipleStringCancelBlock in return },
			origin: sender)
	}// end pick shape
	
	
	@objc func pickScoreBtnTapped(sender: UIButton){
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick Score",
			rows: [
				scores
			],
			initialSelection: [0],
			doneBlock: {
				picker, indexes, values in
				let value = scores[indexes?.first as! Int]
				self.score = value
				
				let num = self.score

				if num == 1 {
					sender.setTitle("I",for: .normal)
				}
				if num == 2 {
					sender.setTitle("II",for: .normal)
				}
				if num == 3 {
					sender.setTitle("III",for: .normal)
				}
				if num == 4 {
					sender.setTitle("IIII",for: .normal)
				}

				sender.setImage(nil, for: .normal)
				return
		},
			cancel: {ActionMultipleStringCancelBlock in return },
			origin: sender)
	}// end pick shape


	@objc func submitButtonTapped(sender: UIButton){
		submit()
		sender.setImage(nil, for: .normal)
	}// end submit btn tapped
	
	@objc func imageButtonTapped(_ sender: Any) {
		showImageActionSheet()
		importImage()
	}// end upload pickImprintBtn action
	
	
	// MARK: - ImagePicker Delegate
	@objc func imagePickerController(
		_ picker: UIImagePickerController,
		didFinishPickingMediaWithInfo info: [
		UIImagePickerController.InfoKey : Any]) {
		
		//dismiss(animated: false, completion: nil)
		//self.pickPictureBtn.isEnabled = false
		
		
		//  COMPLETELY BROKEN
		
		if let pickedImage = info[
			UIImagePickerController.InfoKey.originalImage] as? UIImage {
			//boxBtn003.setImage(pickedImage, for: .normal)
			print(pickedImage)
			
		}
		
	}
	
	@objc func imagePickerControllerDidCancel(
		_ picker: UIImagePickerController) {
		dismiss(animated: false, completion: nil)
	}// end imagepicker cancel
	
	@objc func pickImprintBtnTapped(_ sender: BoxButton) {
		toggleIsChecked()
		toggleImprintField(sender: sender)
		if hasImprint(sender: sender) {
			self.imprint = ""
		} else {
			self.imprint = "no-imprint"
		}
	}
	
	func hasImprint(sender: UIButton) -> Bool {
		if isChecked {
			// decideed to  have some form of imprint
			sender.setTitle("Imprint", for: .normal)
			//sender.setTitleColor(.green, for: .normal)
			pickImprintTextField.placeholder = "Enter Imprint"
			pickImprintTextField.unmarkText()
			pickImprintTextField.isEnabled  = true
			pickImprintTextField.isHidden = false
			imprint = ""

			return true
		} else {
			// doesnt want imprint at all
			sender.setTitle("Never Imprint", for: .normal)
			//sender.setTitleColor(.red, for: .normal)
			pickImprintTextField.placeholder = "No Imprint"
			pickImprintTextField.isHidden  = true
			pickImprintTextField.isEnabled  = false
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
		//guard let name = self.pickNameTextField.text else { return }
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
					//self.boxBtn11.setImage(UIImage(named: placeholder), for: .normal)
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
			completion: {})
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

