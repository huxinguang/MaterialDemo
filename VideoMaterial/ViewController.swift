//
//  ViewController.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/2.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import UIKit
import PKHUD
import SnapKit

class ViewController: UIViewController {
    
    fileprivate lazy var btn: UIButton = {
        () -> UIButton in
        let btn = UIButton.init(type: .custom)
        btn.backgroundColor = UIColor.green
        btn.addTarget(self, action: #selector(self.onBtnClick), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        self.view.addSubview(self.btn)
        self.btn.snp.makeConstraints { (make) in
            make.center.equalTo(self.view)
            make.size.equalTo(CGSize(width: 80, height: 40))
        }
        
    }
    
    @objc internal func onBtnClick() -> Void {
        print("点击了按钮")
    }
    


}

