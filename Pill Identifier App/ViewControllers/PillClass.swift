//
//  PillClass.swift
//  ActionSheetPicker-3.0
//
//  Created by Eric Phung on 7/7/18.
//

import UIKit

class Pill {
	private var name: String!
	var imageUrlString: String!
	var color: 			String!
	var  shape: String!
	var  imprint: String!
	var rxcui: Int!
	var score: Int
	
	init() {
		self.name  = ""
		self.imageUrlString = ""
		self.color = ""
		
		self.shape = ""
		self.imprint = ""
		self.rxcui = 0
		self.score = 0
		
	}
	
	

	/*
	
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
		self.name = name
		self.imageUrlString = imageUrlString
		
		self.color = color
		
		self.shape = shape
		self.imprint = imprint
		self.rxcui = rxcui
		self.score = score
	}
	*/
	func setName(name: String) {
		self.name = name
	}
	func getName() -> String {
		return self.name
	}
}
