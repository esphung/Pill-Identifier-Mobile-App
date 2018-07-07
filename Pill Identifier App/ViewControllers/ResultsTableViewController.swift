//
//  ResultsTableViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/25/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

//import UIKit.UIViewController
import Kingfisher

class ResultsTableViewController: UITableViewController {
	var arrayOfCellData = [CellDataClass]()
	
	//private var myTableView: UITableView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
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

		/*
		let cell = tableView.dequeueReusableCell(withIdentifier: "customCell")!
		return cell*/
		
		/*

        // Configure the cell...
		if arrayOfCellData[indexPath.row].cell == 1 {
			let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
			cell.mainImageView.image = arrayOfCellData[indexPath.row].image
			cell.mainLabel.text = arrayOfCellData[indexPath.row].text
			
			return cell
			
		} else if arrayOfCellData[indexPath.row].cell == 2 {
			let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
			cell.mainImageView.image = arrayOfCellData[indexPath.row].image
			cell.mainLabel.text = arrayOfCellData[indexPath.row].text
			
			return cell
		}  else {
			let cell = Bundle.main.loadNibNamed("TableViewCell1", owner: self, options: nil)?.first as! TableViewCell1
			cell.mainImageView.image = arrayOfCellData[indexPsath.row].image
			cell.mainLabel.text = arrayOfCellData[indexPath.row].text
			
			return cell
		}
		*/
		
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
			image: 		arrayOfCellData[indexPath.row].image!,
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
			return 100
		}  else {
			return 200
		}*/
		
		return 85

	}
	
	func displayCardDisplayPage(data: CellDataClass) {
		let cardDisplayViewController: CardDisplayViewController = storyboard?.instantiateViewController(withIdentifier: "cardDisplayViewController") as! CardDisplayViewController
		
		cardDisplayViewController.cellData = data
		
		self.present(
			cardDisplayViewController,
			animated: false,
			completion: nil)
	}
}


