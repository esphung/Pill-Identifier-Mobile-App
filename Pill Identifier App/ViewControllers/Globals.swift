//  dP""b8 88      dP"Yb  88""Yb    db    88     .dP"Y8
// dP   `" 88     dP   Yb 88__dP   dPYb   88     `Ybo."
// Yb  "88 88  .o Yb   dP 88""Yb  dP__Yb  88  .o o.`Y8b
//  YboodP 88ood8  YbodP  88oodP dP""""Yb 88ood8 8bodP'

public var debug = false

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

public let centerX = screenWidth / 2;
public let centerY = screenHeight / 2;

public let myDefaultTextFieldHeight = CGFloat(44.0)

public let myDefaultTextFontSize = CGFloat(16.0)

public let myListIndent = CGFloat(20.0)

public let myListPadTop = CGFloat(20.0)

public var myBorders = CGFloat(0.0)

public let shapes = [
	"BULLET",
	"CAPSULE",
	"CLOVER",
	"DIAMOND",
	"DOUBLE CIRCLE",
	"FREEFORM",
	"GEAR",
	"HEPTAGON",
	"HEXAGON", 
	"OCTAGON",
	"OVAL",
	"PENTAGON",
	"RECTANGLE",
	"ROUND",
	"SEMI-CIRCLE",
	"SQUARE",
	"TEAR",
	"TRAPEZOID",
	"TRIANGLE"
]

public let colors =  [
	"Black",
	"Blue",
	"Brown",
	"Gray",
	"Green",
	"Orange",
	"Pink",
	"Purple",
	"Red",
	"Turquoise",
	"White",
	"Yellow"
]

// test harness
struct TestData {
	var name = """
	Tenofovir disoproxil fumarate 300 MG Oral Tablet [Viread]
	"""
	var ndc11 =	"59762-6733-01"
	var rxcuii =	404013
	var labeler = 	"Greenstone LLC"
	var image = UIImage()
	var imageUrl =	"""
	https://rximage.nlm.nih.gov/image/images/gallery/
	original/61958-0401-01_RXNAVIMAGE10_B81DDC0E.jpg
	"""
}

var test = TestData()

