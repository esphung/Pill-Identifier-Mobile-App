/*
file:	Pill.swift
me:		ericphung
date
bcuz:	template for swift class
*/

class Pill {

	// var
	private var name:String!

	// methods
    func setName(name:String!) {
        self.name = name;
    }// set

    func getName() -> String {
    	return self.name
    }// get

}// classdef



func unit_test() {

    // unit_test
    let pill = Pill()
    print(pill.setName(name: "Hello Pill"))
    print(pill.getName())


}



