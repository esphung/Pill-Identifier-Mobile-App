//
//  PillClass.swift
//  ActionSheetPicker-3.0
//
//  Created by Eric Phung on 7/7/18.
//

import Foundation

class Pill {
	// vars
	var id_num: Double!
	private var name: String!
	private var imageUrlString: String!
	private var color: 			String!
	private var shape: String!
	private var imprint: String!
	private var rxcui: Int!
	private var score: Int!
	
	// initializers
	init() {
		
		let currentDateTime = Date()
		let time = currentDateTime.timeIntervalSinceReferenceDate
		let x = time
		let y = Double(round(100000*x)/10)
		
		print(y) // 1.236
		
		self.id_num = y
		self.name  = ""
		self.imageUrlString = ""
		self.color = ""
		
		self.shape = ""
		self.imprint = ""
		self.rxcui = 0
		self.score = 0
		
	}
	
	init(
		name: String,
		imageUrlString: String,
		color: String,
		shape: String,
		imprint: String,
		rxcui: Int,
		score: Int
		)
	{
		
		let currentDateTime = Date()
		let time = currentDateTime.timeIntervalSinceReferenceDate
		let x = time
		let y = Double(round(100000*x)/10)
		
		//print(y) // 1.236
		
		
		self.id_num = y
		self.name = name
		self.imageUrlString = imageUrlString
		self.color = color
		self.shape = shape
		self.imprint = imprint
		self.rxcui = rxcui
		self.score = score
	}
	
	// setters/getters
	func setName(name: String) {
		self.name = name
	}
	func getName() -> String {
		return self.name
	}

	func setImageUrlString(str: String) {
		self.imageUrlString = str
	}
	func getImageUrlString() -> String {
		return self.imageUrlString
	}

	func getColor() -> String {
		return self.color
	}

	func getShape() -> String {
		return self.shape
	}

	func getImprint() -> String {
		return self.imprint
	}
	
	func getRxcui() -> Int {
		return self.rxcui
	}
	
	func getScore() -> Int {
		return self.score
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






