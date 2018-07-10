// .dP"Y8 888888    db    88""Yb  dP""b8 88  88 Yb    dP 88 888888 Yb        dP
// `Ybo." 88__     dPYb   88__dP dP   `" 88  88  Yb  dP  88 88__    Yb  db  dP
// o.`Y8b 88""    dP__Yb  88"Yb  Yb      888888   YbdP   88 88""     YbdPYbdP
// 8bodP' 888888 dP""""Yb 88  Yb  YboodP 88  88    YP    88 888888    YP  YP

import ActionSheetPicker_3_0
import SwiftyJSON
import Alamofire

let nurseScrubGreenColor = UIColor(red: 119/255.0, green: 203/255.0, blue: 187/255.0, alpha: 1.0)
let nurseAlphaFiler =  UIColor(white: 1, alpha: 0.5)


//let sv = UIViewController.displaySpinner(onView: self.view)
//UIViewController.removeSpinner(spinner: sv)

// https://chesapeakeholistic.com/wp-content/uploads/2018/03/placeholder.png
// http://www.santacruzmentor.org/wp-content/uploads/2012/12/Placeholder.png
// https://www.bridgeig.com/wp-content/uploads/female-placeholder.jpg

public let remoteParamBckgrdImgs = [
	
	//Color icon
	"https://cdn3.iconfinder.com/data/icons/medical-specialties-2-2/256/Alternative_Medicine-512.png",//leaf
	//"https://cdn3.iconfinder.com/data/icons/glyph/227/Pipette-512.png",
	
	//shapes icon
	"https://cdn0.iconfinder.com/data/icons/education-6/505/Education_4-512.png",// shapes
	
	
	//jpg icon (btn 003)
	//"https://cdn3.iconfinder.com/data/icons/glyph/227/Image-512.png",// single photo
	"https://static1.squarespace.com/static/5691462ea12f449cd64c36e5/t/595450df86e6c03341404972/1498697996723/Icons-01.jpg",// pho image icon
	
	//btn 004
	"https://cdn3.iconfinder.com/data/icons/healthcare-and-medicine-icons-2/512/Hospital-512.png",
	
	//btn 005  checkmark  submit
	"https://www.icon2s.com/wp-content/uploads/2014/02/Medical-Grey-Health-Sign.png",// dope ass health sign
	//"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTh6XolhdJVcH4XWTPX6px5poTYolXTINOvJ6rDccQkN-EO-4kow",
	
	//btn 006
	"https://cdn4.iconfinder.com/data/icons/medical-5/500/herb-512.png"//herb
	//"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQy815wZe82UOaR13bvOk_qNsn-eSFU68mya1LV2txPivF7TSjw"

]

