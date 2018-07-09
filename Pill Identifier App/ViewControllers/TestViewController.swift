// 888888 888888 .dP"Y8 888888 Yb    dP 88 888888 Yb        dP
//   88   88__   `Ybo."   88    Yb  dP  88 88__    Yb  db  dP
//   88   88""   o.`Y8b   88     YbdP   88 88""     YbdPYbdP
//   88   888888 8bodP'   88      YP    88 888888    YP  YP

import UIKit.UIViewController

@available(iOS 11.0, *)
class TestViewController: NorthSouthViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
		backgroundImage.image = UIImage(named: "background.jpg")
		self.view.insertSubview(backgroundImage, at: 0)

		var searchPageBtn = UIButton()

		// set up searchPageBtn
		searchPageBtn =  UIButton(frame: CGRect(
			x: 20,
			y: view.frame.height * 0.225,
			width: view.frame.width * 0.8,
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
		
		searchPageBtn.setTitle("Identify Pill 💊", for: .normal)


		let copyright = copyrightLabel()
		view.addSubview(copyright)
		

		view.addSubview(searchPageBtn)
	

	}// end view did load

	@objc func searchPageBtnTapped() {
		displaySearchFormPage()
	}

	 

}
