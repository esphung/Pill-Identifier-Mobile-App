//
//  AppDelegate.swift>
//  Pill Identifier App
//
//  Created by John Doe on 4/8/17.
//  Copyright © 2017 Phung Technology. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
	
	func applicationDidFinishLaunching(_ application: UIApplication) {
		// Create a new window with the size of the current window and set it as our main window
		self.window = UIWindow(frame: UIScreen.main.bounds)
		
		// 2. Instantiate a storyboard that we can use to create our new initial view controller
		let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
		
		
		// 3. Instantiate our new initial view controller based on it's Storyboard ID
		let testViewController: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "testViewController")
		
		// 4. Set our new window's root view controller as our the new controller we just initiated
		self.window?.rootViewController = testViewController

		/*
		// 3. Instantiate our new initial view controller based on it's Storyboard ID
		let uploadFormViewController: UploadFormViewController = mainStoryboard.instantiateViewController(withIdentifier: "uploadFormViewController") as! UploadFormViewController
		
		// 4. Set our new window's root view controller as our the new controller we just initiated
		self.window?.rootViewController = uploadFormViewController
		r*/
		
		// 5. Make our new window visible
		self.window?.makeKeyAndVisible()
		
		// set navbar appearance application-wide
		UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
		// Sets shadow (line below the bar) to a blank image
		UINavigationBar.appearance().shadowImage = UIImage()
		// Sets the translucent background color
		UINavigationBar.appearance().backgroundColor = .clear
		// Set translucent. (Default value is already true, so this can be removed if desired.)
		UINavigationBar.appearance().isTranslucent = true
		
	}
	

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

