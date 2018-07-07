// 888888 888888 .dP"Y8 888888 Yb    dP 88 888888 Yb        dP
//   88   88__   `Ybo."   88    Yb  dP  88 88__    Yb  db  dP
//   88   88""   o.`Y8b   88     YbdP   88 88""     YbdPYbdP
//   88   888888 8bodP'   88      YP    88 888888    YP  YP

import UIKit.UIViewController

class TestViewController: NorthSouthViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
		backgroundImage.image = UIImage(named: "background.jpg")
		self.view.insertSubview(backgroundImage, at: 0)

		var searchPageBtn = UIButton()
		var resultsBtn = 	UIButton()
		var displayBtn = UIButton()
		var showWikipediaBtn = UIButton()

				// set up searchPageBtn
		showWikipediaBtn =  UIButton(frame: CGRect(
			x:20,
			y: screenHeight * 0.525,
			width: screenWidth * 0.8,
			height: 44))
		showWikipediaBtn.layer.borderWidth = 2.0;
		showWikipediaBtn.backgroundColor = UIColor.gray
		showWikipediaBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
		showWikipediaBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		showWikipediaBtn.addTarget(
			self,
			action: #selector(showWikipediaBtnTapped),
			for: .touchUpInside)
		
		showWikipediaBtn.setTitle("Show Wikipedia", for: .normal)

		// set up searchPageBtn
		searchPageBtn =  UIButton(frame: CGRect(
			x: 20,
			y: screenHeight * 0.225,
			width: screenWidth * 0.8,
			height: 44))
		searchPageBtn.layer.borderWidth = 2.0;
		searchPageBtn.backgroundColor = UIColor.red
		//searchPageBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		
		searchPageBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		searchPageBtn.addTarget(
			self,
			action: #selector(searchPageBtnTapped),
			for: .touchUpInside)
		
		searchPageBtn.setTitle("Find Information 💊", for: .normal)

		// set up displayBtn
		displayBtn =  UIButton(frame: CGRect(
			x: 20,
			y: screenHeight * 0.425,
			width: screenWidth * 0.8,
			height: 44))
		displayBtn.layer.borderWidth = 2.0;
		displayBtn.backgroundColor = UIColor.red
		displayBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)

		displayBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		displayBtn.addTarget(
			self,
			action: #selector(cardDisplayPageBtnTapped),
			for: .touchUpInside)

		displayBtn.setTitle("Display Page", for: .normal)
		
		// set up resultsBtn
		resultsBtn =  UIButton(frame: CGRect(
			x: 20,
			y: screenHeight * 0.325,
			width: screenWidth * 0.8,
			height: 44))
		resultsBtn.layer.borderWidth = 2.0;
		resultsBtn.backgroundColor = UIColor.red
		resultsBtn.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
		resultsBtn.setTitle("Results Page", for: .normal)
		
		resultsBtn.titleLabel?.font =  UIFont.systemFont(
			ofSize: 32, weight: .light)
		resultsBtn.addTarget(
			self,
			action: #selector(resultsBtnTapped),
			for: .touchUpInside)
		

		let copyright = copyrightLabel()
		myView.addSubview(copyright)
		

		north.addSubview(searchPageBtn)
		//north.addSubview(displayBtn)

		//resultsBtn.isEnabled = false
		//north.addSubview(resultsBtn)

		//north.addSubview(showWikipediaBtn)
		

		
	}// end view did load

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
	
	@objc func buttonDidPress(){}

	@objc func resultsBtnTapped(Sender: UIButton) {
		displayResultsPage()
	}
	
	@objc func cardDisplayPageBtnTapped(Sender: UIButton) {
		displayCardDisplayPage()
	}

	@objc func searchPageBtnTapped() {
		displaySearchFormPage()
	}

	func displayCardDisplayPage() {
		let cardDisplayViewController: CardDisplayViewController = storyboard?.instantiateViewController(withIdentifier: "cardDisplayViewController") as! CardDisplayViewController
		self.present(
			cardDisplayViewController,
			animated: false,
			completion: nil)
	}
	
	func displayResultsPage() {
		let resultsTableViewController: ResultsTableViewController = storyboard?.instantiateViewController(withIdentifier: "resultsTableViewController") as! ResultsTableViewController
		self.present(
			resultsTableViewController,
			animated: false,
			completion: nil)
	}
	
	 

}
