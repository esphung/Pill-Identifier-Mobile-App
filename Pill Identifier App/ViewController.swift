
import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
		backgroundImage.image = UIImage(named: "background.png")
		backgroundImage.contentMode = UIView.ContentMode.scaleToFill
		self.view.insertSubview(backgroundImage, at: 0)
		
    }// end view did load
	
}
