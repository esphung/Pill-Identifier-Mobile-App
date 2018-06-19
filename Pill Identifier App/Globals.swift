//  dP""b8 88      dP"Yb  88""Yb    db    88     .dP"Y8
// dP   `" 88     dP   Yb 88__dP   dPYb   88     `Ybo."
// Yb  "88 88  .o Yb   dP 88""Yb  dP__Yb  88  .o o.`Y8b
//  YboodP 88ood8  YbodP  88oodP dP""""Yb 88ood8 8bodP'

public var debug = true

//import Foundation
import UIKit.UIViewController

// Screen width.
public var screenWidth: CGFloat {
	return UIScreen.main.bounds.width
}
// Screen height.
public var screenHeight: CGFloat {
	return UIScreen.main.bounds.height
}

public let myDefaultTextFieldHeight = CGFloat(myDefaultTextFontSize + (myDefaultTextFontSize * 0.26))

public let myDefaultTextFontSize = CGFloat(24.0)

public let myListIndent = CGFloat(20.0)

public var myBorders = CGFloat(0.0)

public var padding  = CGFloat(0.025)

public let colorKeys = ["BULLET", "CAPSULE", "CLOVER", "DIAMOND", "DOUBLE CIRCLE", "FREEFORM", "GEAR", "HEPTAGON"," HEXAGON", "OCTAGON"," OVAL", "PENTAGON", "RECTANGLE", "ROUND", "SEMI-CIRCLE", "SQUARE", "TEAR", "TRAPEZOID", "TRIANGLE" ]

// test harness
struct TestData {
	var name = """
	Tenofovir disoproxil fumarate 300 MG Oral Tablet [Viread]
	"""
	var ndc11 =	"59762-6733-01"
	var rxcuii =	404013
	var labeler = 	"Greenstone LLC"
	var imageUrl =	"""
	https://rximage.nlm.nih.gov/image/images/gallery/
	original/61958-0401-01_RXNAVIMAGE10_B81DDC0E.jpg
	"""
}

let test = TestData()

