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

	// ui buttons
	var pickColorBtn:		UIButton!
	var pickShapeBtn:  		UIButton!
	var pickPictureBtn:		UIButton!
	var pickImprintBtn: 	UIButton!
	var pickScoreBtn:		UIButton!
	var submitButton: 		UIButton!

	
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

	var boxBtn11: BoxButton!
	var boxBtn12: BoxButton!
	var boxBtn10: BoxButton!


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
		
		// boxBtn001 (L) //667.0 || % 4.5 = 138-ish || 140 x 4 = 560
		// x is 1/3 of screenWidth
		let boxBtn001 = getBoxButton(x: 0, y: 0)// COLOR
		boxBtn001.setTitle("COLOR", for: .normal)
		boxBtn001.addTarget(
			self,
			action: #selector(pickColorBtnTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn001)
		
		// boxBtn002 (M)
		let boxBtn002 = getBoxButton(x: screenWidth * 0.3, y: 0)// SHAPE
		boxBtn002.setTitle("SHAPE", for: .normal)
		boxBtn002.addTarget(
			self,
			action: #selector(pickShapeBtnTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn002)
		
		// boxBtn003 (R)
		let boxBtn003 = getBoxButton(x: screenWidth * 0.6, y: 0)// PICTURE
		boxBtn003.addTarget(
			self,
			action: #selector(pickPictureBtnTapped),
			for: .touchUpInside)
		boxBtn003.setTitle("PICTURE", for: .normal)
		north.addSubview(boxBtn003)
		
		// boxBtn004 (L) || 120 x 4 = 480 || 140 || screenHeight/4 = 167ish
		let boxBtn004 = getBoxButton(x: 0, y: ((screenHeight/3) * 1))// IMPRINT
		boxBtn004.setTitle("IMPRINT", for: .normal)
		boxBtn004.addTarget(
			self,
			action: #selector(pickImprintBtnTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn004)
		
		// boxBtn005 (M)
		let boxBtn005 = getBoxButton(x: screenWidth * 0.3, y: ((screenHeight/3) * 1))
		boxBtn005.setTitle("SUBMIT", for: .normal)//SUBMIT
		boxBtn005.addTarget(
			self,
			action: #selector(submitButtonTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn005)
		
		// boxBtn006 (R)
		let boxBtn006 = getBoxButton(x: screenWidth * 0.6, y: ((screenHeight/3) * 1))
		boxBtn006.setTitle("SCORE", for: .normal)
		boxBtn006.addTarget(
			self,
			action: #selector(pickScoreBtnTapped),
			for: .touchUpInside)
		north.addSubview(boxBtn006)//SCORE
		
		
		// boxBtn007 (L) //667.0 || 120 + 120 = 240 || 140 + 140 || 166+166 = 332
		let boxBtn007 = getBoxButton(x: 0, y: ((screenHeight/3) * 2))
		north.addSubview(boxBtn007)
		
		// boxBtn008 (M)
		let boxBtn008 = getBoxButton(x: screenWidth * 0.3, y: ((screenHeight/3) * 2))
		north.addSubview(boxBtn008)
		
		// boxBtn009 (R)
		let boxBtn009 = getBoxButton(x: screenWidth * 0.6, y: ((screenHeight/3) * 2))
		north.addSubview(boxBtn009)
		
		/*
		// boxBtn010 (L) //667.0 || 240 + 120 = 360 || 280 + 140 = 420 || 332 +166 = 498
		let boxBtn010 = getBoxButton(x: 0, y: ((screenHeight/4) * 3))
		north.addSubview(boxBtn010)
		
		// boxBtn011 (M)
		let boxBtn011 = getBoxButton(x: screenWidth * 0.3, y: ((screenHeight/4) * 3))
		north.addSubview(boxBtn011)
		
		// boxBtn012 (R)
		let boxBtn012 = getBoxButton(x: screenWidth * 0.6, y: ((screenHeight/4) * 3))
		north.addSubview(boxBtn012)
		*/
		
		
		/*
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
		pickScoreBtn.layer.borderWidth = 1.0
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
*/
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
		
		
		
		// Create UITextField
		pickImprintTextField = UITextField(frame: CGRect(
			x: 0, y: ((screenHeight/4) * 2),
			width: screenWidth * 0.90,
			height: boxBtn004.frame.height))
		
		// Set UITextField placeholder text
		pickImprintTextField.placeholder = "Or Leave Blank"
		pickImprintTextField.clearsOnBeginEditing = true
		pickImprintTextField.delegate = self
		
		// Set text to UItextField
		//pickImprintTextField.text = "Enter Imprint"
		pickImprintTextField.textAlignment = .center
		
		// Set UITextField border style
		//pickImprintTextField.borderStyle = UITextField.BorderStyle.line
		pickImprintTextField.layer.borderWidth = 1.0
		//pickImprintTextField.borderColor = .black
		
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
		//pickImprintTextField.isHidden =  true
		
		
	}// end view did load


	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		//south.frame = self.southFrame
		north.frame = self.northFrame
		
		/*

		// LEFT BOX BUTTON  (LEFT)
		boxBtn10 =  UIButton(frame: CGRect(
			x: (screenWidth * 0),
			y: screenHeight * 0.65,
			width: 110,
			height: 110))
		//submitButton.layer.borderWidth = 0.0
		boxBtn10.setTitleColor(UIColor.black, for: .normal)
		boxBtn10.setTitleColor(UIColor.lightGray, for: .disabled)
		boxBtn10.setTitleColor(UIColor.white, for: .highlighted)
		boxBtn10.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		
		boxBtn10.borderWidth = 1.0
		boxBtn10.borderColor = .lightGray
		boxBtn10.addTarget(
			self,
			action: #selector(boxBtn10Tapped),
			for: .touchUpInside)
		boxBtn10.setTitle("Shape", for: .normal)
		//boxBtn10.setImage(UIImage(named: placeholder), for: .normal)
		
		north.addSubview(boxBtn10)
		
		
		// MIDDLE PAGE BUTTON  (MIDDLE)
		boxBtn11 =  UIButton(frame: CGRect(
			x: (screenWidth) * 0.3,
			y: screenHeight * 0.65,
			width: 110,
			height: 110))
		boxBtn11.setTitleColor(UIColor.black, for: .normal)
		boxBtn11.setTitleColor(UIColor.lightGray, for: .disabled)
		boxBtn11.setTitleColor(UIColor.white, for: .highlighted)
		
		boxBtn11.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		
		boxBtn11.borderWidth = 1.0
		boxBtn11.borderColor = .lightGray
		boxBtn11.addTarget(
			self,
			action: #selector(boxBtn11Tapped),
			for: .touchUpInside)
		boxBtn11.setTitle("Submit", for: .normal)
		//boxBtn11.setImage(UIImage(named: placeholder), for: .normal)
		
		north.addSubview(boxBtn11)
		
		// RIGHT BOX BUTTON  (RIGHT)
		boxBtn12 =  UIButton(frame: CGRect(
			x: screenWidth * 0.6,
			y: screenHeight * 0.65,
			width: 110,
			height: 110))
		boxBtn12.setTitleColor(UIColor.black, for: .normal)
		boxBtn12.setTitleColor(UIColor.lightGray, for: .disabled)
		boxBtn12.setTitleColor(UIColor.white, for: .highlighted)
		boxBtn12.titleLabel?.font =  UIFont.systemFont(
			ofSize: 16,
			weight: .light)
		
		boxBtn12.borderWidth = 1.0
		boxBtn12.borderColor = .lightGray
		boxBtn12.addTarget(
			self,
			action: #selector(boxBtn12Tapped),
			for: .touchUpInside)
		boxBtn12.setTitle("Color", for: .normal)
		//boxBtn12.setImage(UIImage(named: placeholder), for: .normal)
		
		north.addSubview(boxBtn12)
		*/
		
	}// end layouts did load
	
	@objc func boxBtn10Tapped(){
		pickShapeBtnTapped(sender: pickShapeBtn)
	}
	
	@objc func boxBtn11Tapped() {
		submitButtonTapped()
	}

	@objc func boxBtn12Tapped() {
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
				//textField.isHidden = true
				//boxBtn004.setTitle(str: "Any Imprint ✓")
				//boxBtn004.setTitleColor(.green, for: .normal)
			} else {
				setIsChecked(bool: true)
				//textField.isHidden = false
				//self.boxBtn004.setTitle(str: "Imprint ✓")
				//boxBtn004.setTitleColor(.green, for: .normal)
				print(textField.text!)
				print(boxBtn004)
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
				//print("shape = \(values!)")
				//print("indexes = \(indexes!)")
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
				
				//sender.setTitle(txt,for: .normal)
				sender.setImage(nil, for: .normal)
				
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
		importImage()
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
			pickImprintTextField.isHidden = false
			imprint = ""
			pickImprintTextField.isHidden = false
			return true
		} else {
			sender.setTitle("No Imprint X", for: .normal)
			sender.setTitleColor(.red, for: .normal)
			pickImprintTextField.placeholder = ""
			pickImprintTextField.isHidden  = true
			pickImprintTextField.isHidden = true
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
	

	func getSampleLabel() -> UITextField {
		
		pickNameTextField = UITextField(frame: CGRect(
			x: 20,
			y: screenHeight * 0.425,
			width: screenWidth * 0.8,
			height: 44))
		pickNameTextField.placeholder = "Enter Pill Name"
		pickNameTextField.textAlignment  = .center
		//pickNameTextField.font = UIFont.systemFont(ofSize: 15)
		//pickNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
		pickNameTextField.borderColor  = .lightGray
		pickNameTextField.borderWidth  = 2.0
		pickNameTextField.autocorrectionType = UITextAutocorrectionType.no
		//pickNameTextField.keyboardType = UIKeyboardType.default
		pickNameTextField.returnKeyType = UIReturnKeyType.done
		pickNameTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
		pickNameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		
		
		pickNameTextField.delegate = self// when return key pressed, do sumthing
		
		return pickNameTextField
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
