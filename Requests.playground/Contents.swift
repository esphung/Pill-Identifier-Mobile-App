import UIKit
import Alamofire
import SwiftyJSON

Alamofire.request("http://rximage.nlm.nih.gov/api/rximage/1/rxnav?color=blue&size=17&sizeT=0").responseJSON { response in
	
	if let jsonObject = response.result.value {
		//print("JSON: \(json)")
		let json = JSON(jsonObject)
		
		// look up by key
		print(json["nlmRxImages"])
		print(json["replyStatus"])
		
		
		// If json is .Dictionary
		for (key,subJson):(String, JSON) in json["nlmRxImages"][0] {
			// Do something you want
			print(key,":\t","\tValue:",  subJson)
		}
		
		
	}
}
