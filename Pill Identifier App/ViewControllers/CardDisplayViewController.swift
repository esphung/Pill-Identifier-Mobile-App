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
			
			// DRUG NAME  (ALSO REGEX THE BASE NAME)
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
	
	//  open webpage of a url in safari
	


	
	
	
	

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



	
}
