//
//  ResultsTableViewController.swift
//  Pill Identifier App
//
//  Created by Eric Phung on 6/25/18.
//  Copyright © 2018 Phung Technology. All rights reserved.
//

import UIKit.UIViewController
import Kingfisher

struct cellData {
	let cell:  	Int!
	let text: 	String!
	let image: 	UIImage!
	let imageUrl: String!
	let color:	String!
	let shape:	String!
	let imprint: String!
}

class ResultsTableViewController: UITableViewController {
	var arrayOfCellData = [cellData]()
	
	//private var myTableView: UITableView!
	
	/*
	override func viewWillAppear(_ animated: Bool) {
		tableView.reloadData()
		//print("Data Reloaded")
	}*/
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		let tableView = UITableView()
		
		
		tableView.separatorStyle = .singleLine
		//tableView.translatesAutoresizingMaskIntoConstraints =  false
		tableView.contentInset = UIEdgeInsets(top: screenHeight/24, left: 120, bottom: 120, right: -120);

		if arrayOfCellData.isEmpty {
			// default results list items and test harness
			arrayOfCellData = [
				cellData(cell: 1, text:  "hello", image: #imageLiteral(resourceName: "against"), imageUrl: "", color: "", shape: "", imprint: ""),
				cellData(cell: 2, text:  "world", image: #imageLiteral(resourceName: "test"),  imageUrl: "", color: "", shape: "", imprint: "")
			]
		}

		let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeRight.direction = UISwipeGestureRecognizer.Direction.right
		self.view.addGestureRecognizer(swipeRight)
		
		/*
		let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeDown.direction = UISwipeGestureRecognizer.Direction.down
		//self.view.addGestureRecognizer(swipeDown)
		
		let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeUp.direction = UISwipeGestureRecognizer.Direction.up
		//self.view.addGestureRecognizer(swipeUp)
		
		let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture))
		swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
		//self.view.addGestureRecognizer(swipeLeft)
		*/
		
		
		/*
		refreshControl = UIRefreshControl()
		refreshControl?.attributedTitle = NSAttributedString(
			string: "Pull Refresh")
		refreshControl?.addTarget(
			self,
			action: #selector(refresh),
			for: UIControl.Event.valueChanged)
		
		tableView.addSubview(self.refreshControl!)
		*/


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
		let url = URL(string: arrayOfCellData[indexPath.row].imageUrl)
		cell.mainImageView.kf.setImage(with: url, placeholder: image)
		
		cell.mainLabel.text = arrayOfCellData[indexPath.row].text
		
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
		var imprint = ""
		if arrayOfCellData[indexPath.row].imprint != nil {
			imprint = arrayOfCellData[indexPath.row].imprint!
		}
		
		print(arrayOfCellData[indexPath.row].text!)
		let data = cellData(
			cell:  		arrayOfCellData[indexPath.row].cell!,
			text: 		arrayOfCellData[indexPath.row].text!,
			image: 		arrayOfCellData[indexPath.row].image!,
			imageUrl: 	arrayOfCellData[indexPath.row].imageUrl!,
			color: 		arrayOfCellData[indexPath.row].color!,
			shape: 		arrayOfCellData[indexPath.row].shape!,
			imprint: 	imprint
		)
		displayCardDisplayPage(data: data)
		
	}

	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		
		/*
		// Configure the cell...
		if arrayOfCellData[indexPath.row].cell == 1 {
			return 200
		} else if arrayOfCellData[indexPath.row].cell == 2 {
			return 100
		}  else {
			return 200
		}*/
		
		return 100

	}
	
	func displayCardDisplayPage(data: cellData) {
		let cardDisplayViewController: CardDisplayViewController = storyboard?.instantiateViewController(withIdentifier: "cardDisplayViewController") as! CardDisplayViewController
		
		cardDisplayViewController.cellData = data
		
		self.present(
			cardDisplayViewController,
			animated: true,
			completion: nil)
	}


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
	

	@objc override func respondToSwipeGesture(gesture: UIGestureRecognizer) {
		if let swipeGesture = gesture as? UISwipeGestureRecognizer {
			switch swipeGesture.direction {
			case UISwipeGestureRecognizer.Direction.right:
				self.dismiss(animated: true, completion: nil)
				print("Swiped right")
			case UISwipeGestureRecognizer.Direction.down:
				print("Swiped down")
			case UISwipeGestureRecognizer.Direction.left:
				print("Swiped left")
			case UISwipeGestureRecognizer.Direction.up:
				print("Swiped up")
			default:
				break
			}
		}
	}

}


