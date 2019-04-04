//
//  YbsApi.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/2.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import UIKit

class YbsApi: NSObject {
    
    static func baseUrl() -> String {
        return baseTestUrl
    }
    
    static func loginUrl() -> String {
        return baseUrl() + "app/login"
    }
    


    
    
}
