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
	
    override func loadView() {
        super.loadView()
        //self.view.backgroundColor = .white
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
			
			// load for image
			url = URL(string: cellData.imageUrl)
			
			imageView = makeDisplayImage(image: image!)
			imageView.kf.setImage(with: url, placeholder: image)
			//imageView.frame.origin = CGPoint(x: 20, y: 20)
			
			north.addSubview(imageView)
			
			// DRUG NAME  (ALSO REGEX THE BASE NAMEr)
			nameLabel = makeNameLabel(message: cellData.text)
			north.addSubview(nameLabel)
			
			/*
			// ================ color label
			colorLabel = makeColorLabel(message: cellData.color)
			north.addSubview(colorLabel)
			
			
			// ================ shape label
			shapeLabel = makeShapeLabel(message: cellData.shape)
			north.addSubview(shapeLabel)
			
			// ================ imprint label
			imprintLabel = makeImprintLabel(message: cellData.imprint)
			north.addSubview(imprintLabel)
			
			// ==== ndc11 national drug code number label
			ndcLabel = makeNdcLabel(message: test.ndc11)
			north.addSubview(ndcLabel)
			
			// ==== rxcui label (apis and software doc)
			rxcuiLabel = makeRxcuiLabel(
				message: String(test.rxcuii))
			north.addSubview(rxcuiLabel)
			
			// ================ labeler rx company
			labelerLabel = makeLabelerLabel(
				message: String(test.labeler))
			//self.north.addSubview(labelerLabel)
			*/
			
			// set up firstBtn
			showWikipediaBtn =  UIButton(frame: CGRect(
				x: myListIndent,
				y: screenHeight * 0.625,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
			showWikipediaBtn.layer.borderWidth = 2.0;
			//showWikipediaBtn.backgroundColor = UIColor.red
			showWikipediaBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
			
			showWikipediaBtn.titleLabel?.font =  UIFont.systemFont(
				ofSize: 32, weight: .light)
			showWikipediaBtn.addTarget(
				self,
				action: #selector(showWikipediaBtnTapped),
				for: .touchUpInside)
			
			showWikipediaBtn.setTitle("Show Wikipedia", for: .normal)

			
			north.addSubview(showWikipediaBtn)
			
			
		}


		
		//imageName = "250x250placeholder.jpg"
		//image = UIImage(named: imageName)
		//self.imageView = makeDisplayImage(image: image!)
		//self.north.addSubview(imageView)
		
		/*
		let url = URL(string: test.imageUrl)
		let image = UIImage(named: "250x250placeholder.png")
		self.imageView.kf.setImage(with: url, placeholder: image)
		self.north.addSubview(imageView)
		*/
		
    }// end layouts did load
	

	// name label
	func makeNameLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: screenHeight * 0.025,
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
				y: screenHeight * 0.125,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = message
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
				y: screenHeight * 0.225,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = message
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
				y: screenHeight * 0.325,
				width: screenWidth * 0.8,
				height: myDefaultTextFieldHeight))
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = message
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
				y: screenHeight * 0.425,
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
				y: screenHeight * 0.525,
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
			y: screenHeight * 0.625,
			width: screenWidth * 0.8,
			height: myDefaultTextFieldHeight))
		label.text = "Label:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		
		return label
	}
	
	func displayWikipediaPage(base: URL, str: String) {
		// base url
		//let urlString = URL(string: "http://en.wikipedia.org/wiki/")
		let urlString = base
		
		// article url
		//let article      = URL(string: "adderall", relativeTo: urlString)
		let article      = URL(string: str, relativeTo: urlString)
		
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
	}
	
	@objc  func showWikipediaBtnTapped() {
		let baseUrl = URL(string: "http://en.wikipedia.org/wiki/")
		let baseName = "acetaminophen"
		
		// search wikipedia by pill's name
		displayWikipediaPage(base: baseUrl!, str: baseName)
		
	}



	
}
