//
//  ViewController.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/2.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import UIKit
import SnapKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    fileprivate lazy var btn: UIButton = {
        () -> UIButton in
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(self.onBtnClick), for: .touchUpInside)
        return btn
    }()
    
    fileprivate lazy var btn1: UIButton = {
        () -> UIButton in
        let btn1 = UIButton.init(type: .custom)
        btn1.backgroundColor = UIColor.blue
        btn1.addTarget(self, action: #selector(self.onBtn1Click), for: .touchUpInside)
        return btn1
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(self.btn)
        self.btn.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            make.size.equalTo(CGSize(width: 80, height: 40))
        }
        
        self.view.addSubview(self.btn1)
        self.btn1.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.btn.snp.top).offset(-10)
            make.size.equalTo(CGSize(width: 80, height: 40))
        }
        
        
//        let jsondic = Dictionary<String, Any>.readLocalJson(fileName: "test")
//        print(jsondic ?? [:]) // Dictionary打印在控制台，外层是[]
//
//        let ocDic:NSDictionary = jsondic! as NSDictionary
//        print(ocDic) // NSDictionary打印在控制台，外层是{}
        
        
        // SwiftyJSON
        let path = Bundle.main.path(forResource: "test", ofType: "json")
        let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path!))
        if let json = try?JSON.init(data: data!) {
//            let address = json["address"]
//            // 字段为null的情况
//            let street = address["street"].stringValue
//            self.btn1.setTitle(street, for: .normal)
            
            let st = SomeType.init(fromJson: json)
            let address = st.address!
            print(address.city!)
            
            
            
        }
        
        
        
        
    }
    
    @objc internal func onBtnClick() -> Void {
        
        MBProgressHUD.showTipMessageInView(message: "请求成功", hideDelay: 1)
//        MBProgressHUD.showActivityMessageInView(message: "奋力加载中...")
//        MBProgressHUD.showSuccessInView(message: "请求成功", hideDelay: 1)
//        MBProgressHUD.showErrorInView(message: "请求失败", hideDelay: 1)
//        MBProgressHUD.showInfoInView(message: "格式不正确", hideDelay: 1)
//        MBProgressHUD.showWarningInView(message: "非法字符", hideDelay: 1)
        
    }
    
    @objc internal func onBtn1Click() -> Void {
//        MBProgressHUD.hideHUD()
        
        
//        Alamofire.request("ddd", method: .post, parameters: <#T##Parameters?#>, encoding: URLEncoding.httpBody, headers: <#T##HTTPHeaders?#>)
        
        
//        UIImage.createImage(color: UIColor.red, size: CGSize(width: 11, height: 11))
        
        
        
    }
    


}

