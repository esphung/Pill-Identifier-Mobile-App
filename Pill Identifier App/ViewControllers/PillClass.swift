//
//  PillClass.swift
//  ActionSheetPicker-3.0
//
//  Created by Eric Phung on 7/7/18.
//

import Foundation

class Pill {
	
	private var cell : Int
	private var name: String!
	private var imageUrlString: String!
	private var color: 			String!
	private var shape: String!
	private var imprint: String!
	private var rxcui: Int
	private var score: Int
	
	init(
		cell: Int!, name: String!, imageUrlString: String!, color: String!, shape: String!, imprint: String!, rxcui: Int, score: Int) {
		
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
	
	func setCell(num: Int) {
		self.cell  = num
	}
	
	func getCell() -> Int {
		return self.cell
	}
	
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
	
	func getRxcui()  -> Int {
		return self.rxcui
	}
	
	func getScore() -> Int {
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





