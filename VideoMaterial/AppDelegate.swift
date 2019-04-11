//
//  AppDelegate.swift
//  VideoMaterial
//
//  Created by xinguang hu on 2019/4/2.
//  Copyright © 2019 Yunbangshou. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sleep(1)
        
        UMConfigure.setEncryptEnabled(true)
        UMConfigure.setLogEnabled(false)
        UMConfigure.initWithAppkey(kUMengAppKey, channel: "App Store")
        self.configUApp()
        self.configUPush(launchOptions: launchOptions)
    
        return true
    }
    
    func configUApp(){
        MobClick.setScenarioType(.E_UM_NORMAL)
    }
    
    func configUPush(launchOptions: [UIApplication.LaunchOptionsKey: Any]?){
        // Push组件基本功能配置
        let entity = UMessageRegisterEntity.init()
        entity.types = Int(UInt8(UMessageAuthorizationOptions.badge.rawValue) | UInt8(UMessageAuthorizationOptions.sound.rawValue) | UInt8(UMessageAuthorizationOptions.alert.rawValue))
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
        } else {
            
        }
        
        UMessage.registerForRemoteNotifications(launchOptions: launchOptions, entity: entity) { (granted, error) in
            
        }

    }
    
    // iOS10以下使用这两个方法接收通知，
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        UMessage.setAutoAlert(false)
        if Int(UIDevice.current.systemVersion)! < 10 {
            UMessage.didReceiveRemoteNotification(userInfo)
        }
        
        completionHandler(UIBackgroundFetchResult.newData)
    }
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        let token = NSData(data: deviceToken).description.replacingOccurrences(of: "<", with: "").replacingOccurrences(of: ">", with: "").replacingOccurrences(of: " ", with: "")
        print(token)

    }
    
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        let userInfo = notification.request.content.userInfo
        if notification.request.trigger is UNPushNotificationTrigger {
            //应用处于前台时的远程推送接受
            //关闭友盟自带的弹出框
            UMessage.setAutoAlert(false)
            //必须加这句代码
            UMessage.didReceiveRemoteNotification(userInfo)

        }else {
            //应用处于后台时的本地推送接受
        }
        
        //当应用处于前台时提示设置，需要哪个可以设置哪一个
        completionHandler(UNNotificationPresentationOptions(rawValue: UNNotificationPresentationOptions.RawValue(UInt8(UNNotificationPresentationOptions.sound.rawValue) | UInt8(UNNotificationPresentationOptions.badge.rawValue) | UInt8(UNNotificationPresentationOptions.alert.rawValue))))
    }
    
    // iOS10新增：处理后台点击通知的代理方法
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let userInfo = response.notification.request.content.userInfo
        if response.notification.request.trigger is UNPushNotificationTrigger {
            //应用处于后台时的远程推送接受
            //必须加这句代码
            UMessage.didReceiveRemoteNotification(userInfo)
            
        } else {
            //应用处于后台时的本地推送接受
        }
        
    }
    

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

