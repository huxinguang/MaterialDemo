//
//  UIImage+YbsUtil.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/11.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import Foundation

extension UIImage{
    
    static func stretchImage(name:String!) -> UIImage? {
        var result: UIImage?
        if let image = UIImage.init(named: name)  {
             result = image.resizableImage(withCapInsets: UIEdgeInsets.init(top: image.size.height * 0.5, left: image.size.height * 0.5, bottom: image.size.height * 0.5, right: image.size.height * 0.5), resizingMode: .tile)
        }else{
            result = nil
        }
        return result
    }
    
    static func stretchImage(name:String!,insets:UIEdgeInsets!) -> UIImage? {
        var result: UIImage?
        if let image = UIImage.init(named: name)  {
            result = image.resizableImage(withCapInsets: insets, resizingMode: .tile)
        }else{
            result = nil
        }
        return result
    }
    
    static func createImage(color: UIColor!,size: CGSize!) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    

}
