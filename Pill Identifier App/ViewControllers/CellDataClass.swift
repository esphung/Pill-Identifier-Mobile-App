//import  Foundation
import  UIKit

class CellDataClass {
	// class for table results view
	
	var cell:  	Int!
	var name: 	String!
	var image: 	UIImage!
	var imageUrl: String!
	var color:	String!
	var shape:	String!
	var imprint: String!	

	init(
		cell: Int, 
		name:  String,
		image: UIImage,
		imageUrl: String,
		color: String,
		shape: String,
		imprint: String
		)
	{
		if cell > 0 {
			self.cell = cell
		} else {
			self.cell = 0
		}
		
		self.name = name
		self.image =  image
		self.imageUrl = imageUrl
		self.color = color
		self.shape = shape
		self.imprint = imprint
	}

	
	//methods
	func setCell(num: Int) {
		self.cell = num
	}// set
	
	func getCell() -> Int {
		return self.cell
	}// get

	func setName(str: String) {
		self.name = str
	}// set
	
	func getName() -> String {
		return self.name
	}// get


}

/*
let eric = CellDataClass(cell: 2,
	name: "eric",
	image: "example.jpg",
	imageUrl: "https://google.com/",
	color: "Purple",
	shape: "Penumbra Circle",
	imprint: "ABC"
)

eric.setName(str: "Chomsky Gnome")

print(eric.getName())
print(eric.getCell())

print(eric)
*/
