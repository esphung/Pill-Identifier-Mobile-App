
import UIKit



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentImage: UIImage!
    
    @IBOutlet weak var inputPillImageView: UIImageView!
    @IBOutlet weak var uploadBtn: UIButton!

	//var photoLibBtn = UIButton()
	var sampleTextLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
		
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))

        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

        //  set up view
		self.sampleTextLabel =  UILabel(frame: CGRect(x: 20, y: 300, width: 300, height: 40))
        self.sampleTextLabel.text = "Sample Label"
        self.sampleTextLabel.font = UIFont.systemFont(ofSize: 15)
		
		/*
		self.photoLibBtn = UIButton(frame: CGRect(x: 20, y: 300, width: 300, height: 40))
		self.photoLibBtn.setTitle ("Button", for:.normal)
		self.view.addSubview(photoLibBtn)
		*/

        // ================= API CALLS AND SERVER REQUEST
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://rxnav.nlm.nih.gov/REST/rxcui.json?idtype=NDC&id=11523-7020-1")!
		
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in

            if error != nil {
                print(error!.localizedDescription);   
            } else {
                do {
					if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
						
//
						for (key, item) in json {
							print("Value: \(item) Key: \(key)")
						}
                    }// end
                } catch {
                    print("error in JSONSerialization")
                }
                
                
            }
            
        })
            task.resume()
        }

        // ================= METHODS OF VIEW AND CTRL CARD

    @IBAction func uploadBtnTapped(_ sender: Any) {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary

        /*
         The sourceType property wants a value of the enum named UIImagePickerControllerSourceType, which gives 3 options:
         
         UIImagePickerControllerSourceType.PhotoLibrary
         UIImagePickerControllerSourceType.Camera
         UIImagePickerControllerSourceType.SavedPhotosAlbum
         
         */
        present(imagePicker, animated: true, completion: nil)

    }// end upload

    func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }


    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // MARK: - ImagePicker Delegate
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            inputPillImageView.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
}// end class def

