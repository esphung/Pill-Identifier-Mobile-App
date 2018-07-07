//  dP""b8 888888 88     88     8888b.     db    888888    db
// dP   `" 88__   88     88      8I  Yb   dPYb     88     dPYb
// Yb      88""   88  .o 88  .o  8I  dY  dP__Yb    88    dP__Yb
//  YboodP 888888 88ood8 88ood8 8888Y"  dP""""Yb   88   dP""""Yb

// contains class def and test harness
class CellDataClass {
	// custom table cell class
	init() {
		
	}
	
	// vars
	private var cell:  	Int!
	private var name: 	String!
	var image:  String! //UIImage!
	var imageUrl: String!
	var color:	String!
	var shape:	String!
	var imprint: String!
	var rxcui: Int!
	var score: Int!
	var limit: Int!

	// overload constructor
	init
	(
		cell: Int, 
		name:  String,
		image: String, //UIImage,
		imageUrl: String,
		color: String,
		shape: String,
		imprint: String,
		rxcui: Int,
		score:  Int,
		limit: Int
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
		self.rxcui  = rxcui
		self.score = score
		self.limit = limit
	}

	// class methods
	func setCell(num: Int) {
		self.cell = num
	}// set cell index
	
	func getCell() -> Int {
		return self.cell
	}// get cell index

	func setName(str: String) {
		self.name = str
	}// set name
	
	func getName() -> String {
		return self.name
	}// get name

}// end class def


// TEST HARNESS
func getIsTestHarnessSuccess() -> Bool {

	// NULL CELL
	//let test = CellDataClass()

	// OVERLOADED CELL
	let eric = CellDataClass(
		cell: 2,
		name: "eric",
		image: "example.jpg .. why though1234",
		imageUrl: "https://google.com/(*&*%^$$%",
		color: "Purple",
		shape: "Penumbra Umbrella",
		imprint: "ABC",
		rxcui: 237849876,
		score: 8,
		limit: 20

	)// OVERLOADED

	// DEBUG PRINT OUT
	//print(test)
	print(eric)

	// assert this new object
	if eric.getName() == "eric" {
		return true
	} else {
		return false
	}

}// end test harness def


//_ = getIsTestHarnessSuccess()


