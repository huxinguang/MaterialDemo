//
//	Address.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/11.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

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
