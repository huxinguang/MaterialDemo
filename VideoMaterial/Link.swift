//
//	Link.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON

struct Link{

	var name : String?
	var url : String?

	init(fromJson json: JSON){
		name = json["name"].stringValue
		url = json["url"].stringValue
	}

}
