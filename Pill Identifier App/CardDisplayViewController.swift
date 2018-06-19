
import UIKit



// test harness
struct TestData {
	var name = "Tenofovir disoproxil fumarate 300 MG Oral Tablet [Viread]"
	var ndc11 =	"59762-6733-01"
	var rxcuii =	404013
	var labeler = 	"Greenstone LLC"
	var imageUrl =	"https://rximage.nlm.nih.gov/image/images/gallery/original/61958-0401-01_RXNAVIMAGE10_B81DDC0E.jpg"
}

let test = TestData()

class CardDisplayViewController: NorthSouthViewController {
	
	// information label
	var nameLabel:	UILabel!
	var ndcLabel:	UILabel!
	var rxcuiLabel:	UILabel!
	var labelerLabel:	UILabel!
	
	var imageName: 	String!
	var image:		UIImage!
	var imageView: 	UIImageView!
	

    override func loadView() {
        super.loadView()
		
    }
	
    override func viewDidLoad() {
        super.viewDidLoad()
		// begin set up here
		
		//showFrames()
		//showBorders()
		
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
		self.imageView = makeDisplayImage(image: image)
		self.north.addSubview(imageView)
		
		
		
    }// end layouts did load
	
	func showBorders(){
		myBorders = 1.0
	}

	// name label
	func makeNameLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: 0,
				width: south.frame.width * 0.9,
				height: myDefaultTextFieldHeight))
		label.center = CGPoint(
			x: south.frame.width/2,
			y: south.frame.height * 0.1)
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = "Name:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		
		return label
	}
	
	// ndc11 label
	func makeNdcLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: 0,
				width: south.frame.width * 0.9,
				height: myDefaultTextFieldHeight))
		label.center = CGPoint(
			x: south.frame.width/2,
			y: south.frame.height * 0.2)
		//label.font = UIFont.systemFont(ofSize: 16)
		label.text = "NDC:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		
		return label
	}
	
	// rxcui label
	func makeRxcuiLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: 0,
				width: south.frame.width * 0.9,
				height: myDefaultTextFieldHeight))
		label.center = CGPoint(
			x: south.frame.width/2,
			y: south.frame.height * 0.3)
		//label.font = UIFont.systemFont(ofSize: 16)
		//label.adjustsFontSizeToFitWidth = true
		
		label.text = "Rxcuii:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		
		return label
	}

	// labeler label
	func makeLabelerLabel(message: String) -> UILabel {
		let label = UILabel(
			frame: CGRect(
				x: myListIndent,
				y: 0,
				width: south.frame.width * 0.9,
				height: myDefaultTextFieldHeight))
		label.center = CGPoint(
			x: south.frame.width/2,
			y: south.frame.height * 0.4)
		label.text = "Label:\t" + message
		label.numberOfLines = 1
		label.layer.borderWidth = myBorders
		
		return label
	}

	// image view photo display
	func makeDisplayImage(image:  UIImage) -> UIImageView {
		imageView = UIImageView(frame: CGRect(
			x: myListIndent,
			y: 0,
			width: north.frame.width * 0.9,
			height: north.frame.height))
		imageView.image = image
		imageView.layer.borderWidth = myBorders
		
		return imageView
	}

	
	
}