// remote test images
public let remoteTestImageUrls = [
	
	"data:image/png;base64,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",
	
	"http://www.santacruzmentor.org/wp-content/uploads/2012/12/Placeholder.png",
	
	// female icon
	"https://www.bridgeig.com/wp-content/uploads/female-placeholder.jpg",
	
	//home icon
	"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRztpbmL4J2kshBxqkuCHbsij_JhcYaQWq2VRmoUFZywpi6TK9xVw",
	
	//jpg icon (btn 003)
	"https://static1.squarespace.com/static/5691462ea12f449cd64c36e5/t/595450df86e6c03341404972/1498697996723/Icons-01.jpg"
	
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
	
	//var cell: TableViewCell2!
	//var cellUpdater: CustomCellUpdater?// attach this to add a delagate to friend

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
					image:  "",
					
					imageUrl: remoteTestImageUrls[0],
					color: "i can", shape: "make banaana", imprint: "",
					rxcui: 30303, score: 0, limit: 0),
				
				CellDataClass(
					
					cell: 1,
					name: "Pill Identifier!",
					image:  "",
					
					imageUrl: remoteTestImageUrls[1],
					color: "an", shape: "make banaana", imprint: "",
					rxcui: 13218, score: 0, limit: 0),
				
				CellDataClass(
					
					cell: 2,
					name:  "by Eric Phung",
					image: remoteTestImageUrls[3],
					
					imageUrl: remoteTestImageUrls[3],//home icon
					color: "", shape: "", imprint: "",
					rxcui: 13218, score: 0, limit: 0)
				
			]
			
		}
		
		SearchViewController.removeSpinner(spinner: sv)
		
		

	}// end loadview
	

	override func viewDidLoad() {
		
		super.viewDidLoad()
		view.backgroundColor = nurseScrubGreenColor
		
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
		
		customTableView.isScrollEnabled = false
		
		//showFrames()
		
		//========================================
		// Get the superview's layout

		// boxBtn001 (L)
		let boxBtn001 = BoxButton(
			frame: CGRect(
				x: 0,
				y: 0,
				width: view.frame.width/3,
				height: view.frame.height/4))// COLOR
		
		boxBtn001.setTitle("Color", for: .normal)
		
		//boxBtn001.borderWidth =  0.5
		
		boxBtn001.addTarget(self,action: #selector(pickColorBtnTapped),for: .touchUpInside)
		
		url = URL(string: remoteParamBckgrdImgs[0])
		
		boxBtn001.kf.setBackgroundImage(with: url, for: .normal)
		
		view.addSubview(boxBtn001)
		
		// boxBtn002 (M)
		let boxBtn002 = BoxButton(frame: CGRect(
			x: view.frame.width/3, y: 0, width: view.frame.width/3, height: view.frame.height/4))
		boxBtn002.setTitle("Shape", for: .normal)
		boxBtn002.addTarget(self, action: #selector(pickShapeBtnTapped),
			for: .touchUpInside)
		
		url = URL(string: remoteParamBckgrdImgs[1])
		
		boxBtn002.kf.setBackgroundImage(with: url, for: .normal)
		view.addSubview(boxBtn002)
		
		// boxBtn003 (R)
		let boxBtn003 = BoxButton(frame: CGRect(
			x: (view.frame.width - view.frame.width/3), y: 0, width: view.frame.width/3, height: view.frame.height/4))
		
		url = URL(string: remoteParamBckgrdImgs[2])
		
		boxBtn003.kf.setBackgroundImage(with: url, for: .normal)
		
		boxBtn003.setTitle("Picture", for: .normal)
		
		view.addSubview(boxBtn003)
		
		//========================================
		// boxBtn004 (L) || 0.0 x 4 = 480 || 0.0 || screenHeight/4 = 167ish
		let boxBtn004 = BoxButton(
			frame: CGRect(
				x: 0, y:  (view.frame.height - view.frame.height/2)/2, width: view.frame.width/3, height: view.frame.height/4))// Imager
		boxBtn004.setTitle("Image", for: .normal)
		
		url = URL(string: remoteParamBckgrdImgs[3])
		
		boxBtn004.kf.setBackgroundImage(with: url, for: .normal)
		boxBtn004.addTarget(
			self,
			action: #selector(pickImprintBtnTapped),
			for: .touchUpInside)
		view.addSubview(boxBtn004)

		// boxBtn005 (M)
		let boxBtn005 = BoxButton(frame: CGRect(
			x: view.frame.width/3, y:  (view.frame.height - view.frame.height/2)/2, width: view.frame.width/3, height: view.frame.height/4))
		boxBtn005.setTitle("Submit", for: .normal)//SUBMIT
		
		url = URL(string: remoteParamBckgrdImgs[4])
		
		boxBtn005.kf.setBackgroundImage(with: url, for: .normal)
		boxBtn005.addTarget(
			self,
			action: #selector(submitButtonTapped),
			for: .touchUpInside)
		view.addSubview(boxBtn005)

		// boxBtn006 (R)
		let boxBtn006 = BoxButton(frame: CGRect(
		x: (view.frame.width - view.frame.width/3), y:  (view.frame.height - view.frame.height/2)/2, width: view.frame.width/3, height: view.frame.height/4))
		
		url = URL(string: remoteParamBckgrdImgs[5])
		
		boxBtn006.kf.setBackgroundImage(with: url, for: .normal)
		
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
	
	func setBottomBorderToTextFields(yourTextFieldName: UITextField)  {
		
		let bottomLine = CALayer()
		bottomLine.frame = CGRect(x: 0, y: yourTextFieldName.frame.height - 1, width: yourTextFieldName.frame.width, height: 1)
		bottomLine.backgroundColor = UIColor.gray.cgColor // background color
		yourTextFieldName.borderStyle = UITextField.BorderStyle.none // border style
		yourTextFieldName.layer.addSublayer(bottomLine)
	}
	
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
		
		let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
		
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



