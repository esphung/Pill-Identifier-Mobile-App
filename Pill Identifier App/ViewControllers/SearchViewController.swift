// .dP"Y8 888888    db    88""Yb  dP""b8 88  88 Yb    dP 88 888888 Yb        dP
// `Ybo." 88__     dPYb   88__dP dP   `" 88  88  Yb  dP  88 88__    Yb  db  dP
// o.`Y8b 88""    dP__Yb  88"Yb  Yb      888888   YbdP   88 88""     YbdPYbdP
// 8bodP' 888888 dP""""Yb 88  Yb  YboodP 88  88    YP    88 888888    YP  YP

import ActionSheetPicker_3_0
import SwiftyJSON
import Alamofire

//let sv = UIViewController.displaySpinner(onView: self.view)
//UIViewController.removeSpinner(spinner: sv)

// https://chesapeakeholistic.com/wp-content/uploads/2018/03/placeholder.png
// http://www.santacruzmentor.org/wp-content/uploads/2012/12/Placeholder.png
// https://www.bridgeig.com/wp-content/uploads/female-placeholder.jpg

// remote test images
let remoteTestImageUrls = [
	
	"https://chesapeakeholistic.com/wp-content/uploads/2018/03/placeholder.png",
	"http://www.santacruzmentor.org/wp-content/uploads/2012/12/Placeholder.png",
	"https://www.bridgeig.com/wp-content/uploads/female-placeholder.jpg"
	
]

// picker options for searching pill paramaters
public let shapes = [
	
	"BULLET",
	"CAPSULE",
	"CLOVER",
	"DIAMOND",
	"DOUBLE CIRCLE",
	"FREEFORM",
	"GEAR",
	"HEPTAGON",
	"HEXAGON",
	"OCTAGON",
	"OVAL",
	"PENTAGON",
	"RECTANGLE",
	"ROUND",
	"SEMI-CIRCLE",
	"SQUARE",
	"TEAR",
	"TRAPEZOID",
	"TRIANGLE"
	
]

public let colors =  [
	
	"Black",
	"Blue",
	"Brown",
	"Gray",
	"Green",
	"Orange",
	"Pink",
	"Purple",
	"Red",
	"Turquoise",
	"White",
	"Yellow"
	
]

public let scores  = [0,1,2,3,4]

/*
(original height / original width) x new width = new height
(0.00 / 0.00) x 400 = 300
*/

