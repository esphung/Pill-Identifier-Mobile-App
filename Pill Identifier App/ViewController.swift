//
//  ViewController.swift
//  Pill Identifier App
//
//  Created by John Doe on 4/8/17.
//  Copyright © 2017 Phung Technology. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var inputPillImageView: UIImageView!
    @IBOutlet weak var inputPillNameText: UITextField!
    @IBOutlet weak var inputPillInscriptionText: UITextField!
    @IBOutlet weak var inputPillColorText: UITextField!
    @IBOutlet weak var inputPillShapeText: UITextField!
    
    var currentImage: UIImage!



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
        
        
        
        
        title = "YACIFP"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(importPicture))
        
        
        
        
        
        
        
        
        
        
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

    func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let image = info[UIImagePickerControllerEditedImage] as? UIImage else { return }
        
        dismiss(animated: true)
        
        currentImage = image
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
        
        
        


        
        let pillInputImageData = UIImageJPEGRepresentation(currentImage, 1)
        
        if (pillInputImageData != nil) {
            // what to do if picture is submitted
            // create (PFFFile?) object to be sent to cloud service
            print("PICTURE SUCCESSFULLY FOUND!")
        }// end def for if picture is submitted by users
        
        
    }// end submit btn func def

    
    
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    func setUpTextFieldInput(sender: UITextField) {
        inputPillNameText.delegate = self as? UITextFieldDelegate
        inputPillNameText.placeholder = "pill name"
        inputPillNameText.adjustsFontForContentSizeCategory = true
        inputPillNameText.adjustsFontSizeToFitWidth = true
        inputPillNameText.allowsEditingTextAttributes = true
        inputPillNameText.autocorrectionType = .no
        inputPillNameText.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        inputPillNameText.backgroundColor = UIColor.clear
        
    }// end btn set up
    
    

}// end class def

