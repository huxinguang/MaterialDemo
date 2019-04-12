//
//	SomeType.swift
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import SwiftyJSON

struct SomeType{

	var address : Address?
	var isNonProfit : Bool?
	var links : [Link]?
	var name : String?
	var page : Int?
	var url : String?

	init(fromJson json: JSON){
        address = Address.init(fromJson: json["address"])
        isNonProfit = json["isNonProfit"].boolValue
        
        links = []
        for linkJson in json["links"].arrayValue {
            let link = Link.init(fromJson: linkJson)
            links?.append(link)
        }
        
        name = json["name"].stringValue
        page = json["page"].intValue
        url = json["url"].stringValue
	}

}
