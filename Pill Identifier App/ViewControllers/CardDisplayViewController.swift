// 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP
//  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP
//  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P
// 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP

//import UIKit.UIViewController
import Kingfisher

@available(iOS 10.0, *)
class CardDisplayViewController: NorthSouthViewController {
	
	var url: URL!
	
	//  incoming variables
	var cellData: CellDataClass!
	var arrayData: [CellDataClass]!

	var middleBoxBtn = UIButton()
	var rightBoxBtn = UIButton()
	var leftBoxBtn = UIButton()
	
	var pillImageView: UIImageView!
	var altImage:  	UIImage!

    override func loadView() {
		
        super.loadView()
		
    }
	
    override func viewDidLoad() {
		
        super.viewDidLoad()
		// begin set up here
		
		//let sv = CardDisplayViewController.displaySpinner(onView: self.view)
		
		//setNavigationBar(title: "Pill Description")
		let pillImageView = UIImageView()
		
		pillImageView.kf.indicator?.startAnimatingView()
		
		altImage = UIImage(named: placeholder)
		
		
		
		view.addSubview(pillImageView)
		//showFrames()
		
		
		//CardDisplayViewController.removeSpinner(spinner: sv)
		pillImageView.kf.indicator?.stopAnimatingView()
		
    }// end  viewdidload

    override func viewDidLayoutSubviews() {
		
        super.viewDidLayoutSubviews()
		
		let sv = CardDisplayViewController.displaySpinner(onView: self.view)

		// COPYRIGHT/ FOOTER
		let copyright = copyrightLabel()
		
		view.addSubview(copyright)
	
		// LOAD THE IMAGE
		url = URL(string: cellData.getImageUrl())
		
		//pillImageView = makeDisplayImage(image: altImage!)
		
		pillImageView = UIImageView(frame: CGRect(
			x: 0,
			y: 0,
			width: view.frame.width,
			height: view.frame.height/2))
		
		pillImageView.image = UIImage(named: placeholder)
		//imageView.contentMode = UIView.ContentMode.scaleAspectFit
		
		pillImageView.kf.setImage(with: url, placeholder: UIImage(named: placeholder))
		//pillImageView.borderColor = .lightGray
		//pillImageView.borderWidth =  0.0
		//print(pillImageView.frame.height)// 406
		view.addSubview(pillImageView)

		// LEFT BOX BUTTON  (LEFT)
		leftBoxBtn =  UIButton(frame: CGRect(
			
			x: 0,
			y: view.frame.height - view.frame.height/4,
			width: view.frame.width/3,
			height: view.frame.height/4))
		
		//submitButton.layer.borderWidth = 0.0
		
		leftBoxBtn.setTitleColor(UIColor.black, for: .normal)
		leftBoxBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		leftBoxBtn.setTitleColor(UIColor.white, for: .highlighted)
		
		leftBoxBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 19,
			weight: .light)
		
		leftBoxBtn.borderWidth = 0.0
		leftBoxBtn.borderColor = .lightGray
		leftBoxBtn.addTarget(
			self,
			action: #selector(leftBoxBtnTapped),
			for: .touchUpInside)
		
		leftBoxBtn.setImage(UIImage(named: placeholder), for: .normal)
		view.addSubview(leftBoxBtn)
		

		// WIKIPEDIA PAGE BUTTON  (MIDDLE)
		middleBoxBtn =  UIButton(frame: CGRect(
			
			x: view.frame.width/3,
			y: view.frame.height - view.frame.height/4,
			width: view.frame.width/3,
			height: view.frame.height/4))
		
		middleBoxBtn.setTitleColor(UIColor.black, for: .normal)
		middleBoxBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		middleBoxBtn.setTitleColor(UIColor.white, for: .highlighted)
		
		
		middleBoxBtn.setImage(UIImage(named: placeholder), for: .normal)

		middleBoxBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 19,
			weight: .light)
		
		middleBoxBtn.borderWidth = 0.0
		middleBoxBtn.borderColor = .lightGray
		middleBoxBtn.addTarget(
			self,
			action: #selector(middleBoxBtnTapped),
			for: .touchUpInside)
		
		view.addSubview(middleBoxBtn)

		// RIGHT BOX BUTTON  (RIGHT)
		rightBoxBtn =  UIButton(frame: CGRect(
			x: view.frame.width - view.frame.width/3,
			y: view.frame.height - view.frame.height/4,
			width: view.frame.width/3,
			height: view.frame.height/4))
		rightBoxBtn.setTitleColor(UIColor.black, for: .normal)
		rightBoxBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		rightBoxBtn.setTitleColor(UIColor.white, for: .highlighted)
		rightBoxBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 19,
			weight: .light)
		
		rightBoxBtn.borderWidth = 0.0
		rightBoxBtn.borderColor = .lightGray
		rightBoxBtn.addTarget(
			self,
			action: #selector(rightBoxBtnTapped),
			for: .touchUpInside)

		rightBoxBtn.setImage(UIImage(named: placeholder), for: .normal)
		view.addSubview(rightBoxBtn)

		CardDisplayViewController.removeSpinner(spinner: sv)

    }// end layouts did load
	
	func showData(data: CellDataClass){
		
		
		let sv = CardDisplayViewController.displaySpinner(onView: self.view)


		pillImageView.removeFromSuperview()
		
		
		let data = CellDataClass(
			
			cell:  		data.getCell(),
			name: 		data.getName(),
			image: 		data.getImageUrl(),
			imageUrl: 	data.getImageUrl(),
			color: 		data.getColor(),
			shape: 		data.getShape(),
			imprint: 	data.getImprint(),
			rxcui:		data.getRxcui(),
			score: 		data.getScore(),
			limit: 		data.limit
			
		)
		
		url = URL(string: data.getImageUrl())
		//pillImageView = makeDisplayImage(image: altImage!)
		pillImageView.kf.setImage(with: url, placeholder: UIImage(named: placeholder))
		//pillImageView.borderColor = .lightGray
		//pillImageView.borderWidth =  0.0
		//print(pillImageView.frame.height)// 406
		
		view.addSubview(pillImageView)
		
		CardDisplayViewController.removeSpinner(spinner: sv)

	}
	
	// move left in pill list
	func goLeft() {
		
		let pos = cellData.getCell() - 1
		
		if (pos) >= 0 {
			
			cellData = arrayData[pos]
			
			showData(data: cellData)
			
			print(pos)
			
		}
	}// end  go left
	
	@objc func leftBoxBtnTapped(){
		goLeft()
		
	}// end left btn
	
	@objc func middleBoxBtnTapped() {
		displaySearchFormPage()
	}
	
	// move right in pill list
	func goRight() {
		
		let pos = cellData.getCell() + 1

		if (pos) < arrayData.count {
		
			cellData = arrayData[pos]
			
			showData(data: cellData)
			
			print(pos)
			
		}
		
	}// end  go right
	
	@objc func rightBoxBtnTapped() {
		
		goRight()
		
	}

	func displayWikipediaPage(base: URL, str: String) {

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
		
					UIApplication.shared.open(url, options: [:], completionHandler: nil)
			} else {
				print("could not open url, it was nil")
			}
			
		} else {
			
			//self.dismiss(animated: true, completion: nil)
			print("Invalid Name: "  + name)
			
			return
		}

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
				fullName.removeFirst()
				
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

extension CardDisplayViewController {
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
	
}
