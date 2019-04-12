//
//  Dictionary+YbsUtil.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/11.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import Foundation

extension Dictionary{
    
    static func readLocalJson(fileName:String!) -> Dictionary? {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json")  {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)){
                let json = try?JSONSerialization.jsonObject(with: data, options: .allowFragments)
                if json != nil{
                    return json as? Dictionary
                }else{
                    return nil
                }

            }else{
                return nil
            }

        }else{
            return nil
        }
    }

    
}
