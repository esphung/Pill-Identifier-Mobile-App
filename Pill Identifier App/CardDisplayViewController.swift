// 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP
//  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP
//  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P
// 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP

import UIKit.UIViewController
import Kingfisher

class CardDisplayViewController: NorthSouthViewController {
	
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
		
		print(cellData)
		
		// ================ drug name label
		self.nameLabel = makeNameLabel(message: cellData.text)
		self.south.addSubview(nameLabel)
		
		// ================ color label
		self.colorLabel = makeColorLabel(message: cellData.color)
		self.south.addSubview(colorLabel)
		
		// ================ shape label
		self.shapeLabel = makeShapeLabel(message: cellData.shape)
		self.south.addSubview(shapeLabel)
		
		// ================ imprint label
		self.imprintLabel = makeImprintLabel(message: cellData.imprint)
		self.south.addSubview(imprintLabel)
		
		// ==== ndc11 national drug code number label
		self.ndcLabel = makeNdcLabel(message: test.ndc11)
		//self.south.addSubview(ndcLabel)
		
		// ==== rxcui label (apis and software doc)
		self.rxcuiLabel = makeRxcuiLabel(
			message: String(test.rxcuii))
		//self.south.addSubview(rxcuiLabel)
		
		// ================ labeler rx company
		self.labelerLabel = makeLabelerLabel(
			message: String(test.labeler))
		//self.south.addSubview(labelerLabel)
		
		// ============ load image
		let url = URL(string: cellData.imageUrl)
		let image = UIImage(named: "250x250placeholder.png")
		
		self.imageView = makeDisplayImage(image: image!)
		
		self.imageView.kf.setImage(with: url, placeholder: image)
		self.north.addSubview(imageView)
		
		//imageName = "250x250placeholder.jpg"
		//image = UIImage(named: imageName)
		//self.imageView = makeDisplayImage(image: image!)
		//self.north.addSubview(imageView)
		
		/*
		let url = URL(string: test.imageUrl)
		let image = UIImage(named: "250x250placeholder.png")
		self.imageView.kf.setImage(with: url, placeholder: image)
		self.north.addSubview(imageView)*/
		
    }// end layouts did load
	

	// name label
	func makeNameLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: ((south.frame.height)  * 0.0),
				width: south.frame.width * 0.9,
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
				y: ((south.frame.height)  * 0.1),
				width: south.frame.width * 0.9,
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
				y: ((south.frame.height)  * 0.2),
				width: south.frame.width * 0.9,
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
				y: ((south.frame.height)  * 0.3),
				width: south.frame.width * 0.9,
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
				y: ((south.frame.height)  * 0.2),
				width: (south.frame.width * 0.90),
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
				y: ((south.frame.height)  * 0.4),
				width: (south.frame.width * 0.90),
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
			y: ((south.frame.height)  * 0.6),
			width: (south.frame.width * 0.90),
			height: myDefaultTextFieldHeight))
		
		label.text = "Label:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		label.font = UIFont.systemFont(ofSize: myDefaultTextFontSize)
		
		return label
	}



	
}
