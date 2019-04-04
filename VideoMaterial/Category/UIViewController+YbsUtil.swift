//
//  UIViewController+YbsUtil.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/3.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import Foundation
import UIKit

//private var kMBProgressHUDKey = "kMBProgressHUDKey"

extension UIViewController{
    
//    var hud: MBProgressHUD? {
//        get{
//           return (objc_getAssociatedObject(self, &kMBProgressHUDKey) as? MBProgressHUD)
//        }
//        set(newValue){
//            objc_setAssociatedObject(self, &kMBProgressHUDKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
//        }
//    }
    

    static func currentViewController() -> UIViewController {
        let viewController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!
        return UIViewController.findBestViewController(vc: viewController)
    }
    
    static func findBestViewController(vc :UIViewController) -> UIViewController {
        if vc.presentedViewController != nil {
            return UIViewController.findBestViewController(vc: vc.presentedViewController!)
        }else if vc.isKind(of: UISplitViewController.self){
            let svc: UISplitViewController = vc as! UISplitViewController
            if svc.viewControllers.count > 0 {
                return UIViewController.findBestViewController(vc: svc.viewControllers.last!)
            }else{
                return vc
            }
        }else if vc.isKind(of: UINavigationController.self){
            let nv: UINavigationController = vc as! UINavigationController
            if nv.viewControllers.count > 0{
                return UIViewController.findBestViewController(vc: nv.topViewController!)
            }else{
                return vc
            }
        }else if vc.isKind(of: UITabBarController.self){
            let tv: UITabBarController = vc as! UITabBarController
            if tv.viewControllers!.count > 0{
                return UIViewController.findBestViewController(vc: tv.selectedViewController!)
            }else{
                return vc
            }
        }else{
            return vc
        }
    }
    
    static func setStatusBar(hidden:Bool, animated:Bool) -> Void {
        let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
        if hidden {
            if animated {
                UIView.animate(withDuration: 0.3) {
                    statusBar.alpha = 0.0
                }
            }else{
                statusBar.alpha = 0.0
            }
        }else{
            if animated {
                UIView.animate(withDuration: 0.3) {
                    statusBar.alpha = 1.0
                }
            }else{
                statusBar.alpha = 1.0
            }
            
        }
        
    }
    
//    func showHUD(message:String,hideDelay:TimeInterval) -> Void {
//        let hud = MBProgressHUD.showAdded(to: self.view, animated: true)
//        hud.removeFromSuperViewOnHide = true
//        hud.mode = .text
//        hud.label.text = message
//        hud.label.textColor = UIColor.white
//        hud.label.numberOfLines = 0
//        hud.label.font = UIFont.systemFont(ofSize: 15)
//        hud.bezelView.backgroundColor = UIColor.black
//        hud.margin = 12.5
//        hud.hide(animated: true, afterDelay: hideDelay)
//    }
//    
//    func showHUDToWindow(message:String,hideDelay:TimeInterval) -> Void {
//        let hud = MBProgressHUD.showAdded(to: UIApplication.shared.keyWindow!, animated: true)
//        hud.removeFromSuperViewOnHide = true
//        hud.mode = .text
//        hud.label.text = message
//        hud.label.textColor = UIColor.white
//        hud.label.numberOfLines = 0
//        hud.label.font = UIFont.systemFont(ofSize: 15)
//        hud.bezelView.backgroundColor = UIColor.black
//        hud.margin = 12.5
//        hud.hide(animated: true, afterDelay: hideDelay)
//    }
    
    
    
    
    
    
    
    
    
    

}
