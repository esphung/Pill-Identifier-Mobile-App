//
//  ResultsTableViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/25/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

//import UIKit.UIViewController
import Kingfisher

@available(iOS 10.0, *)
class ResultsTableViewController: UITableViewController {
	var arrayOfCellData = [CellDataClass]()
	
	//private var myTableView: UITableView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
		self.tableView.separatorColor = UIColor.clear
		
		
		if arrayOfCellData.isEmpty {
			// default results list items and test harness
			arrayOfCellData = [
				CellDataClass(cell: 1, name:  "hello",
							  image: "250x250placeholder.png",
							  //image: #imageLiteral(resourceName: "against"),
					imageUrl: "", color: "", shape: "", imprint: "",
					rxcui: 30303, score: 0, limit: 0),
				CellDataClass(cell: 2, name:  "world",
							  image: "test.jpg",
							  //image: #imageLiteral(resourceName: "test"),
					imageUrl: "", color: "", shape: "", imprint: "",
					rxcui: 13218, score: 0, limit: 0)
			]
		}
	}// end viewdidload
	
	
	// MARK: - Table view data source
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return arrayOfCellData.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		//let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath)
		//tableView.register(UITableViewCell.self, forCellReuseIdentifier: "customCell")
		
		let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
		
		//cell.mainImageView.image = arrayOfCellData[indexPath.row].image
		let image = UIImage(named: "250x250placeholder.png")
		let url = URL(string: arrayOfCellData[indexPath.row].getImageUrl())
		
		cell.mainImageView.kf.setImage(with: url, placeholder: image)
		cell.mainLabel.text = arrayOfCellData[indexPath.row].getName()
		
		return cell
		
	}
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		//print(arrayOfCellData[indexPath.row])
		
		// check imprint
		//var imprint = ""
		/*if arrayOfCellData[indexPath.row].imprint != nil {
		imprint = arrayOfCellData[indexPath.row].imprint!
		}*/
		
		print(arrayOfCellData[indexPath.row].getName())
		let data = CellDataClass(
			cell:  		arrayOfCellData[indexPath.row].getCell(),
			name: 		arrayOfCellData[indexPath.row].getName(),
			image: 		arrayOfCellData[indexPath.row].getImageUrl(),
			imageUrl: 	arrayOfCellData[indexPath.row].getImageUrl(),
			color: 		arrayOfCellData[indexPath.row].getColor(),
			shape: 		arrayOfCellData[indexPath.row].getShape(),
			imprint: 	arrayOfCellData[indexPath.row].getImprint(),
			rxcui:		arrayOfCellData[indexPath.row].getRxcui(),
			score: 		arrayOfCellData[indexPath.row].getScore(),
			limit: 		arrayOfCellData[indexPath.row].limit
		)
		displayCardDisplayPage(data: data)
		
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		/*
		// Configure the cell...
		if arrayOfCellData[indexPath.row].cell == 1 {
		return 200
		} else if arrayOfCellDrata[indexPath.row].cell == 2 {
		return 0.0
		}  else {
		return 200
		}*/
		
		//let customRowHeight = (screenWidth/screenHeight) * self.frame.height
		//print("Current Row Height: ", customRowHeight)
		
		return 85
		
	}
	
	func matches(for regex: String, in text: String) -> [String] {
		
		do {
			let regex = try NSRegularExpression(pattern: regex)
			let results = regex.matches(in: text,
										range: NSRange(text.startIndex..., in: text))
			return results.map {
				String(text[Range($0.range, in: text)!])
			}
		} catch let error {
			print("invalid regex: \(error.localizedDescription)")
			return []
		}
	}
	
	func getName(str: String) -> String {
		var fullName = ""
		
		
		// FIND BASIC NAME
		let matched = matches(for: "([^\\s]+)", in: str)
		//print(splitDeck.left) // ["J", "Q"]
		//print(splitDeck.right) // ["K", "A"]
		
		let deck = matched
		
		
		for (index, element) in deck.enumerated() {
			// if a number split aray in half -> name, dosage
			//print("Item \(index): \(element)")
			
			let num = Int(element)
			if num != nil {
				//print("Valid Integer", index)
				
				let splitDeck = deck.split(pos: index)
				
				for (item) in splitDeck.left {
					fullName = (fullName + " " + item)
				}
				
				//print(fullName)
				return fullName
				
			}
		}
		
		return fullName
	}
	
	func displayCardDisplayPage(data: CellDataClass) {
			let cardDisplayViewController: CardDisplayViewController = storyboard?.instantiateViewController(withIdentifier: "cardDisplayViewController") as! CardDisplayViewController
			
			cardDisplayViewController.arrayData = self.arrayOfCellData
			cardDisplayViewController.cellData = self.arrayOfCellData[data.getCell()]
			
			self.present(
				cardDisplayViewController,
				animated: false,
				completion: nil)
	}
}


