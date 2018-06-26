// 8888b.  88 .dP"Y8 88""Yb 88        db    Yb  dP
//  8I  Yb 88 `Ybo." 88__dP 88       dPYb    YbdP
//  8I  dY 88 o.`Y8b 88"""  88  .o  dP__Yb    8P
// 8888Y"  88 8bodP' 88     88ood8 dP""""Yb  dP

import UIKit.UIViewController

class CardDisplayViewController: NorthSouthViewController {
	
	// information label
	var nameLabel:	UILabel!
	var ndcLabel:	UILabel!
	var rxcuiLabel:	UILabel!
	var labelerLabel:	UILabel!

    override func loadView() {
        super.loadView()
        //self.view.backgroundColor = .white
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()
		setNavigationBar(title: "Pill Description")
		// begin set up here
		
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
		
		// ================ drug name label
		self.nameLabel = makeNameLabel(message: test.name)
		self.south.addSubview(nameLabel)
		
		// ==== ndc11 national drug code number label
		self.ndcLabel = makeNdcLabel(message: test.ndc11)
		self.south.addSubview(ndcLabel)
		
		// ==== rxcui label (apis and software doc)
		self.rxcuiLabel = makeRxcuiLabel(
			message: String(test.rxcuii))
		self.south.addSubview(rxcuiLabel)
		
		// ================ labeler rx company
		self.labelerLabel = makeLabelerLabel(
			message: String(test.labeler))
		self.south.addSubview(labelerLabel)
		
		// ============ load image
		imageName = "against.jpg"
		image = UIImage(named: imageName)
		self.imageView = makeDisplayImage(image: image!)
		self.north.addSubview(imageView)
		
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
		label.text = "Name:\t" + message
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
