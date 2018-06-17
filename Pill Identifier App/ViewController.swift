
import UIKit



// Screen width.
public var screenWidth: CGFloat {
    return UIScreen.main.bounds.width
}

// Screen height.
public var screenHeight: CGFloat {
    return UIScreen.main.bounds.height
}

public let midX = UIScreen.main.bounds.midX
public let midY = UIScreen.main.bounds.midY

public let defaultBtnColor = UIColor(displayP3Red: 0.0, green: 122.0/255.0, blue: 122.0/255.0, alpha: 122.0/255.0)

// test vars
public let url = URL(string: "https://rxnav.nlm.nih.gov/REST/rxcui.json?idtype=NDC&id=11523-7020-1")!

// ================= API CALLS AND REQUESTS
func getHttpUrlRequest(url: URL) {

	let config = URLSessionConfiguration.default // Session Configuration
	let session = URLSession(configuration: config) // Load configuration into Session
	//let url = URL(string: "https://rxnav.nlm.nih.gov/REST/rxcui.json?idtype=NDC&id=11523-7020-1")!

	let task = session.dataTask(with: url, completionHandler: {
	    (data, response, error) in

	    if error != nil {
	        print(error!.localizedDescription);   
	    } else {
	        do {
				if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
	            {
					
					for (key, item) in json {
						print("Value: \(item) Key: \(key)")
					}
	            }// end
	        } catch {
	            print("ERROR: error in JSONSerialization")
	        }
	    }
		
	})// end task definition
	task.resume()
}// end getHttpUrlRequest(url: url) definition


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

	// set up layout
	var square: UIView!
	var north:  UIView!

  var squareFrame: CGRect {
  	return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115), width: (screenWidth * 0.90), height: (screenHeight * 0.8))
  }
  var northFrame: CGRect {
  	//let midX = self.view.bounds.midX
	let midY = self.view.bounds.midY
	return CGRect(x: (screenWidth * 0.05), y: (screenHeight * 0.115),width: (screenWidth * 0.90), height: (screenHeight * 0.8)/2) }
	
	override func loadView() {
		super.loadView()
		
		let square = UIView()
		self.view.addSubview(square)
		self.square = square

		let north = UIView()
		self.view.addSubview(north)
		self.north = north

	}
	
    var currentImage: 	UIImage!
    var imageBtn:		UIButton!
    var pillImageView: UIImageView!

    override func viewDidLoad() {


		
		super.viewDidLoad()
		// Do any additional setup after loading the view
		self.square.backgroundColor = .yellow
		self.north.backgroundColor = .green
		
		// debug print stuff
		printScreenDimensions()

    }// end view did load
	
	@objc func imageBtnTapped(_ sender: Any) {

		//getHttpUrlRequest(url: url)
		print("Action:\tSend Button Tapped")
	}


    @objc func uploadBtnTapped(_ sender: Any) {
		// import form photo library
		importImage()
    	print("Action:\tUpload Button Tapped")

    }// end upload button action

    func importImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary

		present(imagePicker, animated: false, completion: {})
    }

    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // MARK: - ImagePicker Delegate
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            //inputPillImageView.image = pickedImage
            pillImageView.image = pickedImage
        }
        
		dismiss(animated: false, completion: {
			//self.imageBtn.isEnabled = true
		})
    }
    
    @objc func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:{});
    }
	

	func printScreenDimensions() {
		// debug screen size
		print("\n")
		print("WIDTH: \t",screenWidth)
    	print("HEIGHT: \t",screenHeight)
		print("MID-X:\t",self.view.bounds.midX)
		print("MID-Y:\t",self.view.bounds.midY)
		print("Width(Max X):\t",self.view.bounds.maxX)
		print("Height(Max Y):\t",self.view.bounds.maxY)
		print(self.square.frame)
		print(self.north.frame)

	}

	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
		self.square.frame = self.squareFrame
        self.north.frame = self.northFrame

        // ====================  set up SEND BUTTON
		//imageBtn =  UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
		imageBtn =  UIButton(frame: CGRect(x: north.frame.minX, y: north.frame.minY,width: self.north.frame.width, height: self.north.frame.height))
		imageBtn.layer.borderWidth = 1.0
		imageBtn.setTitleColor(defaultBtnColor, for: .normal)
		imageBtn.setTitleColor(UIColor.lightGray, for: .disabled)
		imageBtn.setTitleColor(UIColor.white, for: .highlighted)
		imageBtn.setTitle("Upload Image", for: .normal)
		imageBtn.titleLabel?.font =  UIFont.systemFont(ofSize: 32, weight: .light)
		imageBtn.addTarget(self, action: #selector(uploadBtnTapped), for: .touchUpInside)
		self.view.addSubview(imageBtn)

		// ====================  set up PILLImageVIEW
		//pillImageView.image = UIImage(named: "test.png")
		pillImageView = UIImageView(frame: CGRect(x: north.frame.minX, y: north.frame.minY,width: self.north.frame.width, height: self.north.frame.height))
		self.view.addSubview(pillImageView)
		
		
    }

/*     override func viewWillAppear(_ animated: Bool) {
	    super.viewWillAppear(animated)

	    // Hide the navigation bar on the this view controller
	    self.navigationController?.setNavigationBarHidden(true, animated: animated)
	}

	override func viewWillDisappear(_ animated: Bool) {
	    super.viewWillDisappear(animated)

	    // Show the navigation bar on other view controllers
	    self.navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	 */


}// end view controller class definition


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
