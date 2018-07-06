// 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP
//  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP
//  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P
// 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP

import UIKit.UIViewController
import Kingfisher

class CardDisplayViewController: NorthSouthViewController {

	
	var url: URL!
	
	// information labels
	var ndcLabel:	UILabel!
	var rxcuiLabel:	UILabel!
	var labelerLabel:	UILabel!
	
	//  incoming variables
	var cellData: cellData!
	
	var nameLabel:	UILabel!
	var colorLabel: UILabel!
	var shapeLabel: UILabel!
	var imprintLabel: UILabel!
	
	var myPillView: UIView!
	var showWikipediaBtn = UIButton()
	
	// regexp
	
	@objc var name: String!
	var dosage: String!

    override func loadView() {
        super.loadView()
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()
		// begin set up here
		setNavigationBar(title: "Pill Description")
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
		
		// ============ CHECK IF CELLDATA
		if cellData != nil {
			
			// LOAD DRUG NAME
			name = getName(str: cellData.text!)// pull through input
			
			name = getStringRemovedFromSpecialChars(text: name)// sanitize
			name = name.replace(target: "HR", withString: "")
			name = name.replace(target: "MG", withString: "").capitalized// also lowers
			name = name.trimmingCharacters(in: .whitespacesAndNewlines)// trim whitespace
			
			//nameLabel.textColor = UIColor.red
			nameLabel = makeNameLabel(message: "Name:\t" + name)
			
			// LOAD THE IMAGE
			url = URL(string: cellData.imageUrl)
			
			imageView = makeDisplayImage(image: image!)
			imageView.kf.setImage(with: url, placeholder: image)
			imageView.frame.origin = CGPoint(x: myListIndent, y: screenHeight/12)

			
			//  LOAD DOSAGE
			dosage = getDosage(str: cellData.text!)
			let dosageLabel = getDosageLabel(message: dosage)
			
			// LOAD COLOR
			colorLabel = makeColorLabel(message: cellData.color)
			north.addSubview(colorLabel)
			
			// shape label
			shapeLabel = makeShapeLabel(message: cellData.shape)
			north.addSubview(shapeLabel)
			
			// imprint label
			imprintLabel = makeImprintLabel(message: cellData.imprint)
			north.addSubview(imprintLabel)
			
			// ndc11 national drug code number label
			ndcLabel = makeNdcLabel(message: test.ndc11)
			north.addSubview(ndcLabel)
			
			// rxcui label (apis and software doc)
			rxcuiLabel = makeRxcuiLabel(
				message: String(test.rxcuii))
			north.addSubview(rxcuiLabel)
			
			// labeler rx company
			labelerLabel = makeLabelerLabel(
				message: String(test.labeler))
			self.north.addSubview(labelerLabel)
			
			// WIKIPEDIA PAGE BUTTON
			showWikipediaBtn =  UIButton(frame: CGRect(
				x: screenWidth * 0.8 * 0.333 - myListIndent,
				y: screenHeight * 0.8,
				width: screenWidth * 0.8 * 0.666,
				height: myDefaultTextFieldHeight))
			//submitButton.layer.borderWidth = 2.0
			showWikipediaBtn.setTitleColor(UIColor.black, for: .normal)
			showWikipediaBtn.setTitleColor(UIColor.lightGray, for: .disabled)
			showWikipediaBtn.setTitleColor(UIColor.white, for: .highlighted)
			showWikipediaBtn.setTitle("Submit", for: .normal)
			showWikipediaBtn.titleLabel?.font =  UIFont.systemFont(
				ofSize: myDefaultTextFontSize,
				weight: .light)
			
			showWikipediaBtn.borderWidth = 1.0
			showWikipediaBtn.borderColor = .lightGray
			showWikipediaBtn.addTarget(
				self,
				action: #selector(showWikipediaBtnTapped),
				for: .touchUpInside)
			showWikipediaBtn.setTitle("Wikipedia", for: .normal)

			// ============================ SET VIEW OBJECTS
			north.addSubview(imageView)
			north.addSubview(nameLabel)
			
			north.addSubview(showWikipediaBtn)
			north.addSubview(dosageLabel)
		}
    }// end layouts did load
	
	// dosage func
	func getDosageLabel(message: String) -> UILabel {
		let dosageLbl = UILabel(
		frame: CGRect(
		x: myListIndent,
		y: screenHeight * (0.1),
		width: screenWidth * 0.8,
		height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		dosageLbl.text = "Dose:\t" + message
		dosageLbl.numberOfLines = 1
		dosageLbl.layer.borderWidth = myBorders
		dosageLbl.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		return dosageLbl
	}
	

	// name label
	func makeNameLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: screenHeight * 0,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		
		return label
	}

	// color label
	func makeColorLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: screenHeight * (0.025),
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = "Color:\t"  + message.capitalized
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		
		return label
	}
	
