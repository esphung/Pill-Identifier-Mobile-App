//
//  HomeViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 7/10/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit

// cell data user options
var homeUserOption: CellDataClass {
	
	let data = CellDataClass()
	
	data.setImageUrl(str: remoteTestImageUrls[3])
	
	data.setName(str: "Home")
	
	return data
	
}// end  homeUserOptions

var searchUserOption: CellDataClass {

	let data = CellDataClass()
	
	data.setImageUrl(str: remoteTestImageUrls[0])
	data.setName(str: "Search")
	
	return data
	
}// end  searchUserOptions

// ALL OPTIONS!
var homeOptions = [
	homeUserOption, searchUserOption
]

class HomeViewController: SearchViewController {
	
	func tableView(tableView: UITableViewCell, didSelectRowAt indexPath: IndexPath) {
		print(indexPath.row)
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		return "Home"
	}
	
	func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
	
		return "Eric PHung"
	}
	
	required init?(coder aDecoder: NSCoder) {
		
		super.init(coder: aDecoder)
		
		var i = 0
		
		while i < homeOptions.count {
			
			cellData = CellDataClass()
			
			cellData.setCell(num: i)
			cellData.setImageUrl(str: homeOptions[i].getImageUrl())
			cellData.setName(str: homeOptions[i].getName())
			
			arrayOfCellData.append(cellData)

			i = i + 1
			
		}// end  while loop
		
	}// end super init

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
