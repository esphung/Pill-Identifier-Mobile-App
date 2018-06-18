import UIKit
import Alamofire
import SwiftyJSON


func getUrlJsonArray(url:String){
	// get request from server as Any object
	Alamofire.request(url).responseJSON { response in
		if let json = response.result.value {
			//print("JSON: \(json)")
			let jsonArray = JSON.init(json)// list of Tuples
			print("Results Found: ",jsonArray.count)
			
			// do stuff here
			for item in jsonArray {
				// item is a tuple (String,JSON)
				print(item)
			}
			//print(jsonArray[0])

		}
	}
}

getUrlJsonArray(url: "https://jsonplaceholder.typicode.com/posts?userId=1")
