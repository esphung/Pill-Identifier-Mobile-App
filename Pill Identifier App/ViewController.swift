
import UIKit

let sampleLabelMessage = "Sample Label"


class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentImage: UIImage!
    
    @IBOutlet weak var inputPillImageView: UIImageView!
    @IBOutlet weak var inputPillNameText: UITextField!
    @IBOutlet weak var inputPillInscriptionText: UITextField!
    @IBOutlet weak var inputPillColorText: UITextField!
    @IBOutlet weak var inputPillShapeText: UITextField!
	
    @IBOutlet weak var uploadBtn: UIButton!

	var sampleTextLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))

        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)

        //  set name label
        self.sampleTextLabel =  UILabel(frame: CGRect(x: 20, y: 300, width: 300, height: 40))
        self.sampleTextLabel.text = sampleLabelMessage
        self.sampleTextLabel.font = UIFont.systemFont(ofSize: 15)

        //self.view.addSubview(sampleTextLabel)


		
/*
        // VIEW SETUP
        // pill name text view
        inputPillNameText.delegate = self as? UITextFieldDelegate
        inputPillNameText.placeholder = "pill name"
        
        inputPillNameText.adjustsFontForContentSizeCategory = true
        inputPillNameText.adjustsFontSizeToFitWidth = true
        inputPillNameText.allowsEditingTextAttributes = true
        inputPillNameText.autocorrectionType = .no
        inputPillNameText.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        inputPillNameText.backgroundColor = UIColor.clear
        inputPillNameText.textAlignment = .center
        

        // pill inscription
        inputPillInscriptionText.delegate = self as? UITextFieldDelegate
        inputPillInscriptionText.placeholder = "pill inscription"
        
        inputPillInscriptionText.adjustsFontForContentSizeCategory = true
        inputPillInscriptionText.adjustsFontSizeToFitWidth = true
        inputPillInscriptionText.allowsEditingTextAttributes = true
        inputPillInscriptionText.autocorrectionType = .no
        inputPillInscriptionText.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        inputPillInscriptionText.backgroundColor = UIColor.clear
        inputPillInscriptionText.textAlignment = .center
        

        // pill color
        inputPillColorText.delegate = self as? UITextFieldDelegate
        inputPillColorText.placeholder = "pill shape"
        
        inputPillColorText.adjustsFontForContentSizeCategory = true
        inputPillColorText.adjustsFontSizeToFitWidth = true
        inputPillColorText.allowsEditingTextAttributes = true
        inputPillColorText.autocorrectionType = .no
        inputPillColorText.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        inputPillColorText.backgroundColor = UIColor.clear
        inputPillColorText.textAlignment = .center


        // pill shape
        inputPillShapeText.delegate = self as? UITextFieldDelegate
        inputPillShapeText.placeholder = "pill shape"
        
        inputPillShapeText.adjustsFontForContentSizeCategory = true
        inputPillShapeText.adjustsFontSizeToFitWidth = true
        inputPillShapeText.allowsEditingTextAttributes = true
        inputPillShapeText.autocorrectionType = .no
        inputPillShapeText.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        inputPillShapeText.backgroundColor = UIColor.clear
        inputPillShapeText.textAlignment = .center

         */
        
        
        // ================= API CALLS AND SERVER STUFF
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://rxnav.nlm.nih.gov/REST/rxcui.json?idtype=NDC&id=11523-7020-1")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in

            if error != nil {
                print(error!.localizedDescription);   
            } else {
                do {
                    
                    if let json = try JSONSerialization.jsonObject(
                        with: data!, options: .allowFragments) as? [String: Any]
                    {
                        // ================= DO STUFF

                        print(json["idGroup"]!)
                        print(json);

						print("// ================= JSON  RECIEVED!")
						// create pills
                        let pill = Pill()
						
                        pill.setName(name: json["idGroup"] as? String)
						print(pill)

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

        self.view.addSubview(sampleTextLabel)

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

    }// end upload btn func

    func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    @IBAction func signUpButtonTapped(_ sender: Any) {
        
    }// end submit btn func def

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

