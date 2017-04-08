//
//  ViewController.swift
//  Pill Identifier App
//
//  Created by John Doe on 4/8/17.
//  Copyright © 2017 Phung Technology. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var currentImage: UIImage!
    
    
    
    @IBOutlet weak var inputPillImageView: UIImageView!
    @IBOutlet weak var inputPillNameText: UITextField!
    @IBOutlet weak var inputPillInscriptionText: UITextField!
    @IBOutlet weak var inputPillColorText: UITextField!
    @IBOutlet weak var inputPillShapeText: UITextField!
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var uploadBtn: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //Looks for single or multiple taps.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        
        //tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
        
        
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

        
        
        
        
        

        
        
        
        
        
        
        
        // ================= API CALLS AND SERVER STUFF
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "https://rxnav.nlm.nih.gov/REST/rxcui.json?idtype=NDC&id=11523-7020-1")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        //Implement your logic
                        print(json)
                        
                        
                        
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()
    }

    @IBAction func uploadBtnTapped(_ sender: Any) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        
        
        /*
         The sourceType property wants a value of the enum named        UIImagePickerControllerSourceType, which gives 3 options:
         
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
        let pillNameInputStr = inputPillNameText.text
        let pillInscriptionInputStr = inputPillInscriptionText.text
        let pillColorInputStr = inputPillColorText.text
        let pillShapeInputStr = inputPillShapeText.text
        
        
        if (pillNameInputStr!.isEmpty || (pillInscriptionInputStr?.isEmpty)! || (pillColorInputStr?.isEmpty)! || (pillShapeInputStr?.isEmpty)!) {
            let myAlert = UIAlertController(title:"Alert",
                                            message:"All Fields Required!",
                                            preferredStyle:UIAlertControllerStyle.alert
            )
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            myAlert.addAction(okAction)
            
            self.present(myAlert, animated: true, completion: nil)
        }// end if validation
        
        

        //let pillInputImageData = UIImageJPEGRepresentation(inputPillImageView.image!, 1)
        

        
    }// end submit btn func def

    

    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    // MARK: - ImagePicker Delegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //myImageView.contentMode = .scaleAspectFit
            inputPillImageView.image = pickedImage
        }
        
        
        
        /*
         
         Swift Dictionary named “info”.
         We have to unpack it from there with a key asking for what media information we want.
         We just want the image, so that is what we ask for.  For reference, the available options are:
         
         UIImagePickerControllerMediaType
         UIImagePickerControllerOriginalImage
         UIImagePickerControllerEditedImage
         UIImagePickerControllerCropRect
         UIImagePickerControllerMediaURL
         UIImagePickerControllerReferenceURL
         UIImagePickerControllerMediaMetadata
         
         */
        
        
        // ============== PICTRUE TO BE UPLOADED AS DATA TO CLOUD!!!
        //let currentImageData = UIImageJPEGRepresentation(inputPillImageView.image!, 1)
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion:nil)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
    @IBAction func submitBtnTapped(_ sender: Any) {
        print("submitBtn tapped!")
    }

}// end class def

