
import UIKit
import Alamofire
import SwiftyJSON


class MyTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	let elements = ["horse", "cat", "dog", "potato","horse", "cat", "dog", "potato","horse", "cat", "dog", "potato"]
	
	@IBOutlet var tableView: UITableView!
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.tableView.delegate = self
		self.tableView.dataSource = self
		
	}// end view did load
	
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return elements.count
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! CustomTableViewCell
		
		//cell.cellView.layer.cornerRadius = cell.cellView.frame.height / 2
		cell.pillLbl.text = elements[indexPath.row]
		cell.pillImage.image = UIImage(named: elements[indexPath.row])
		//cell.pillImage.layer.cornerRadius = cell.pillImage.frame.height / 2
		
		return cell
	}
	
	
}
