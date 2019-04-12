//
//	Link.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/11.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

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
