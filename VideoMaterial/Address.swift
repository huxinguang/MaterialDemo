//
//	Addres.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON

struct Address{

	var city : String?
	var country : String?
	var street : String?


	init(fromJson json: JSON){
		city = json["city"].stringValue
		country = json["country"].stringValue
		street = json["street"].stringValue
	}

}