	// shape label
	func makeShapeLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: screenHeight * 0.05,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = "Shape:\t" + message.capitalized
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		
		return label
	}
	
	// imprint label
	func makeImprintLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: screenHeight * 0.15,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		if message.isEmpty {
			label.text = "Imprint:\t"
		} else if message == "no-imprint" {
			label.text = "Imprint:\tNO IMPRINT"
		} else {
			label.text = "Imprint:\t" + message
		}
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		
		return label
	}
	
	// ndc11 label
	func makeNdcLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: screenHeight * 0.125,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = "NDC:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		
		return label
	}
	
	// rxcui label
	func makeRxcuiLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: screenHeight * 0.175,
				//y: screenHeight * 0.075,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		//label.adjustsFontSizeToFitWidth = true
		
		label.text = "Rxcuii:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		
		return label
	}

	// labeler label
	func makeLabelerLabel(message: String) -> UILabel {
		let label = UILabel(frame: CGRect(
			x: myListIndent,
			y: screenHeight * 0.075,
			
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		label.text = "Label:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		
		return label
	}
	
	func displayWikipediaPage(base: URL, str: String) {
		// only does first term right now
		let matched = matches(for: "([^\\s]+)", in: str)
		
		// check for nil
		guard let name = matched.first else {
			print("name failed guard")
			return
		}
		
		// validate name
		if isValid(name: name) {
			print("Valid: ", name)
			// base url
			//let urlString = URL(string: "http://en.wikipedia.org/wiki/")
			let urlString = base
			
			// article url
			//let article      = URL(string: "adderall", relativeTo: urlString)
			let article      	= URL(string: name, relativeTo: urlString)
			
			// string from article url
			let articleString = article?.absoluteString
			//ArticleString now contains: baseurl + article
			
			if let url = URL(string: articleString!) {
				if #available(iOS 10.0, *) {
					UIApplication.shared.open(url, options: [:], completionHandler: nil)
				} else {
					UIApplication.shared.openURL(url)
				}
			} else {
				print("could not open url, it was nil")
			}
			
		} else {
			//self.dismiss(animated: true, completion: nil)
			print("Invalid Name: "  + name)
			
			return
		}
		
		

	}
	
	@objc func showWikipediaBtnTapped() {
		let baseUrl = URL(string: "http://en.wikipedia.org/wiki/")
		//let baseName = "acetaminophen"
		
		// search wikipedia by pill's name
		displayWikipediaPage(base: baseUrl!, str: name)
		
	}
	
	

	func getName(str: String) -> String {
		var fullName = ""
		

		// FIND BASIC NAME
		let matched = matches(for: "([^\\s]+)", in: str)
		
		
		//print(splitDeck.left) // ["J", "Q"]
		//print(splitDeck.right) // ["K", "A"]

		let deck = matched
		
		
		for (index, element) in deck.enumerated() {
			// if a number split aray in half -> name, dosage
			//print("Item \(index): \(element)")
			
			let num = Int(element)
			if num != nil {
				//print("Valid Integer", index)
				
				let splitDeck = deck.split(pos: index)
				
				for (item) in splitDeck.left {
					fullName = (fullName + " " + item)
				}
				
				//print(fullName)
				return fullName
	
			}
		}
		
		return fullName
	}
	
	func getDosage(str:  String) -> String {
		// return dosage of drug
		let matched = matches(for: "[0-9]+[0-9]+[0-9]*.(MG)", in: str)
		
		if matched.first != nil {
			return matched.first!
		}
		else {
			return ""
		}
	}
	
	func getStringRemovedFromSpecialChars(text: String) -> String {
		// return cleaned string  sanitized spec chars
		let okayChars = Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ+-=().!_\n")
		return text.filter {okayChars.contains($0) }
	}

	
	func matches(for regex: String, in text: String) -> [String] {
		
		do {
			let regex = try NSRegularExpression(pattern: regex)
			let results = regex.matches(in: text,
										range: NSRange(text.startIndex..., in: text))
			return results.map {
				String(text[Range($0.range, in: text)!])
			}
		} catch let error {
			print("invalid regex: \(error.localizedDescription)")
			return []
		}
	}
	
	
	
	func isValid(name: String) -> Bool {
		// check the name is between 4 and ... characters
		if !(4...20 ~= name.count) {
			print(name.count)
			return false
		}
		return true
	}

	
}// end class

// ==== CLASS  EXTENSIONS

extension String {
	func removeWhitespaces() -> String {
		return components(separatedBy: .whitespaces).joined()
	}
}

extension String {
	func replace(target: String, withString: String) -> String
	{
		return self.replacingOccurrences(of: target, with: withString)
	}
}

extension String {
	func capitalizingFirstLetter() -> String {
		return prefix(1).uppercased() + dropFirst()
	}
	
	mutating func capitalizeFirstLetter() {
		self = self.capitalizingFirstLetter()
	}
}

extension Array
{
	func split(pos: Int) -> (left: [Element], right: [Element]) {
		let ct = self.count
		let half = ct / 2
		let leftSplit = self[0 ..< half - 1]
		let rightSplit = self[pos ..< ct]
		return (left: Array(leftSplit), right: Array(rightSplit))
	}

}


