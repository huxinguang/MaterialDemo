//
//  YbsConstant.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/2.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import UIKit


//############################ AppDelegate ###########################

let kAppDelegate = UIApplication.shared.delegate as! AppDelegate

//############################## 屏幕适配 ##############################

let kScreenHeight = UIScreen.main.bounds.height
let kScreenWidth  = UIScreen.main.bounds.width

//判断是否为iPad
let IsPad = (UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad)

//判断是否iPhone X/Xs
let IS_iPhoneX_Or_Xs = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (CGSize.init(width: 1125, height: 2436) == UIScreen.main.currentMode!.size) && !IsPad : false)

//判断iPHoneXr
let Is_iPhoneXr1 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (CGSize.init(width: 828, height: 1792) == UIScreen.main.currentMode!.size) && !IsPad : false)

let Is_iPhoneXr2 = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (CGSize.init(width: 750, height: 1624) == UIScreen.main.currentMode!.size) && !IsPad : false)

//判断iPhoneXs Max
let IS_iPhoneXs_Max = (UIScreen.instancesRespond(to: #selector(getter: UIScreen.currentMode)) ? (CGSize.init(width: 1242, height: 2688) == UIScreen.main.currentMode!.size) && !IsPad : false)

//判断是否为带刘海的iPhone
let IS_X_Series = (IS_iPhoneX_Or_Xs || Is_iPhoneXr1 || Is_iPhoneXr2 || IS_iPhoneXs_Max)

//状态栏高度
let kStatusBarHeight = (IS_X_Series ? 44.0 : 20.0)

//导航栏高度（不包含状态栏）
let kNavigationBarHeight = 44.0

//Tabbar 高度
let kTabbarHeight = (IS_X_Series ? (49.0 + 34.0) : 49.0)

//Tabbar 底部安全距离
let kTabbarSafeBottomMargin = (IS_X_Series ? 34.0 : 0.0)

//状态栏和导航栏总高度
let kStatusBarAndNavigationBarHeight = (IS_X_Series ? 88.0 : 64.0)


//################################ 接口 ###############################
let baseReleaseUrl = "https://api.yun-bangshou.com:8088/"
let baseDebugUrl = "http://62.234.107.96:8088/"
let baseTestUrl = "http://62.234.107.173:8088/"


//############################## 接口状态码 ############################
let kSuccessCode = "0000"
let kCodeKey = "code"
let kDataKey = "data"
let kMessageKey = "message"
let kTokenExpiredCode = "5555"

//############################## 第三方SDK #############################

//bugly
let kBuglyAppID = "61f55aada7"
let kBuglyAppKey = "d3c9de1b-f2ab-405b-8cbf-f55f70596bce"

//Getui
let kGtAppId = "zuGIBQNoAo8EPgcNI52Q18"
let kGtAppKey = "bAyknCYsTr8qRwOonA0EN1"
let kGtAppSecret = "BfoyYR9u1S86TPkqbS4Ob5"