class SearchViewController:
NorthSouthViewController,
UIImagePickerControllerDelegate,
UINavigationControllerDelegate,
UITextFieldDelegate,
UITableViewDataSource, UITableViewDelegate {

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

	// input fields
	var pickImprintTextField: 	UITextField!
	var pickNameTextField:		UITextField!

	// check vars
	var isChecked = 			true
	var isScored = 				false
	
	var customTableView:  		MyPillTableView!
	var cellData: 				CellDataClass!
	let cellReuseIdentifier: 	String = "customCell"
	
	// my box buttons
	var boxBtn001: BoxButton!
	var boxBtn002: BoxButton!
	var boxBtn003: BoxButton!

	var boxBtn004: BoxButton!
	var boxBtn005: BoxButton!
	var boxBtn006: BoxButton!
	
	var arrayPillData = [Pill]()
	var arrayOfCellData = [CellDataClass]()
	
	var cell: TableViewCell2!
	var cellUpdater: CustomCellUpdater?// attach this to add a delagate to friend

	override func loadView() {
		super.loadView()
		
		let sv = SearchViewController.displaySpinner(onView: self.view)
		
		//Looks for single or multiple taps to dismiss keyboard
		let tap: UITapGestureRecognizer
		= UITapGestureRecognizer(
			target: self,
			action: #selector(dismissKeyboard))
		view.addGestureRecognizer(tap)
		
		if arrayOfCellData.isEmpty {
			
			// default results list items and test harness
			arrayOfCellData = [
				CellDataClass(
					cell: 0,
					name:  "Welcome to",
					image:  remoteTestImageUrls[0],
					imageUrl: "https://chesapeakeholistic.com/wp-content/uploads/2018/03/placeholder.png",
					color: "i can", shape: "make banaana", imprint: "",
					rxcui: 30303, score: 0, limit: 0),
				
				CellDataClass(
					cell: 1,
					name: "Pill Identifier!",
					image:  remoteTestImageUrls[1],
					imageUrl: "http://www.santacruzmentor.org/wp-content/uploads/2012/12/Placeholder.png",
					color: "an", shape: "make banaana", imprint: "",
					rxcui: 13218, score: 0, limit: 0),
				
				CellDataClass(
					cell: 2,
					name:  "by Eric Phung",
					image: remoteTestImageUrls[2],
					imageUrl: remoteTestImageUrls[2],
					color: "", shape: "", imprint: "",
					rxcui: 13218, score: 0, limit: 0)
				
			]
			
		}
		
		SearchViewController.removeSpinner(spinner: sv)

	}// end loadview
	

	override func viewDidLoad() {
		super.viewDidLoad()
		
		//  MAKE TABLE VIEW
		customTableView = MyPillTableView(frame: CGRect(
			x: 0, y: 0, width: 110, height: 110))
		
		customTableView.delegate = self
		customTableView.dataSource = self
		
		customTableView.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(customTableView)
		
		setTableViewConstraints()
		
		customTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
		customTableView.separatorColor = UIColor.clear
		
		//showFrames()
		
		
		

		//========================================
		// Get the superview's layout

		// boxBtn001 (L)
		let boxBtn001 = BoxButton(
			frame: CGRect(
				x: 0, y: 0, width: view.frame.width/3, height: view.frame.height/4))// COLOR
		boxBtn001.setTitle("Color", for: .normal)
		boxBtn001.addTarget(self,action: #selector(pickColorBtnTapped),for: .touchUpInside)
		view.addSubview(boxBtn001)
		
		// boxBtn002 (M)
		let boxBtn002 = BoxButton(frame: CGRect(
			x: view.frame.width/3, y: 0, width: view.frame.width/3, height: view.frame.height/4))
		boxBtn002.setTitle("Shape", for: .normal)
		boxBtn002.addTarget(self, action: #selector(pickShapeBtnTapped),
			for: .touchUpInside)
		view.addSubview(boxBtn002)
		
		// boxBtn003 (R)
		let boxBtn003 = BoxButton(frame: CGRect(
			x: (view.frame.width - view.frame.width/3), y: 0, width: view.frame.width/3, height: view.frame.height/4))
		boxBtn003.setTitle("Picture", for: .normal)
		view.addSubview(boxBtn003)
		
		//========================================
		// boxBtn004 (L) || 0.0 x 4 = 480 || 0.0 || screenHeight/4 = 167ish
		let boxBtn004 = BoxButton(
			frame: CGRect(
				x: 0, y:  (view.frame.height - view.frame.height/2)/2, width: view.frame.width/3, height: view.frame.height/4))// Imager
		boxBtn004.setTitle("Image", for: .normal)
		boxBtn004.addTarget(
			self,
			action: #selector(pickImprintBtnTapped),
			for: .touchUpInside)
		view.addSubview(boxBtn004)

		// boxBtn005 (M)
		let boxBtn005 = BoxButton(frame: CGRect(
			x: view.frame.width/3, y:  (view.frame.height - view.frame.height/2)/2, width: view.frame.width/3, height: view.frame.height/4))
		boxBtn005.setTitle("Submit", for: .normal)//SUBMIT
		boxBtn005.addTarget(
			self,
			action: #selector(submitButtonTapped),
			for: .touchUpInside)
		view.addSubview(boxBtn005)

		// boxBtn006 (R)
		let boxBtn006 = BoxButton(frame: CGRect(
		x: (view.frame.width - view.frame.width/3), y:  (view.frame.height - view.frame.height/2)/2, width: view.frame.width/3, height: view.frame.height/4))
		boxBtn006.setTitle("Scores", for: .normal)
		boxBtn006.addTarget(
			self,
			action: #selector(pickScoreBtnTapped),
			for: .touchUpInside)
		view.addSubview(boxBtn006)//SCORE

		//========================================
		
		//setNavigationBar(title: "Enter Pill Information")
		// Create UITextField
		pickImprintTextField = UITextField(frame: CGRect(
			x: view.frame.width * 0.6,
			y: ((view.frame.width/4) - (view.frame.height/4)),
			width: 0.0,
			height: 0.0))
		pickImprintTextField.isOpaque = true
		
		
		// Set UITextField placeholder text
		pickImprintTextField.placeholder = "Enter Imprint"
		pickImprintTextField.clearsOnBeginEditing = true
		pickImprintTextField.delegate = self
		
		// Set text to UItextField
		//pickImprintTextField.text = "Enter Imprint"
		pickImprintTextField.textAlignment = .center
		
		// Set UITextField border style
		//pickImprintTextField.borderStyle = UITextField.BorderStyle.line
		pickImprintTextField.layer.borderWidth = 0.0
		pickImprintTextField.borderColor = .lightGray
		
		// Set UITextField background colour
		//pickImprintTextField.backgroundColor = UIColor.clear
		pickImprintTextField.backgroundColor = UIColor.white
		//pickImprintTextField.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		pickImprintTextField.autocorrectionType  = .no
		pickImprintTextField.autocapitalizationType = .none
		pickImprintTextField.spellCheckingType = .no
		
		//north.addSubview(pickImprintTextField)

		//========================================
		pickNameTextField = UITextField(frame: CGRect(
			x: 0.0, y: ((view.frame.height/3) * 2),
			width: view.frame.height * 0.90,
			height: 0.0))
		pickNameTextField.placeholder = "Enter Pill Name"
		pickNameTextField.textAlignment  = .center
		//pickNameTextField.font = UIFont.systemFont(ofSize: 15)
		//pickNameTextField.borderStyle = UITextField.BorderStyle.roundedRect
		pickNameTextField.borderColor  = .lightGray
		pickNameTextField.borderWidth  = 0.0
		pickNameTextField.autocorrectionType = UITextAutocorrectionType.no
		//pickNameTextField.keyboardType = UIKeyboardType.default
		pickNameTextField.returnKeyType = UIReturnKeyType.done
		pickNameTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
		pickNameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
		
		pickNameTextField.delegate = self// when return key pressed, do sumthing
		
		// ===========================================
		//print(screenWidth)
		//print(screenHeight)
		
	}// end view did load
	
	func submit() {
		
		let sv = SearchViewController.displaySpinner(onView: self.view)// start display spinner
		
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
		} else {
			score = 0
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
					
					// save to array, send results to display page
					self.setArray(json: swiftyJsonVar["nlmRxImages"])
					
					self.displayResultsPage()
					
					
				} else {
					// no results found
					print("No results founds")
					
				}
				
				SearchViewController.removeSpinner(spinner: sv)// stops display spinner
				
			}
			
		}
		
	}// end submit
	
	
	func setTableViewConstraints() {
		// Get the superview's layout
		let margins = myView.layoutMarginsGuide
		
		// Pin the leading edge of customsView to the margin's leading edge
		customTableView.leadingAnchor.constraint(lessThanOrEqualTo: margins.leadingAnchor).isActive = true
		
		// Pin the trailing edge of customTableView to the margin's trailing edge
		customTableView.trailingAnchor.constraint(lessThanOrEqualTo: margins.trailingAnchor).isActive = true
		
		// Give myView a 1:2 aspect ratio
		customTableView.heightAnchor.constraint(equalTo: margins.heightAnchor, multiplier: 0.5).isActive = true
		
		// if pinned to the bottom
		customTableView.bottomAnchor.constraint(lessThanOrEqualTo: margins.bottomAnchor).isActive = true
		
		//customTableView.backgroundColor = .red
		//myView.backgroundColor = .blue
	}//  end table constraintss


	
	
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
		customTableView.reloadData()
		//showImageActionSheet()
	}
	
	@objc func pickColorBtnTapped(sender: BoxButton){
		print(sender)
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

	@objc func pickShapeBtnTapped(sender: BoxButton){
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
	
	
	@objc func pickScoreBtnTapped(sender: BoxButton){
		ActionSheetMultipleStringPicker.show(
			withTitle: "Pick Scores",
			rows: [
				scores
			],
			initialSelection: [0],
			doneBlock: {
				picker, indexes, values in
				let value = scores[indexes?.first as! Int]
				self.score = value
				
				let num = self.score
				if num == 0 {
					sender.setTitle("Scores",for: .normal)
				}
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
	}// end submit btn tapped
	
	@objc func imageButtonTapped(_ sender: Any) {
		showImageActionSheet()
	}// end upload pickImprintBtn action
	

	@objc func pickImprintBtnTapped(_ sender: BoxButton) {
		toggleIsChecked()
		toggleImprintField(sender: sender)
		if hasImprint(sender: sender) {
			self.imprint = ""
		} else {
			self.imprint = "no-imprint"
		}
	}
	
	func hasImprint(sender: BoxButton) -> Bool {
		if isChecked {
			// decideed to  have some form of imprint
			sender.setTitle("No Image", for: .normal)
			//sender.setTitleColor(.green, for: .normal)
			pickImprintTextField.placeholder = "Enter Imprint"
			pickImprintTextField.unmarkText()
			pickImprintTextField.isEnabled  = true
			pickImprintTextField.isHidden = false
			imprint = ""

			return true
		} else {
			// doesnt want imprint at all
			sender.setTitle("Imprint", for: .normal)
			//sender.setTitleColor(.red, for: .normal)
			pickImprintTextField.placeholder = "No Imprint"
			pickImprintTextField.isHidden  = true
			pickImprintTextField.isEnabled  = false
			imprint = "no-imprint"
			
			return false
		}
	}
	
	func setArray(json: JSON) {
		// ====== set json to my pill array
		for item in json.array! {
			arrayPillData.append(Pill(
				name:			 item["name"].string!,
				imageUrlString:  item["imageUrl"].string!,
				color: 			color,
				shape: 			shape,
				imprint: 		imprint,
				rxcui: 			item["rxcui"].int!,
				score: 			score
			))
			
		}// end loop pill data
	}
	
	func updateListOnPage() {
	
		// set new cell data in cell array for results page
		var i = 0
		
		while i < arrayPillData.count {
			//print(nlmRxImages[i]["rxcui"].int!)
			
			self.arrayOfCellData.append(
				
				CellDataClass(
					cell: 		i,
					name: 		arrayPillData[i].getName(),
					image: 		placeholder,
					imageUrl: 	arrayPillData[i].getImageUrlString(),
					color: 		arrayPillData[i].getColor(),
					shape: 		arrayPillData[i].getShape(),
					imprint: 	arrayPillData[i].getImprint(),
					rxcui: 		arrayPillData[i].getRxcui(),
					score:		arrayPillData[i].getScore(),
					limit:	 	0
			))
			
			print(arrayPillData[i])
			i = i + 1
			
		}// pill data to cell data
		
	}
	

	func displayResultsPage() {
		
		let sv = SearchViewController.displaySpinner(onView: self.view)// start spinner
		
		let resultsTableViewController: ResultsTableViewController = storyboard?.instantiateViewController(withIdentifier: "resultsTableViewController") as! ResultsTableViewController

		// set new cell data in cell array for results page
		var i = 0
		
		while i < arrayPillData.count {
			
			//print(nlmRxImages[i]["rxcui"].int!)
			
			resultsTableViewController.arrayOfCellData.append(
				CellDataClass(
					cell: 		i,
					name: 		arrayPillData[i].getName(),
					image: 		placeholder,
					imageUrl: 	arrayPillData[i].getImageUrlString(),
					color: 		arrayPillData[i].getColor(),
					shape: 		arrayPillData[i].getShape(),
					imprint: 	arrayPillData[i].getImprint(),
					rxcui: 		arrayPillData[i].getRxcui(),
					score:		arrayPillData[i].getScore(),
					limit:	 	0
			))
			
			i = i + 1
			
			SearchViewController.removeSpinner(spinner: sv)// end spinner
			
		}// pill data to cell data
		
		self.present(
			
			resultsTableViewController,
			animated: false,
			completion: nil
			
		)
		
	}// end card disp

	
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
	
	// MARK: - Table view data source
	

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
	
	
}//  end uiview extension







extension SearchViewController {

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
	
}


extension SearchViewController {
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		let rowHeight = screenWidth/screenHeight * 150
		
		return rowHeight
		
	}// end height for row
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		
		return arrayOfCellData.count
	
	}// end num of rows
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = Bundle.main.loadNibNamed("TableViewCell2",
											owner: self, options: nil)?.first as! TableViewCell2
		let url = URL(string: arrayOfCellData[indexPath.row].getImageUrl())// get  cell data image url
		//let url = URL(string: "https://chesapeakeholistic.com/wp-content/uploads/2018/03/placeholder.png")// get  cell data image url
		
		// https://chesapeakeholistic.com/wp-content/uploads/2018/03/placeholder.png
		
		cell.mainImageView.kf.setImage(with: url, placeholder: UIImage(imageLiteralResourceName: "against.jpg"))// set image url
		
		cell.mainLabel?.text = arrayOfCellData[indexPath.row].getName()
		
		cell.mainLabel?.textAlignment = .center
		cell.mainLabel?.numberOfLines = 1
		
		//customTableView.updateTableView()
		return cell
		
	}
	
}// end table  delegate extension



extension SearchViewController {
	
	class func displaySpinner(onView : UIView) -> UIView {
		
		let spinnerView = UIView.init(frame: onView.bounds)
		spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
		let ai = UIActivityIndicatorView.init(activityIndicatorStyle: .whiteLarge)
		ai.startAnimating()
		ai.center = spinnerView.center
		
		DispatchQueue.main.async {
			spinnerView.addSubview(ai)
			onView.addSubview(spinnerView)
		}
		
		return spinnerView
	}
	
	class func removeSpinner(spinner :UIView) {
		DispatchQueue.main.async {
			spinner.removeFromSuperview()
		}
	}
}//  end spinner display extension



