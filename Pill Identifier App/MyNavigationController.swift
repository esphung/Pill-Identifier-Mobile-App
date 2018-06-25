//
//  MyNavigationController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/25/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit

class MyNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension UINavigationController {
	
	///Get previous view controller of the navigation stack
	func previousViewController() -> UIViewController?{
		
		let lenght = self.viewControllers.count
		
		let previousViewController: UIViewController? = lenght >= 2 ? self.viewControllers[lenght-2] : nil
		
		return previousViewController
	}
	
}
