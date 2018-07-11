//
//  PillClass.swift
//  ActionSheetPicker-3.0
//
//  Created by Eric Phung on 7/7/18.
//

import Foundation

class Pill: CellDataClass {
	init(){
	private var cell : Int
	private var name: String!
	private var imageUrlString: String!
	private var color: 			String!
	private var shape: String!
	private var imprint: String!
	private var rxcui: Int
	private var score: Int
	
		convenience super.init(
		cell: Int!, name: String!, image: String!, color: String!, shape: String!, imprint: String!, rxcui: Int, score: Int) {
		}
	// end vconvenience init
	
	// initializers
			init () {
		super.init()
		
		print("Created Pill Object")
	
		self.name  = ""
		self.imageUrlString = ""
		self.color = ""
		self.shape = ""
		self.imprint = ""
		self.rxcui = 0
		self.score = 0
		
	}
	
		super.init(
		name: String,
		imageUrlString: String,
		color: String,
		shape: String,
		imprint: String,
		rxcui: Int,
		score: Int
		)
		do {
		

		self.cell =  0
		self.name = name
		self.imageUrlString = imageUrlString
		self.color = color
		self.shape = shape
		self.imprint = imprint
		self.rxcui = rxcui
		self.score = score
	}
	
	// setters/getters
	
	override func setCell(num: Int) {
		self.cell  = 0
	}
	
	override func getCell() -> Int {
		return self.cell
	}
	
	private func setName(name: String) {
		self.name = name
	}
	internal override func getName() -> String {
		return self.name
	}

	func setImageUrlString(str: String) {
		self.imageUrlString = str
	}
	func getImageUrlString() -> String {
		return self.imageUrlString
	}

	override func getColor() -> String {
		return self.color
	}

	override func getShape() -> String {
		return self.shape
	}

	override func getImprint() -> String {
		return self.imprint
	}
	
	override func getRxcui()  -> Int {
		return self.rxcui
	}
	
	override func getScore() -> Int {
		return self.score
	}
	
	deinit {
		print("Destroyed Pill Object")
	}
	
}// end pill clas def

extension Double {
	/// Rounds the double to decimal places value
	func rounded(toPlaces places:Int) -> Double {
		let divisor = pow(10.0, Double(places))
		return (self * divisor).rounded() / divisor
	}
}

// testing

/*

var test = Pill()

var i = 10

while i > 0 {

	i = i - 1s
	
	test  = CellData(
	name: "eric", imageUrlString: "www.google.com", color: "yellow",
	shape: "hyperboloe", imprint: "239jkiou", rxcui: 30303, score: 0)
	
	test = CellData(cell: i)
	print(i, test, test.id_num!)
}

print(test)


*/






